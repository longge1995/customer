package Item.controller;

import Item.entity.Choose;
import Item.entity.CustomerForm;
import Item.service.ChooseService;
import Item.service.CustomerFormService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/CustomerForm")
public class CustomerFormController {

    @Autowired
    private CustomerFormService customerFormService;
    @Autowired
    private ChooseService chooseService;
    @RequestMapping("/choose")
    public String choose(HttpServletRequest request){
        String str=request.getParameter("choose");
        Integer num=Integer.parseInt(str);
        switch (num){
            case 0:return "redirect:/CustomerForm/findGrade";
            case 1:return "redirect:/CustomerForm/findSatisfaction";
            case 2:return "redirect:/CustomerForm/findCredit";
        }
       return null;
    }

    @RequestMapping("/findGrade")
    public String findGrade(HttpSession session){
        List<CustomerForm> list=customerFormService.findGrade();
        List<Choose> list1=chooseService.findAll();
        String grade="等级";
        session.setAttribute("grade",grade);
        session.setAttribute("list",list);
        session.setAttribute("list1",list1);
        return "redirect:/views/longjin/CustomerFormGrade.jsp";
    }

    @RequestMapping("/findSatisfaction")
    public String findSatisfaction(HttpSession session){
        List<CustomerForm> list=customerFormService.findSatisfaction();
        List<Choose> list1=chooseService.findAll();
        String satisfaction="满意度";
        session.setAttribute("satisfaction",satisfaction);
        session.setAttribute("list",list);
        session.setAttribute("list1",list1);
        return "redirect:/views/longjin/CustomerFormSatisfaction.jsp";
    }

    @RequestMapping("/findCredit")
    public String findCredit(HttpSession session){
        List<CustomerForm> list=customerFormService.findCredit();
        List<Choose> list1=chooseService.findAll();
        String Credit="信用度";
        session.setAttribute("Credit",Credit);
        session.setAttribute("list",list);
        session.setAttribute("list1",list1);
        return "redirect:/views/longjin/CustomerFormCredit.jsp";
    }

}
