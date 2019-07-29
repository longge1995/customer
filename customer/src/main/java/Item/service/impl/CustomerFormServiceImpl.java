package Item.service.impl;

import Item.entity.CustomerForm;
import Item.mapper.CustomerFormMapper;
import Item.service.CustomerFormService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CustomerFormServiceImpl implements CustomerFormService {

    @Autowired
    private CustomerFormMapper customerFormMapper;

    @Override
    public List<CustomerForm> findGrade() {
        return customerFormMapper.findGrade();
    }

    @Override
    public List<CustomerForm> findSatisfaction() {
        return customerFormMapper.findSatisfaction();
    }

    @Override
    public List<CustomerForm> findCredit() {
        return customerFormMapper.findCredit();
    }
}
