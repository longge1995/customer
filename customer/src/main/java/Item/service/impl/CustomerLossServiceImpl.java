package Item.service.impl;


import Item.entity.Loss;
import Item.mapper.CustomerLossMapper;
import Item.service.CustomerLossService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CustomerLossServiceImpl implements CustomerLossService {
    @Autowired
    private CustomerLossMapper customerLossMapper;
    @Override
    public List<Loss> search(Loss loss) {
        return customerLossMapper.search(loss);
    }
}
