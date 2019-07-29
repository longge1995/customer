package Item.service;

import Item.entity.CustomerContribution;
import Item.entity.CustomerService;

import java.util.List;

public interface CustomerContributionService {
    List<CustomerContribution> search(CustomerContribution customerContribution);
    List<CustomerContribution> findAll();
    List<CustomerContribution> findyear();
}
