package Item.service.impl;

import Item.entity.Choose;
import Item.mapper.ChooseMapper;
import Item.service.ChooseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ChooseServiceImpl implements ChooseService {
    @Autowired
    private ChooseMapper chooseMapper;
    @Override
    public List<Choose> findAll() {
        return chooseMapper.findAll();
    }
}
