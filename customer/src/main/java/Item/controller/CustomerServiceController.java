package Item.controller;

import Item.entity.CustomerService;
import Item.service.CustomerServiceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/CustomerService")
public class CustomerServiceController {
    @Autowired
    private CustomerServiceService customerServiceService;

    @RequestMapping("/findByYear")
    public String search(HttpServletRequest request,HttpSession session){
        String time=request.getParameter("year");
        if("".equals(time)){
            time=null;
        }
        List<CustomerService> list1=customerServiceService.findyear();
        CustomerService customerService=new CustomerService();
        customerService.setTime(time);
        List<CustomerService> list=customerServiceService.search(customerService);
        session.setAttribute("list1",list1);
        session.setAttribute("list",list);
        return "redirect:/views/longjin/CustomerService.jsp";
    }

}
