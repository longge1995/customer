package Item.service.impl;

import Item.entity.*;
import Item.mapper.CustomerManageMapper;
import Item.service.CustomerManageService;
import com.baomidou.mybatisplus.core.metadata.IPage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class CustomerManageServiceImpl implements CustomerManageService{

    @Autowired
    private CustomerManageMapper customerManageMapper;

    @Override
    public CustomerManage findById(Integer id) {
        return customerManageMapper.findById(id);
    }

    @Override
    public boolean edit(CustomerManage customerManage) {
        return customerManageMapper.edit(customerManage);
    }

    @Override
    public boolean del(Integer id) {
        return customerManageMapper.del(id);
    }

    @Override
    public boolean save(CustomerManage customerManage) {
        return customerManageMapper.save(customerManage);
    }

    @Override
    public List<CustomerManage> findAll() {
        return customerManageMapper.findAll();
    }

    @Override
    public List<CustomerContact> findContactById(Integer id) {
        return customerManageMapper.findContactById(id);
    }

    @Override
    public CustomerContact findContactByContactId(Integer id) {
        return customerManageMapper.findContactByContactId(id);
    }

    @Override
    public List<CustomerManage> search(String search) {
        return customerManageMapper.search(search);
    }

    @Override
    public boolean savecontact(CustomerContact customerContact) {
        return customerManageMapper.savecontact(customerContact);
    }

    @Override
    public boolean delcontact(Integer id) {
        return customerManageMapper.delcontact(id);
    }

    @Override
    public boolean editcontact(CustomerContact customerContact) {
        return customerManageMapper.editcontact(customerContact);
    }

    @Override
    public List<Record> findRecordByCustomerId(Integer id) {
        return customerManageMapper.findRecordByCustomerId(id);
    }

    @Override
    public Record findRecordByRecordId(Integer id) {
        return customerManageMapper.findRecordByRecordId(id);
    }

    @Override
    public boolean saverecord(Record record) {
        return customerManageMapper.saverecord(record);
    }

    @Override
    public boolean delrecord(Integer id) {
        return customerManageMapper.delrecord(id);
    }

    @Override
    public boolean updaterecord(Record record) {
        return customerManageMapper.updaterecord(record);
    }

    @Override
    public List<Order> findAllHistoryByCustomerId(Integer customerId) {
        return customerManageMapper.findAllHistoryByCustomerId(customerId);
    }

    @Override
    public Order findHistoryByOrderId(Integer orderId) {
        return customerManageMapper.findHistoryByOrderId(orderId);
    }

    @Override
    public List<OrderDetail> findDetailByOrderId(Integer orderId) {
        return customerManageMapper.findDetailByOrderId(orderId);
    }

    @Override
    public List<Loss> findAllLoss() {
        return customerManageMapper.findAllLoss();
    }

    @Override
    public List<Loss> findLastOrderTime() {
        return customerManageMapper.findLastOrderTime();
    }

    @Override
    public boolean saveLoss(Loss loss) {
        return customerManageMapper.saveLoss(loss);
    }

    @Override
    public Loss findLossByLossId(Integer id) {
        return customerManageMapper.findLossByLossId(id);
    }

    @Override
    public boolean updateDeferLoss(Loss loss) {
        return customerManageMapper.updateDeferLoss(loss);
    }

    @Override
    public boolean updateSureLoss(Loss loss) {
        return customerManageMapper.updateSureLoss(loss);
    }

    @Override
    public List<Loss> searchLoss(Loss loss) {
        return customerManageMapper.searchLoss(loss);
    }


}
