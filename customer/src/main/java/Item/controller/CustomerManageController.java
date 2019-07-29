package Item.controller;
/*
    create :czx
    time:2018-11-22
 */

import Item.entity.*;
import Item.service.CustomerManageService;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.apache.log4j.helpers.DateTimeDateFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.ui.Model;

import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;

@Controller
@RequestMapping("/customer")
public class CustomerManageController {
    @Autowired
    private CustomerManageService customerManageService;


    /*---------------------客户信息-------------------------*/
    //通过客户编号查询客户信息
    @RequestMapping("/findById")
    public String fingById(Integer id, Model model){

        CustomerManage customerManage =customerManageService.findById(id);
        //System.out.println(customerManage);
        model.addAttribute("customer",customerManage);
        return "customer/customer";
    }

    //查询所有客户信息
    @RequestMapping("/findAll")
    public String findAll(Model model){
        List<CustomerManage> list=customerManageService.findAll();
        model.addAttribute("list",list);
        return "customer/list";
    }

    //模糊查询客户信息
    @RequestMapping("/search")
    public String search(Model model,String search){
        List<CustomerManage>list =customerManageService.search(search);
        model.addAttribute("list",list);
        return "customer/list";
    }

    //删除客户，对应的联系人也会被删除
    @RequestMapping("/del")
    public String del(Integer id,Model model){
        boolean flg=customerManageService.del(id);
       // System.out.println(flg);
        List<CustomerManage> list=customerManageService.findAll();
        model.addAttribute("list",list);

        model.addAttribute("del","删除成功！");

        return "customer/list";
    }

    //前往客户详细界面，可编辑
    @RequestMapping("/toedit")
    public String toedit(Model model,Integer id){
        CustomerManage customerManage =customerManageService.findById(id);
        model.addAttribute("customer",customerManage);
        return "customer/edit";
    }
    //保存客户的信息
    @RequestMapping("/edit")
    public String edit(Model model,CustomerManage customerManage){
        //System.out.println(customerManage);
        boolean flg =customerManageService.edit(customerManage);
        List<CustomerManage> list=customerManageService.findAll();
        model.addAttribute("list",list);
        model.addAttribute("del","保存成功！");
        return "customer/list";
    }

    /*---------------------客户信息-------------------------*/


    /*---------------------联系人信息-------------------------*/
    //根据客户编号查询所有联系人信息
    @RequestMapping("/findContactById")
    public String findContactById(Integer id,Model model){
        List<CustomerContact> list=customerManageService.findContactById(id);

        CustomerManage customerManage =customerManageService.findById(id);
       // System.out.println(customerManage);
        //System.out.println(list);
        model.addAttribute("customer",customerManage);
        model.addAttribute("list",list);
        return "customer/contact";
    }

    //新增对应客户编号的联系人
    @RequestMapping("/savecontact")
    public String savecontac(CustomerContact customerContact,Model model){
        boolean flg = customerManageService.savecontact(customerContact);

        Integer id = customerContact.getCustomerId();
        List<CustomerContact> list=customerManageService.findContactById(id);

        CustomerManage customerManage =customerManageService.findById(id);
        model.addAttribute("customer",customerManage);
        model.addAttribute("list",list);
        model.addAttribute("del","保存成功！");
        return "customer/contact";
    }
    //根据客户编号，前往新增联系人
    @RequestMapping("/tonewcontact")
    public String tonewcontact(Integer id,Model model){
        model.addAttribute("id",id);
        return "customer/newcontact";
    }

    //根据联系人编号删除联系人信息
    @RequestMapping("/delcontact")
    public String delcontact(Integer id,Model model){
        CustomerContact customerContact = customerManageService.findContactByContactId(id);
        //System.out.println(customerContact);
        Integer customerId = customerContact.getCustomerId();
        boolean flg=customerManageService.delcontact(id);


        List<CustomerContact> list=customerManageService.findContactById(customerId);

        CustomerManage customerManage =customerManageService.findById(customerId);
        model.addAttribute("customer",customerManage);
        model.addAttribute("list",list);

        model.addAttribute("del","删除成功！");

        return "customer/contact";

    }

    //根据联系人编号修改联系人信息
    @RequestMapping("/toeditcontact")
    public String toeditcontact(Model model,Integer id){
        CustomerContact contact = customerManageService.findContactByContactId(id);
        model.addAttribute("contact",contact);
        model.addAttribute("del","保存成功！");
        return "customer/editcontact";
    }
    //更新联系人信息
    @RequestMapping("/editcontact")
    public String editcontact(Model model,CustomerContact customerContact){
        //System.out.println(customerContact);

        boolean flg =customerManageService.editcontact(customerContact);


        Integer id = customerContact.getCustomerId();
        List<CustomerContact> list=customerManageService.findContactById(id);

        CustomerManage customerManage =customerManageService.findById(id);
        model.addAttribute("customer",customerManage);
        model.addAttribute("list",list);
        model.addAttribute("del","保存成功！");
        return "customer/contact";
    }
    /*---------------------联系人信息-------------------------*/



    /*---------------------交往记录管理-------------------------*/

    //根据客户编号查询所有交往记录
    @RequestMapping("/record")
    public String record(Model model,Integer id){
        CustomerManage customerManage =customerManageService.findById(id);

        List<Record> record =customerManageService.findRecordByCustomerId(id);
        model.addAttribute("record",record);
        record.forEach(System.out::println);
        model.addAttribute("customer",customerManage);
        return "customer/record";
    }

    //根据交往记录编号查询交往记录
    @RequestMapping("/toeditrecord")
    public String toeditrecord(Model model,Integer id){
        Record record = customerManageService.findRecordByRecordId(id);
        model.addAttribute("record",record);
        return "customer/toeditrecord";
    }

    //根据客户编号新增交往记录
    @RequestMapping("/tonewrecord")
    public String tonewrecord(Model model,Integer id){
        model.addAttribute("id",id);
        return "customer/tonewrecord";
    }
    //根据客户编号保存交往记录
    @RequestMapping("/tosaverecord")
    public String tosaverecord(Model model,Record record){
        boolean flg = customerManageService.saverecord(record);

        int id=record.getCustomerId();
        CustomerManage customerManage =customerManageService.findById(id);
        List<Record> record1 =customerManageService.findRecordByCustomerId(id);
        model.addAttribute("record",record1);
        record1.forEach(System.out::println);
        model.addAttribute("customer",customerManage);
        model.addAttribute("del","保存成功！");
        return "customer/record";
    }

    //根据客户编号删除交往记录信息
    @RequestMapping("/delrecord")
    public String delrecord(Model model,Integer id){
        Record record = customerManageService.findRecordByRecordId(id);
        boolean flg =customerManageService.delrecord(id);


        Integer integer = record.getCustomerId();
        CustomerManage customerManage =customerManageService.findById(integer);
        List<Record> record1 =customerManageService.findRecordByCustomerId(integer);
        model.addAttribute("record",record1);
        model.addAttribute("customer",customerManage);

        model.addAttribute("del","删除成功！");

        return "customer/record";
    }

    //更新保存交往记录
    @RequestMapping("/toupdaterecord")
    public String toupdaterecord(Model model,Record record){
        boolean flg = customerManageService.updaterecord(record);

        Integer integer = record.getCustomerId();
        CustomerManage customerManage =customerManageService.findById(integer);
        List<Record> record1 =customerManageService.findRecordByCustomerId(integer);
        model.addAttribute("record",record1);
        model.addAttribute("customer",customerManage);
        model.addAttribute("del","保存成功！");
        return "customer/record";
    }
    /*---------------------交往记录管理-------------------------*/



    /*---------------------历史订单管理-------------------------*/
    @RequestMapping("/tohistory")
    public String tohistory(Model model,Integer customerId){
        CustomerManage customerManage = customerManageService.findById(customerId);
        model.addAttribute("customer",customerManage);
        List<Order> history =customerManageService.findAllHistoryByCustomerId(customerId);
        //System.out.println(history);
        model.addAttribute("history",history);
        return "customer/tohistory";
    }

    @RequestMapping("/todetail")
    public String todetal(Model model,Integer orderId){
        Order order = customerManageService.findHistoryByOrderId(orderId);
        List<OrderDetail> detail =customerManageService.findDetailByOrderId(orderId);
        model.addAttribute("list",detail);
        model.addAttribute("order",order);
        return "customer/todetail";
    }

    @RequestMapping("/returnAllOrder")
    public String returnAllOrder(Model model,Integer orderId){

        Order order = customerManageService.findHistoryByOrderId(orderId);
        Integer customerId =order.getCustomerId();
        CustomerManage customerManage = customerManageService.findById(customerId);
        model.addAttribute("customer",customerManage);
        List<Order> history =customerManageService.findAllHistoryByCustomerId(customerId);
        model.addAttribute("history",history);
        return "customer/tohistory";
    }
    /*---------------------交往记录管理-------------------------*/



    /*---------------------客户流失管理-------------------------*/

    //流失客户自动新增
    @RequestMapping("/findAllLoss")
    public String findAllLoss(Model model){
        //获取最迟下订单时间以及客户信息
        List<Loss> timeList =customerManageService.findLastOrderTime();
        timeList.forEach(System.out::println);
        //将list逐个转为数组
        Loss lossArray[]=new Loss[timeList.size()];
        for(int i=0;i<timeList.size();i++){
            //开始逐个转为数组
            lossArray[i] = timeList.get(i);

            //判断最迟下定单是否是6个月前
            Integer num = 180-lossArray[i].getTimenum();
            //System.out.println(num);
            //插入半个月没下订单的客户,如果已经存在，则不添加   满足则是超过6个月
            if(num<0){
                //System.out.println(num+"!!!!!!!!!!!!!!!!!");
                //查找所有客户流失表，用于判断流失表中是否以及存在该客户了
                List<Loss> lossList=customerManageService.findAllLoss();
                //逐个将流失表的list转为数组
                Loss a[]=new Loss[lossList.size()];
                //用于判断是否是最后一个

                //开始转为数组
                int nu=1;
                //如果流失表没有数据，则直接新增
                if(lossList.size() ==0){
                    customerManageService.saveLoss(lossArray[i]);
                }
                for(int j=0;j<lossList.size();j++){
                    //逐个存为数组！！！
                    a[j]=lossList.get(j);

                    //此处的客户，是在流失表中的客户
                    Integer jj = a[j].getCustomerId();
                   // System.out.println(jj);

                    //此处的客户，是6个月没有下订单的客户
                    Integer ii = lossArray[i].getCustomerId();
                    //System.out.println(ii);

                    //判断，如果 6个月没下订单的客户编号在流失表中存在，则break
                    //      如果 拿这6个月没有下订单的客户与流失表中的所有客户比较后，没有相等的，则新增
                    if(a[j].getCustomerId() != lossArray[i].getCustomerId()){
                        //用于判断是不是与最后一个比较，需要与最后一个比较完，如果不存在该客户，则新增
                        //如果customerId不相等，则将系数自增，判断是否为最后一个，如果不是最后一个，则继续判断与下一个
                        if(nu == lossList.size()){
                            customerManageService.saveLoss(lossArray[i]);
                        }
                        nu++;
                    }else {
                        break;
                    }
                }
            }
        }
        List<Loss> loss =customerManageService.findAllLoss();
        loss.forEach(System.out::println);
        model.addAttribute("loss",loss);
        return "customer/loss";
    }

    @RequestMapping("/deferloss")
    public String deferloss(Model model,Integer id){
        Loss loss = customerManageService.findLossByLossId(id);
        model.addAttribute("loss",loss);
        return "customer/deferloss";
    }



    @RequestMapping("/updatedeferloss")
    public String updatedeferloss(Model model,Loss loss){

        loss.setPauseWay(loss.getPauseWay()+",追加措施"+loss.getAddPauseWay());
        //System.out.println(loss);
        boolean flg = customerManageService.updateDeferLoss(loss);

        List<Loss> lossAll =customerManageService.findAllLoss();
       // System.out.println(loss);
        model.addAttribute("loss",lossAll);
        model.addAttribute("del","修改成功！");
        return "customer/loss";
    }


    @RequestMapping("/sureloss")
    public String sureloss(Model model,Integer id){
        Loss loss = customerManageService.findLossByLossId(id);
        model.addAttribute("loss",loss);
        return "customer/sureloss";
    }


    @RequestMapping("/updatesureloss")
    public String updatesureloss(Model model,Loss loss){

        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        loss.setLossTime(df.format(new Date()));

        boolean flg = customerManageService.updateSureLoss(loss);

        List<Loss> lossAll =customerManageService.findAllLoss();
        //System.out.println(loss);
        model.addAttribute("loss",lossAll);
        model.addAttribute("del","修改成功！");
        return "customer/loss";
    }

    @RequestMapping("/searchloss")
    public String searchloss(Model model,Loss loss){
        System.out.println(loss);
        if(loss.getCustomerMgr()=="")
        {
            loss.setCustomerMgr(null);
        }
        if(loss.getCustomerName()=="")
        {
            loss.setCustomerName(null);
        }
        List<Loss> lossAll = customerManageService.searchLoss(loss);
        model.addAttribute("loss",lossAll);
        return "customer/loss";
    }
    /*---------------------客户流失管理-------------------------*/






}
