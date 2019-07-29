package Item.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CustomerManage {
    private Integer customerId;         //客户编号
    private Integer customerMgrID;    //客户经理id
    private String customerName;      //客户名称
    private String city;                  //地区
    private String customerMgr;       //客户经理
    private String customerGrade;      //客户登记
    private String customerSatisfaction;    //客户满意度
    private String customerCredit;       //客户信用
    private String address;                 //地址
    private String postalCode;           //邮政编码
    private String phone;                  //电话
    private String fax;                    //传真
    private String url;                  //网址
    private String businessLicense;   //营业执照注册号
    private double registeredCapital;   //注册资金
    private String jurrdicalPerson;    //法人
    private double annualSales;       //年营业额
    private String depositBank;      //开户银行
    private String bankAccount;      //银行账户
    private String LandTaxCode;      //地税登记号
    private String centralTax;       //国税登记号
    private String founder;             //创建人
    private Integer founderId;           //创建人id
    private String creationTime;       //创建时间
}