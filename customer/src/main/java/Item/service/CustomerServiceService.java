package Item.service;

import Item.entity.CustomerService;

import java.util.List;

public interface CustomerServiceService {
    List<CustomerService> search(CustomerService customerService);
    List<CustomerService> findyear();
}
