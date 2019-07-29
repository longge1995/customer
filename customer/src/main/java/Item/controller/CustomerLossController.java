package Item.controller;


import Item.entity.Loss;
import Item.service.CustomerLossService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/CustomerLoss")
public class CustomerLossController {

    @Autowired
    private CustomerLossService customerLossService;

    @RequestMapping("/findCustomerLoss")
    public String search(HttpServletRequest request, HttpSession session){
        String name = request.getParameter("customername");
        String manager = request.getParameter("customermanager");
        if ("".equals(manager)){
            manager=null;
        }
        if ("".equals(name)){
            name=null;
        }
        Loss customerLoss=new Loss();
        customerLoss.setCustomerName(name);
        customerLoss.setCustomerMgr(manager);
        List<Loss> list=customerLossService.search(customerLoss);
        session.setAttribute("list0",list);
        return "redirect:/views/longjin/CustomerLoss.jsp";
    }
}
