package Item.controller;

import Item.entity.LoginUser;
import Item.service.LoginUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.servlet.http.HttpSession;


@Controller
@RequestMapping("/tologin")
public class LoginUserController {

    @Autowired
    private LoginUserService LoginUserService;




    //通过用户名查询密码
    @RequestMapping("/findByUsername")
    public String fingByUsername(String username,String password,Model model,HttpSession session){

        LoginUser loginUser=LoginUserService.findByUsername(username);
        System.out.println(loginUser);
        System.out.println(password);




      /* 不用try catch 的话，if条件会报空指针异常（唔知点解）*/
        try {
            if(password.equals(loginUser.getPassword())){ //如果输入的密码不对，这里会报空指针异常
                System.out.println(password.equals(loginUser.getPassword()));
                //System.out.println(loginUser);
                // 将用户对象添加到Session
                session.setAttribute("USER_SESSION", loginUser);
                return "../index";
            }
            else {
                System.out.println(password.equals(loginUser.getPassword()));
                model.addAttribute("msg","账号或密码错误，请重新登录！");
                return "../login";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        model.addAttribute("msg","账号或密码错误，请重新登录！");
        return "../login";




    }


    /**
     * 退出登录
     */
    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        // 清除Session
        session.invalidate();
        // 重定向到登录页面的跳转方法
        return "../login";
    }


}
