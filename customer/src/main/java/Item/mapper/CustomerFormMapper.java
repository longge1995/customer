package Item.mapper;

import Item.entity.CustomerForm;

import java.util.List;

public interface CustomerFormMapper {
    List<CustomerForm> findGrade();
    List<CustomerForm> findSatisfaction();
    List<CustomerForm> findCredit();

}
