package Item.service.impl;


import Item.entity.CustomerService;
import Item.mapper.CustomerServiceMapper;
import Item.service.CustomerServiceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CustomerServiceImpl implements CustomerServiceService{

    @Autowired
    private CustomerServiceMapper customerServiceMapper;

    @Override
    public List<CustomerService> search(CustomerService customerService) {
        return customerServiceMapper.search(customerService);
    }

    @Override
    public List<CustomerService> findyear() {
        return customerServiceMapper.findyear();
    }
}
