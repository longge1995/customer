package Item.service.impl;

import Item.entity.CustomerContribution;
import Item.mapper.CustomerContributionMapper;
import Item.service.CustomerContributionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CustomerContributionServiceImpl implements CustomerContributionService{

    @Autowired
    private CustomerContributionMapper customerContributionMapper;
    @Override
    public List<CustomerContribution> search(CustomerContribution customerContribution) {
        return customerContributionMapper.search(customerContribution);
    }

    @Override
    public List<CustomerContribution> findAll() {
        return customerContributionMapper.findAll();
    }

    @Override
    public List<CustomerContribution> findyear() {
        return customerContributionMapper.findyear();
    }
}
