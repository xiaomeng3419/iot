# 使用Canal实现redis和mysql的同步

 ### canal 工作思路

 Canal 会将自己伪装成 MySQL 从节点（Slave），并从主节点（Master）获取 Binlog，解析和贮存后供下游消费端使用。Canal 包含两个组成部分：服务端和客户端。服务端负责连接至不同的 MySQL 实例，并为每个实例维护一个事件消息队列；客户端则可以订阅这些队列中的数据变更事件，处理并存储到数据仓库中。下面我们将mysql同步到 redis


*mysql版本 5.6*

*canal版本 1.1.0*

安装 mysql 后修改自己mysql配置

`vim /etc/my.cnf`
```shell
# 开启mysql的binlog模块
log-bin=mysql-bin
binlog-format=ROW
# server_id需保证唯一，不能和canal的slaveId重复
server_id=121
# 需要同步的数据库名称
binlog-do-db=test_canal
# 忽略的数据库，建议填写
binlog-ignore-db=mysql
# 启动mysql时不启动grant-tables授权表
skip-grant-tables
```

创建一个mysql用户`canal` 并且赋远程链接权限权限，和测试库`test_canal`,
```shell
CREATE USER canal IDENTIFIED BY 'canal';
GRANT ALL PRIVILEGES ON test_canal.user TO 'canal'@'%';
FLUSH PRIVILEGES;
```

使用root账户进去看看
`select * from mysql.user where user=’canal’ \G`其查询结果列表中`Repl_slave_priv`,`Repl_client_priv`中的为Y是对的,

* Canal部分

下载canal：[https://github.com/alibaba/canal/releases/ ](https://github.com/alibaba/canal/releases/ )

下载版本为1.1.0，解压即可

tar -zxvf canal.deployer-1.1.0.tar.gz -C /usr/local/cancal/


解压后得到四个目录bin、conf、lib、logs 
基本上配置都在一下两个配置文件中

`canal.properties无需修改 ，instance.properties需要配置所同步的组件`

`instance.properties`配置如下
```properties
#################################################
## mysql serverId , v1.0.26+ will autoGen 
#与mysql配置文件一致
canal.instance.mysql.slaveId=121

# enable gtid use true/false
canal.instance.gtidon=false

# position info
canal.instance.master.address=ip:3306
canal.instance.master.journal.name=
canal.instance.master.position=
canal.instance.master.timestamp=
canal.instance.master.gtid=

# rds oss binlog
canal.instance.rds.accesskey=
canal.instance.rds.secretkey=
canal.instance.rds.instanceId=

# table meta tsdb info 
#暂时用不上设为false
canal.instance.tsdb.enable=false
canal.instance.tsdb.dir=${canal.file.data.dir:../conf}/${canal.instance.destination:}
canal.instance.tsdb.url=jdbc:h2:${canal.instance.tsdb.dir}/h2;CACHE_SIZE=1000;MODE=MYSQL;
#canal.instance.tsdb.url=jdbc:mysql://127.0.0.1:3306/canal_tsdb
canal.instance.tsdb.dbUsername=canal
canal.instance.tsdb.dbPassword=canal

#canal.instance.standby.address =
#canal.instance.standby.journal.name =
#canal.instance.standby.position = 
#canal.instance.standby.timestamp =
#canal.instance.standby.gtid=

# username/password
canal.instance.dbUsername=canal
canal.instance.dbPassword=canal
canal.instance.defaultDatabaseName=test_canal
canal.instance.connectionCharset=UTF-8

# table regex
canal.instance.filter.regex=.*\\..*
# table black regex
canal.instance.filter.black.regex=
#################################################

```
查看日志是否启动成功:`logs/canal/canal.log 和logs/example/example.log`

logs/canal/canal.log文件中有如下内容：`the canal server is running now ......
`
logs/example/example.log文件中有如下内容：`start successful....`

### Java的canal客户端和jedis

在项目maven中添加redis和canal依赖
```properties
<dependency>
     <groupId>com.alibaba.otter</groupId>
     <artifactId>canal.client</artifactId>
     <version>1.0.25</version>
 </dependency>
 <dependency>
     <groupId>redis.clients</groupId>
     <artifactId>jedis</artifactId>
     <version>2.9.0</version>
 </dependency>
```

redis工具类：
```java
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

/**
 * @author lgz
 */
public class RedisUtil {

    private static Jedis jedis = null;

    public static synchronized Jedis getJedis() {
        if (jedis == null) {
            jedis = new Jedis("192.168.188.128", 6379);
            jedis.auth("redis1234");
        }
        return jedis;
    }

    public static boolean existKey(String key) {
        return getJedis().exists(key);
    }

    public static void delKey(String key) {
        getJedis().del(key);
    }

    public static String stringGet(String key) {
        return getJedis().get(key);
    }

    public static String stringSet(String key, String value) {
        return getJedis().set(key, value);
    }

    public static void hashSet(String key, String field, String value) {
        getJedis().hset(key, field, value);
    }
}

```
canal客户端：
```java
package com.wlx.demo.config;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.otter.canal.client.CanalConnector;
import com.alibaba.otter.canal.client.CanalConnectors;
import com.alibaba.otter.canal.protocol.CanalEntry.*;
import com.alibaba.otter.canal.protocol.Message;

import java.net.InetSocketAddress;
import java.util.List;
/**
 * Created by zhangpan on 2019/1/4.
 */
public class CanalApplication {

    public static void main(String args[]) {
        CanalConnector connector = CanalConnectors.newSingleConnector(new InetSocketAddress("ip",
                11111), "example", "", "");
        int batchSize = 100;
        try {
            connector.connect();
            connector.subscribe(".*\\..*");
            connector.rollback();
            while (true) {
                // 获取指定数量的数据
                Message message = connector.getWithoutAck(batchSize);
                long batchId = message.getId();
                int size = message.getEntries().size();
                System.out.println("batchId = " + batchId);
                System.out.println("size = " + size);
                if (batchId == -1 || size == 0) {
                    try {
                        Thread.sleep(1000);
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                } else {
                    printEntry(message.getEntries());
                }
                // 提交确认
                connector.ack(batchId);
                // connector.rollback(batchId); // 处理失败, 回滚数据
            }
        } finally {
            connector.disconnect();
        }
    }

    private static void printEntry(List<Entry> entrys) {
        for (Entry entry : entrys) {
            if (entry.getEntryType() == EntryType.TRANSACTIONBEGIN || entry.getEntryType() == EntryType.TRANSACTIONEND) {
                continue;
            }
            RowChange rowChage = null;
            try {
                rowChage = RowChange.parseFrom(entry.getStoreValue());
            } catch (Exception e) {
                throw new RuntimeException("ERROR ## parser of eromanga-event has an error , data:" + entry.toString(),
                        e);
            }
            EventType eventType = rowChage.getEventType();
            System.out.println(String.format("================> binlog[%s:%s] , name[%s,%s] , eventType : %s",
                    entry.getHeader().getLogfileName(), entry.getHeader().getLogfileOffset(),
                    entry.getHeader().getSchemaName(), entry.getHeader().getTableName(),
                    eventType));

            for (RowData rowData : rowChage.getRowDatasList()) {
                if (eventType == EventType.DELETE) {
                    redisDelete(rowData.getBeforeColumnsList());
                } else if (eventType == EventType.INSERT) {
                    redisInsert(rowData.getAfterColumnsList());
                } else {
                    System.out.println("-------> before");
                    printColumn(rowData.getBeforeColumnsList());
                    System.out.println("-------> after");
                    redisUpdate(rowData.getAfterColumnsList());
                }
            }
        }
    }

    private static void printColumn(List<Column> columns) {
        for (Column column : columns) {
            System.out.println(column.getName() + " : " + column.getValue() + "    update=" + column.getUpdated());
        }
    }

    private static void redisInsert(List<Column> columns) {
        JSONObject json = new JSONObject();
        for (Column column : columns) {
            json.put(column.getName(), column.getValue());
        }
        if (columns.size() > 0) {
            RedisUtil.stringSet("user:" + columns.get(0).getValue(), json.toJSONString());
        }
    }

    private static void redisUpdate(List<Column> columns) {
        JSONObject json = new JSONObject();
        for (Column column : columns) {
            json.put(column.getName(), column.getValue());
        }
        if (columns.size() > 0) {
            RedisUtil.stringSet("user:" + columns.get(0).getValue(), json.toJSONString());
        }
    }

    private static void redisDelete(List<Column> columns) {
        JSONObject json = new JSONObject();
        for (Column column : columns) {
            json.put(column.getName(), column.getValue());
        }
        if (columns.size() > 0) {
            RedisUtil.delKey("user:" + columns.get(0).getValue());
        }
    }
}

```

在`test_canal`新建`user`表，
```sql
CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
```
添加数据可以在控制台看到消息：
`INSERT INTO `user` (id,name) VALUES (1,'zhangpan');`

控制台消息
```console
size = 3
================> binlog[mysql-bin.000005:5001] , name[test_canal,user] , eventType : INSERT
```

参考博客：https://blog.csdn.net/lyl0724/article/details/80528428






