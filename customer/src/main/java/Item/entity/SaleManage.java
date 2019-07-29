package Item.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SaleManage {
    private Integer id;                     //自增ID
    private Integer salesId;               //销售机会编号
    private String opportunitySource;       //销售机会名称
    private String customerName;                  //客户名称
    private String successProbability;   //成功几率
    private String outline;            //概要

    private Integer contactsId;          //联系人编号
    private String contacts;             //联系人
    private String contactsTel;         //联系电话
    private String opportunityDecs;   //机会描述

    private Integer foundId;              //创建人编号
    private String foundName;              //创建人名称
    private String creationTime;    //创建时间
    private String status;                 //状态（默认为0：未指派）

    private Integer assignId;             //指派人编号
    private String assignName;             //指派人名称
    private String assignTime;      //指派时间

    private String drawStatus;      //开发计划状态

    private Integer opportunityId;   //开发销售机会编号
    private String planItem;        //计划项
    private String planResult;     //执行效果
    private String drawTime;        //执行计划时间

}
