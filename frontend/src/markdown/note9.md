# `mongo`数据库导入`mysql`数据库
*最近项目做了个定时器，由于之前是python做的，最近重构成了java，感觉mysql还是比mongo稳定，更加符合项目管理要求，重构之后需要把以前的mongo数据导入到mysql记录如下*

进入自己服务器（mongo所在的服务器）：
`/usr/bin/mongoexport -h 127.0.0.1 -u root -p shen@9527 -d TimerService -c timer_point -f _id,timer_status,timer_time,timer_data,timer_action,timer_object_id,timer_type  --type=csv -o /var/share/TimerPoint.csv`

有权限的 `/usr/bin/mongoexport -h 127.0.0.1 -u admin -p GrxchH6Yh3yxyZ --authenticationDatabase=admin  -d TimerService -c timer_server -f timer_status,timer_time,timer_data,timer_action,timer_object_id,timer_object_interval,timer_type,timer_user_id  --type=csv -o /var/share/TimerServer.csv`

`/usr/bin/mongoexport` 可能和我的位置不一样自行调整
```shell
-h  #是记录本机（mongo）ip
-u  #mongo用户名
-p  #mongo密码
-d  #数据库名称
-c  #集合名称
-f  #导出的字段
--type #导出的数据文件类型
-o  #导出的文件路径
```
导出之后文件格式如下
```csv
_id,timer_status,timer_time,timer_data,timer_action,timer_object_id,timer_type
0,528202844,"{'flag': 4, 'userId': 'd5b107dd-ccad-43ff-a0f0-8421c73aea62', 'requestId': 1192, 'taskStatus': 1}",0,528202724,1
0,527696000,"{'flag': 3, 'taskId': '76f84e0a-579c-435e-a98b-83faa2a46842'}",0,528173978,1
0,528202958,{'userId': 'd5b107dd-ccad-43ff-a0f0-8421c73aea62'},1,528202778,1
0,524470400,"{'taskId': 'c0d12a8c-1426-4ba6-9b3c-d29b76cb140d', 'flag': 3}",0,528175961,1
0,528204941,{'userId': 'd5b107dd-ccad-43ff-a0f0-8421c73aea62'},1,528204761,1
0,524470400,"{'taskId': 'dc240521-957f-4ef2-90be-ea76eb5411dc', 'flag': 3}",0,528176647,1
0,535981446,{'userId': 'd5b107dd-ccad-43ff-a0f0-8421c73aea62'},1,528205446,1
0,524470400,"{'taskId': 'a6e028ae-2065-4516-bc18-8865b8a90437', 'flag': 3}",0,528177282,1
0,528265940,"{'taskStatus': 1, 'flag': 4, 'userId': 'd5b107dd-ccad-43ff-a0f0-8421c73aea62', 'requestId': 1195}",0,528265820,1
O0,531148400,"{'flag': 3, 'taskId': '724cbe1d-3cc3-4483-93ee-590c18fbe907'}",0,528657686,1
0,531148400,"{'flag': 3, 'taskId': '75434d01-b13d-4c3e-8226-f1aa8a888092'}",0,528677908,1
0,540955336,"{'flag': 3, 'taskId': 'fe885ad1-682c-4593-aa34-94776cc893f5'}",0,529627052,1
0,545967065,"{'flag': 3, 'taskId': '5a7dd4ec-1b3b-4124-bc93-e522916f9a73'}",0,529627105,1

```
接下来是导入`mysql`工作了，
进入`mysql` shell界面执行如下命令：
```shell
load data infile 'C:\\ProgramData\\MySQL\\MySQL Server 5.7\\Uploads\\TimerPoint.csv'
into table `timer_point_server`
fields terminated by ','  optionally enclosed by '"'
lines terminated by '\n'
ignore 1 lines;
```
如果指定列，查看官网语法：
```shell
LOAD DATA [LOW_PRIORITY | CONCURRENT] [LOCAL] INFILE 'file_name'
    [REPLACE | IGNORE]
    INTO TABLE tbl_name
    [CHARACTER SET charset_name]
    [{FIELDS | COLUMNS}
        [TERMINATED BY 'string']
        [[OPTIONALLY] ENCLOSED BY 'char']
        [ESCAPED BY 'char']
    ]
    [LINES
        [STARTING BY 'string']
        [TERMINATED BY 'string']
    ]
    [IGNORE number {LINES | ROWS}]
    [(col_name_or_user_var
        [, col_name_or_user_var] ...)]
    [SET col_name={expr | DEFAULT},
        [, col_name={expr | DEFAULT}] ...]
```
我的是：
```shell
load data infile 'C:\\ProgramData\\MySQL\\MySQL Server 5.7\\Uploads\\TimerPoint.csv'
into table `timer_point_server`
fields terminated by ','  optionally enclosed by '"' (timer_status,timer_time,timer_data,timer_action,timer_object_id,timer_type)
lines terminated by '\n'
ignore 1 lines;
```
中间可能遇到的问题有：
`too many positional arguments:`检查拼写

`The MySQL server is running with the --secure-file-priv option so it cannot execute this statement`:执行 `show global variables like '%secure%';`查看文件路径，将csv拷贝到下面去

里面字段如果有引号的需要执行语句
```shell
show variables like 'sql_mode';
set sql_mode='';
```


更多的需要看官网解释 [load data](https://dev.mysql.com/doc/refman/5.5/en/load-data.html)

转载请说明出处：

