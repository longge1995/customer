package Item.service;

import Item.entity.CustomerForm;

import java.util.List;

public interface CustomerFormService {
    List<CustomerForm> findGrade();
    List<CustomerForm> findSatisfaction();
    List<CustomerForm> findCredit();

}
