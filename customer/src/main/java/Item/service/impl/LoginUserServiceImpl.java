package Item.service.impl;

import Item.entity.LoginUser;
import Item.mapper.LoginUserMapper;
import Item.service.LoginUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginUserServiceImpl implements LoginUserService {

    @Autowired
    private LoginUserMapper LoginUserMapper ;

    @Override
    public LoginUser findByUsername(String username) {
        return LoginUserMapper.findByUsername(username);
    }
}
