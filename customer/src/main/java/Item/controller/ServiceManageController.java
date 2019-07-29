package Item.controller;

import Item.entity.*;
import Item.service.impl.ServiceManageServiceImpl;
import Item.util.SearchUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Objects;

@Controller
@RequestMapping("/service")
public class ServiceManageController {
    @Autowired
    private ServiceManageServiceImpl serviceManageService;

    @RequestMapping("/findUserWithCutomer")//保存新创建的服务
    public String findUserWithCutomer(Model model,HttpServletRequest request){
        HttpSession session = request.getSession();
        LoginUser user = (LoginUser)session.getAttribute("USER_SESSION");
        model.addAttribute("loginusername",user.getUsername());
        List<CustomerManage> list = serviceManageService.findAllCustomer();
        list.forEach(System.out::println);
        model.addAttribute("list",list);

        return  "/service/save";
    }
    @RequestMapping("/findNewCreation")//查找新创建的服务
    public String findAll(Model model){
        ServiceManage serviceManage = new ServiceManage();
        serviceManage.setStatus("新创建");
        List<ServiceManage> list = serviceManageService.search(serviceManage);
        List<User> listUser = serviceManageService.findAllUser();
        model.addAttribute("status",serviceManage.getStatus());
        model.addAttribute("list",list);
        model.addAttribute("listUser",listUser);
        return "/service/assign";
    }

    @RequestMapping("/save")//保存新创建的服务
    public String save(ServiceManage serviceManage,Model model){

        serviceManageService.save(serviceManage);
        model.addAttribute("del","添加成功！");
        /*return  "redirect:/views/service/save.jsp";*/
        return  "/service/save";
    }
    @RequestMapping("/allocateUser/{id}")
    public String allocateUser(@PathVariable("id") Integer id, ServiceManage serviceManage, Model model){
        ServiceManage serviceManage2 = serviceManageService.findById(id);
        serviceManage2.setStatus("已分配");
        serviceManage2.setAllocator(serviceManage.getAllocator());
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        serviceManage2.setAssignTime(df.format(new Date()));
        serviceManageService.saveAssign(serviceManage2);
        ServiceManage serviceManage1 = new ServiceManage();
        serviceManage1.setStatus("新创建");
        List<ServiceManage> list = serviceManageService.search(serviceManage1);
        model.addAttribute("list",list);
        List<User> listUser = serviceManageService.findAllUser();
        model.addAttribute("listUser",listUser);
        model.addAttribute("del","分配成功！");
        return  "/service/assign";
    }

    @RequestMapping("/del/{id}")//根据ID删除服务
    public String del(@PathVariable("id") Integer id ,Model model){

        serviceManageService.del(id);
        ServiceManage serviceManage = new ServiceManage();
        serviceManage.setStatus("新创建");
        List<ServiceManage> list = serviceManageService.search(serviceManage);
        model.addAttribute("list",list);
        List<User> listUser = serviceManageService.findAllUser();
        model.addAttribute("listUser",listUser);
        model.addAttribute("del","删除成功！");
        return  "/service/assign";
    }

    @RequestMapping("/searchAssign")//在服务分配页面实现模糊查询
    public String search(ServiceManage serviceManage, Model model) {
        serviceManage = SearchUtil.judgeSearch(serviceManage);
        List<ServiceManage> list = serviceManageService.search(serviceManage);
        if(!(serviceManage.getServiceType() == null)){
            model.addAttribute("type",serviceManage.getServiceType());
        }
        if (!(serviceManage.getStatus() == null)){
            model.addAttribute("status",serviceManage.getStatus());
        }
        model.addAttribute("list",list);
        List<User> listUser = serviceManageService.findAllUser();
        model.addAttribute("listUser",listUser);
        return  "/service/assign";
    }

    @RequestMapping("/findAllocated")//查找已分配的服务
    public String searchAllocated(Model model){
        ServiceManage serviceManage = new ServiceManage();
        serviceManage.setStatus("已分配");
        List<ServiceManage> list = serviceManageService.search(serviceManage);
        model.addAttribute("list",list);
        model.addAttribute("status",serviceManage.getStatus());
        return "/service/process";
    }

    @RequestMapping("/process/{id}")//根据服务的ID跳转处理服务页面
    public String process(@PathVariable("id")Integer id , Model model,HttpServletRequest request){
        HttpSession session = request.getSession();
        LoginUser user = (LoginUser)session.getAttribute("USER_SESSION");
        model.addAttribute("loginusername",user.getUsername());
        ServiceManage serviceManage = serviceManageService.findById(id);
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        serviceManage.setProcessTime(df.format(new Date()));
        model.addAttribute("serviceManage",serviceManage);

        return "/service/processPage";
    }
    @RequestMapping("/findServiceHistory/{id}")//根据服务的ID跳转处理服务历史记录页面
    public String findServiceHistory(@PathVariable("id")Integer id , Model model){
        List<ServiceHistory> listHistory = serviceManageService.findServiceHistory(id);
           /* if(Objects.nonNull(listHistory)) {
                model.addAttribute("listHistory", listHistory);
            }else {
                model.addAttribute("msg","无历史记录");
            }*/
        model.addAttribute("listHistory", listHistory);
        return "service/processHistory";
    }

    @RequestMapping("/saveProcess")
    public  String saveProcess(ServiceManage serviceManage, Model model){
        serviceManage.setStatus("已处理");
        serviceManageService.saveProcess(serviceManage);

        ServiceManage serviceManage1 = new ServiceManage();
        serviceManage1.setStatus("已分配");
        List<ServiceManage> list = serviceManageService.search(serviceManage1);
        model.addAttribute("list",list);
        model.addAttribute("del","保存成功！");
        return  "/service/process";
    }

    @RequestMapping("/searchProcess")//在服务处理页面实现模糊查询
    public String processSearch(ServiceManage serviceManage, Model model){

        serviceManage = SearchUtil.judgeSearch(serviceManage);
        List<ServiceManage> list = serviceManageService.search(serviceManage);
        model.addAttribute("list",list);
        return  "/service/process";

    }
    @RequestMapping("/findProcessed")//查找已处理的服务
    public String findFeedback(Model model){
        ServiceManage serviceManage = new ServiceManage();
        serviceManage.setStatus("已处理");
        List<ServiceManage> list = serviceManageService.search(serviceManage);
        model.addAttribute("list",list);
        return "/service/feedback";

    }
    @RequestMapping("/searchFeedback")//在服务反馈页面实现模糊查询
    public String searchFeedback(ServiceManage serviceManage , Model model){
        serviceManage = SearchUtil.judgeSearch(serviceManage);
        List<ServiceManage> list = serviceManageService.search(serviceManage);
        model.addAttribute("list",list);
        return  "/service/feedback";

    }
    @RequestMapping("/feedback/{id}")//根据服务的ID跳转处理服务页面
    public String feedback(@PathVariable("id")Integer id , Model model){
        ServiceManage serviceManage = serviceManageService.findById(id);
        model.addAttribute("serviceManage",serviceManage);
        return "/service/feedbackPage";
    }
    @RequestMapping("/saveFeedback")
    public  String saveFeedback(ServiceManage serviceManage, Model model){
        serviceManageService.addServiceHistory(serviceManage);
        if(serviceManage.getProcessSatisfaction().equals("☆☆☆☆☆")||serviceManage.getProcessSatisfaction().equals("☆☆☆☆")){

            serviceManage.setStatus("已归档");
        }else{
            serviceManage.setStatus("已分配");
            serviceManage.setProcessContent(null);
            serviceManage.setProcessName(null);
            serviceManage.setProcessTime(null);
            serviceManage.setProcessResult(null);
            serviceManage.setProcessSatisfaction(null);

        }
        serviceManageService.saveProcess(serviceManage);
        ServiceManage serviceManage1 = new ServiceManage();
        serviceManage1.setStatus("已处理");
        List<ServiceManage> list = serviceManageService.search(serviceManage1);
        model.addAttribute("list",list);
        model.addAttribute("del","保存成功！");
        return  "/service/feedback";
    }
    @RequestMapping("/searchFile")//在服务反馈页面实现模糊查询
    public String searchFile(ServiceManage serviceManage , Model model){
        serviceManage = SearchUtil.judgeSearch(serviceManage);
        List<ServiceManage> list = serviceManageService.search(serviceManage);
        model.addAttribute("list",list);
        return  "/service/file";

    }
    @RequestMapping("/file/{id}")//根据服务的ID跳转到服务处理页面
    public String File(@PathVariable("id")Integer id , Model model){
        ServiceManage serviceManage = serviceManageService.findById(id);
        model.addAttribute("serviceManage",serviceManage);
        return "/service/filePage";
    }
    @RequestMapping("/findFile")//查找已归档的服务
    public String findFile(Model model){
        ServiceManage serviceManage = new ServiceManage();
        serviceManage.setStatus("已归档");
        List<ServiceManage> list = serviceManageService.search(serviceManage);
        model.addAttribute("list",list);
        return "/service/file";

    }
}
