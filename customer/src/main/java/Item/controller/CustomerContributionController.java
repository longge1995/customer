package Item.controller;

import Item.entity.CustomerContribution;
import Item.service.CustomerContributionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/Contribution")
public class CustomerContributionController {

    @Autowired
    private CustomerContributionService customerContributionService;

    @RequestMapping("/finAll")
    public String list(Model model){
        List<CustomerContribution> list=customerContributionService.findAll();
        List<CustomerContribution> list1=customerContributionService.findyear();
        model.addAttribute("list1",list1);
        model.addAttribute("list",list);
        return "longjin/CustomerContribut";
    }
    @RequestMapping("/findByName")
    public String search(HttpServletRequest request, HttpSession session){
        String name=request.getParameter("name");
        String time=request.getParameter("choose");
        if ("".equals(name)) {
            name = null;
        }
        if ("".equals(time)){
            time=null;
        }
        CustomerContribution customerContribution=new CustomerContribution();
        customerContribution.setName(name);
        customerContribution.setTime(time);
        List<CustomerContribution> list1=customerContributionService.findyear();
        List<CustomerContribution> list=customerContributionService.search(customerContribution);
        session.setAttribute("list1",list1);
        session.setAttribute("list",list);

        return "redirect:/views/longjin/CustomerContribut.jsp";
    }
}
