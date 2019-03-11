# canal同步出现` dump address /120.78.135.198:3306 has an error, retrying. caused by java.lang.IllegalArgumentException: null `

```console
2019-01-04 16:47:56.794 [destination = example , address = /120.78.135.198:3306 , EventParser] WARN c.a.o.c.p.inbound.mysql.rds.RdsBinlogEventParserProxy - find start position : EntryPosition[included=false,ournalName=mysql-bin.000001,position=1257,serverId=12,gtid=<null>,timestamp=1546591610000]
2019-01-04 16:47:56.837 [destination = example , address = /120.78.135.198:3306 , EventParser] ERROR c.a.o.c.p.inbound.mysql.rds.RdsBinlogEventParserProxy - dump address /120.78.135.198:3306 has an error, retrying. caused by 
java.lang.IllegalArgumentException: null
	at java.util.concurrent.ThreadPoolExecutor.<init>(ThreadPoolExecutor.java:1314) ~[na:1.8.0_144]
	at java.util.concurrent.ThreadPoolExecutor.<init>(ThreadPoolExecutor.java:1237) ~[na:1.8.0_144]
	at java.util.concurrent.Executors.newFixedThreadPool(Executors.java:151) ~[na:1.8.0_144]
	at com.alibaba.otter.canal.parse.inbound.mysql.MysqlMultiStageCoprocessor.start(MysqlMultiStageCoprocessor.java:84) ~[canal.parse-1.1.0.jar:na]
	at com.alibaba.otter.canal.parse.inbound.AbstractEventParser$3.run(AbstractEventParser.java:238) ~[canal.parse-1.1.0.jar:na]
	at java.lang.Thread.run(Thread.java:748) [na:1.8.0_144]
2019-01-04 16:47:56.838 [destination = example , address = /120.78.135.198:3306 , EventParser] ERROR com.alibaba.otter.canal.common.alarm.LogAlarmHandler - destination:example[java.lang.IllegalArgumentException
	at java.util.concurrent.ThreadPoolExecutor.<init>(ThreadPoolExecutor.java:1314)
	at java.util.concurrent.ThreadPoolExecutor.<init>(ThreadPoolExecutor.java:1237)
	at java.util.concurrent.Executors.newFixedThreadPool(Executors.java:151)
	at com.alibaba.otter.canal.parse.inbound.mysql.MysqlMultiStageCoprocessor.start(MysqlMultiStageCoprocessor.java:84)
	at com.alibaba.otter.canal.parse.inbound.AbstractEventParser$3.run(AbstractEventParser.java:238)
	at java.lang.Thread.run(Thread.java:748)
]
2019-01-04 16:48:14.865 [destination = example , address = /120.78.135.198:3306 , EventParser] WARN  c.a.o.c.p.inbound.mysql.rds.RdsBinlogEventParserProxy - prepare to find start position just show master status
2019-01-04 16:51:27.219 [Thread-6] INFO  c.a.otter.canal.instance.core.AbstractCanalInstance - stop CannalInstance for null-example 
2019-01-04 16:51:28.046 [destination = example , address = /120.78.135.198:3306 , EventParser] ERROR c.a.o.c.p.inbound.mysql.rds.RdsBinlogEventParserProxy - ERROR ## findAsPerTimestampInSpecificLogFile has an error
java.nio.channels.ClosedByInterruptException: null
	at com.alibaba.otter.canal.parse.driver.mysql.socket.BioSocketChannel.read(BioSocketChannel.java:116) ~[canal.parse.driver-1.1.0.jar:na]
	at com.alibaba.otter.canal.parse.inbound.mysql.dbsync.DirectLogFetcher.fetch0(DirectLogFetcher.java:174) ~[canal.parse-1.1.0.jar:na]
	at com.alibaba.otter.canal.parse.inbound.mysql.dbsync.DirectLogFetcher.fetch(DirectLogFetcher.java:77) ~[canal.parse-1.1.0.jar:na]
	at com.alibaba.otter.canal.parse.inbound.mysql.MysqlConnection.seek(MysqlConnection.java:130) ~[canal.parse-1.1.0.jar:na]
	at com.alibaba.otter.canal.parse.inbound.mysql.MysqlEventParser.findAsPerTimestampInSpecificLogFile(MysqlEventParser.java:733) [canal.parse-1.1.0.jar:na]
	at com.alibaba.otter.canal.parse.inbound.mysql.MysqlEventParser.findEndPositionWithMasterIdAndTimestamp(MysqlEventParser.java:388) [canal.parse-1.1.0.jar:na]
	at com.alibaba.otter.canal.parse.inbound.mysql.MysqlEventParser.findStartPositionInternal(MysqlEventParser.java:443) [canal.parse-1.1.0.jar:na]
	at com.alibaba.otter.canal.parse.inbound.mysql.MysqlEventParser.findStartPosition(MysqlEventParser.java:362) [canal.parse-1.1.0.jar:na]
	at com.alibaba.otter.canal.parse.inbound.AbstractEventParser$3.run(AbstractEventParser.java:182) [canal.parse-1.1.0.jar:na]
	at java.lang.Thread.run(Thread.java:748) [na:1.8.0_144]
2019-01-04 16:51:28.047 [destination = example , address = /120.78.135.198:3306 , EventParser] WARN  c.a.o.c.p.inbound.mysql.rds.RdsBinlogEventParserProxy - find start position : EntryPosition[included=false,journalName=mysql-bin.000001,position=1687,serverId=12,gtid=<null>,timestamp=1546591682000]
2019-01-04 16:51:28.089 [destination = example , address = /120.78.135.198:3306 , EventParser] ERROR c.a.o.c.p.inbound.mysql.rds.RdsBinlogEventParserProxy - parse events has an error
com.alibaba.otter.canal.parse.exception.CanalParseException: dump address /120.78.135.198:3306 has an error, retrying. 
Caused by: java.lang.IllegalArgumentException: null
	at java.util.concurrent.ThreadPoolExecutor.<init>(ThreadPoolExecutor.java:1314) ~[na:1.8.0_144]
	at java.util.concurrent.ThreadPoolExecutor.<init>(ThreadPoolExecutor.java:1237) ~[na:1.8.0_144]
	at java.util.concurrent.Executors.newFixedThreadPool(Executors.java:151) ~[na:1.8.0_144]
	at com.alibaba.otter.canal.parse.inbound.mysql.MysqlMultiStageCoprocessor.start(MysqlMultiStageCoprocessor.java:84) ~[canal.parse-1.1.0.jar:na]
	at com.alibaba.otter.canal.parse.inbound.AbstractEventParser$3.run(AbstractEventParser.java:238) ~[canal.parse-1.1.0.jar:na]
	at java.lang.Thread.run(Thread.java:748) ~[na:1.8.0_144]


```

原因在 canal1.1.0版本中，`canal.properties`中没有配置`canal.instance.parser.parallelThreadSize=256`默认好像是256，这里就是cpu核数的问题。

解决办法是更改虚拟机配置，设置成2个或以上cpu就能解决问题。通过对问题的分析，对于单cpu的物理机，无法通过修改cpu数量的情况，可以通过配置文件解决。
`canal.instance.parser.parallelThreadSize = 1`,解决即可。

```css
/** SDFF **/
.CONTENT{
	color:red;
}
```