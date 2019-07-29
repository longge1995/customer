package Item.mapper;

import Item.entity.*;
import com.baomidou.mybatisplus.core.metadata.IPage;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CustomerManageMapper {
    //根据客户编号查询客户信息函数
    CustomerManage  findById(Integer id);

    //编辑客户信息函数
    boolean edit(CustomerManage customerManage);

    //删除客户信息函数
    boolean del(Integer id);

    //保存客户信息函数
    boolean save(CustomerManage customerManage);

    //查询所有客户信息
    List<CustomerManage> findAll();

    //根据客户编号，查询对应所有联系人
    List<CustomerContact> findContactById(Integer id);

    //根据联系人编号查询联系人信息
    CustomerContact findContactByContactId(Integer id);

    //模糊查询客户信息
    List<CustomerManage> search(String search);

    //根据客户编号新增联系人
    boolean savecontact(CustomerContact customerContact);

    //根据联系人编号删除联系人
    boolean delcontact(Integer id);

    //根据联系人编号修改联系人信息
    boolean editcontact(CustomerContact customerContact);

    //根据客户编号查询所有交往记录
    List<Record> findRecordByCustomerId(Integer id);

    //根据交往记录编号查询交往记录信息
    Record findRecordByRecordId(Integer id);

    //根据客户编号新增交易记录
    boolean saverecord(Record record);

    //根据交易记录编号删除对应交易记录信息
    boolean delrecord(Integer id);

    //修改更新交易记录
    boolean updaterecord(Record record);

    //根据客户编号查找所有的历史订单
    List<Order> findAllHistoryByCustomerId(Integer customerId);

    //根据订单编号查询历史订单
    Order findHistoryByOrderId(Integer orderId);

    //根据订单号查询明细表
    List<OrderDetail> findDetailByOrderId(Integer orderId);

    //查询所有流失信息
    List<Loss> findAllLoss();

    //查询所有客户最后一次的订单时间
    List<Loss> findLastOrderTime();

    //保存流失记录
    boolean saveLoss(Loss loss);

    //根据lossId 查询loss信息
    Loss findLossByLossId(Integer id);

    //修改暂缓流失
    boolean updateDeferLoss(Loss loss);

    //修改确认流失
    boolean updateSureLoss(Loss loss);

    //3个条件模糊查询流失记录
    List<Loss> searchLoss(Loss loss);
}
