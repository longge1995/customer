package Item.mapper;

import Item.entity.CustomerService;

import java.util.List;

public interface CustomerServiceMapper {
    List<CustomerService> search(CustomerService customerService);
    List<CustomerService> findyear();
}
