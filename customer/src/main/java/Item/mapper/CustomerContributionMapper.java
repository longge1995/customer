package Item.mapper;

import Item.entity.CustomerContribution;

import java.util.List;

public interface CustomerContributionMapper {
    List<CustomerContribution> search(CustomerContribution customerContribution);
    List<CustomerContribution> findAll();
    List<CustomerContribution> findyear();
}
