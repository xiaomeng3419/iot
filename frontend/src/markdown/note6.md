# `mysql ` 百万级数据查询优化笔记：

* 方法一：建立索引

1.1、索引类别:
`unique` : 唯一索引

```java 
package com.ssm.TaskManagementServer.domain.user.role.order;

import com.ssm.TaskManagementServer.constant.Type;
import lombok.Data;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by zhangpan on 2018/6/22.
 */
@Data
public class Order {
    private Map<String, Object> priCheckEme = new HashMap<String, Object>();
    private Map<String, Object> priCheck = new HashMap<String, Object>();

    private Map<String, Object> subCheckEme = new HashMap<String, Object>();;
    private Map<String, Object> subCheck = new HashMap<String, Object>();;

    private Map<String, Object> priUserEme = new HashMap<String, Object>();
    private Map<String, Object> priUser = new HashMap<String, Object>();

    private Map<String, Object> subUserEme = new HashMap<String, Object>();
    private Map<String, Object> subUser = new HashMap<String, Object>();
    private Order(){
        //主审紧急
        priCheckEme.put("rank",Type.UserRoleOrder.PRICHECKEME.getRank());
        priCheckEme.put("taskType",Type.UserRoleOrder.PRICHECKEME.getType());
        //主审一般
        priCheck.put("rank",Type.UserRoleOrder.PRICHECK.getRank());
        priCheck.put("taskType",Type.UserRoleOrder.PRICHECK.getType());
        //从审紧急
        subCheckEme.put("rank",Type.UserRoleOrder.SUBCHECKEME.getRank());
        subCheckEme.put("taskType",Type.UserRoleOrder.SUBCHECKEME.getType());
        //从审一般
        subCheck.put("rank",Type.UserRoleOrder.SUBCHECK.getRank());
        subCheck.put("taskType",Type.UserRoleOrder.SUBCHECK.getType());
        //主打紧急
        priUserEme.put("rank",Type.UserRoleOrder.PRIUSEREME.getRank());
        priUserEme.put("taskType",Type.UserRoleOrder.PRIUSEREME.getType());
        //主打一般
        priUser.put("rank",Type.UserRoleOrder.PRIUSER.getRank());
        priUser.put("taskType",Type.UserRoleOrder.PRIUSER.getType());
        //从打紧急
        subUserEme.put("rank",Type.UserRoleOrder.SUBUSEREME.getRank());
        subUserEme.put("taskType",Type.UserRoleOrder.SUBUSEREME.getType());
        //从打一般
        subUser.put("rank",Type.UserRoleOrder.SUBUESER.getRank());
        subUser.put("taskType",Type.UserRoleOrder.SUBUESER.getType());
    }

    private static Order taskOrder = new Order();
    public static Order getInstance(){
        return taskOrder;
    }
    public static void main(String[] args)
    {
        Type.FileTypeEnum[] fileTypeEnums = {Type.FileTypeEnum.PDF, Type.FileTypeEnum.DOC, Type.FileTypeEnum.DOCX};
        for (int i = 0 ; i <fileTypeEnums.length;i++){
            System.out.println("-----------------------------------suffix");
            System.out.println(fileTypeEnums[i].getSuffix());
            System.out.println("-----------------------------------type");
            System.out.println(fileTypeEnums[i].getType());
        }
    }
}

```