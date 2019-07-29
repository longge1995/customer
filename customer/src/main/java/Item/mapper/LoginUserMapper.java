package Item.mapper;

import Item.entity.LoginUser;

import java.util.List;

public interface LoginUserMapper {

    //根据用户名查询用户密码
    LoginUser findByUsername(String username);


}
