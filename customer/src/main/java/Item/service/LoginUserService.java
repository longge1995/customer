package Item.service;

import Item.entity.LoginUser;

public interface LoginUserService {
    //根据用户名查询用户密码
    LoginUser findByUsername(String username);
}
