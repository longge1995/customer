package Item.controller;

import Item.entity.SaleManage;
import Item.entity.User;
import Item.service.SaleManageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import org.springframework.ui.Model;
@Controller
public class SaleManageController {

    @Autowired
    private SaleManageService saleManageService;

    @RequestMapping("saleManage/findAllSaleOpList")
    public String findAllSaleOpList(HttpSession session){
        List<SaleManage> list = saleManageService.findAllSaleOpList();
        session.setAttribute("list",list);
        return "/salesmanage/salemanageoplist";
    }

    @RequestMapping("saleManage/addSaleOp")
    public String addSaleOp(SaleManage saleManage, HttpSession session,Model model){
        int salesId = saleManage.getSalesId();
        SaleManage saleManage2 = saleManageService.findSaleOpBySalesId(salesId);
        if(saleManage2!=null){
            session.setAttribute("saleManage2",saleManage2);
            return "/salesmanage/addsaleop";
        }
        saleManage.setStatus("未指派");
        saleManageService.addSaleOp(saleManage);
        List<SaleManage> list = saleManageService.findAllSaleOpList();
        session.setAttribute("list",list);
        model.addAttribute("del","保存成功！");
        return "/salesmanage/salemanageoplist";
    }

    @RequestMapping("saleManage/geteditSaleOp")
    public String geteditSaleOp(HttpServletRequest request,HttpSession session,Model model){
        int id = Integer.parseInt(request.getParameter("id"));
        SaleManage saleManage = saleManageService.findSaleOpById(id);
        if(saleManage.getStatus().equals("已指派")){
            model.addAttribute("del","状态为已指派的销售机会无法编辑！");
            return "/salesmanage/salemanageoplist";
        }
        session.setAttribute("saleManage",saleManage);
        return "/salesmanage/editsalemanageopmsg";

    }

    @RequestMapping("saleManage/saveEditSaleOp")
    public String editSaleOp(SaleManage saleManage, HttpSession session,Model model) {
        saleManageService.editSaleOp(saleManage);
        List<SaleManage> list = saleManageService.findAllSaleOpList();
        session.setAttribute("list",list);
        model.addAttribute("del","编辑成功！");
        return "/salesmanage/salemanageoplist";
    }

    @RequestMapping("saleManage/delSaleOp")
    public String delSaleOp(HttpServletRequest request, HttpSession session,Model model){
        int id = Integer.parseInt(request.getParameter("id"));
        SaleManage saleManage = saleManageService.findSaleOpById(id);
        if(saleManage.getStatus().equals("已指派")){
            model.addAttribute("del","状态为已指派的销售机会无法删除！");
            return "/salesmanage/salemanageoplist";
        }
        saleManageService.delSaleOp(id);
        List<SaleManage> list = saleManageService.findAllSaleOpList();
        session.setAttribute("list",list);
        model.addAttribute("del","删除成功！");
        return "/salesmanage/salemanageoplist";
    }

    @RequestMapping("saleManage/searchSaleOp")
    public String searchSaleOp(SaleManage saleManage, HttpSession session, HttpServletRequest request){
        if(saleManage.getCustomerName().equals("")){
            saleManage.setCustomerName(null);
        }
        if(saleManage.getOutline().equals("")){
            saleManage.setOutline(null);
        }
        if(saleManage.getContacts().equals("")){
            saleManage.setContacts(null);
        }
        List<SaleManage> list = saleManageService.searchSaleOp(saleManage);
        session.setAttribute("list",list);
        return "/salesmanage/salemanageoplist";
    }

    @RequestMapping("saleManage/assignSaleOp")
    public String assignSaleOp(HttpServletRequest request, HttpSession session,Model model){
        int salesId = Integer.parseInt(request.getParameter("salesId"));
        SaleManage saleManage = saleManageService.findSaleOpBySalesId(salesId);
        List<User> allAssign = saleManageService.findAllAssign();
        if(saleManage.getStatus().equals("已指派")){
            model.addAttribute("del","该销售机会无法重复指派！");

            return "/salesmanage/salemanageoplist";
        }
        session.setAttribute("saleManage",saleManage);
        session.setAttribute("allAssign",allAssign);
        return "/salesmanage/assignsaleop";

    }

    @RequestMapping("saleManage/saveAssignSaleOp")
    public String saveAssignSaleOp(SaleManage saleManage, HttpSession session,Model model) {
        saleManage.setStatus("已指派");
        String assignName = saleManage.getAssignName();
        int id =  saleManageService.findIdByName(assignName);
        saleManage.setAssignId(id);
        saleManageService.saveAssignSaleOp(saleManage);
        List<SaleManage> list = saleManageService.findAllSaleOpList();
        session.setAttribute("list",list);
        model.addAttribute("del","指派成功！");
        return "/salesmanage/salemanageoplist";
    }

    @RequestMapping("saleManage/showSaleOpMsg")
    public String showSaleOpMsg(HttpServletRequest request, HttpSession session){
        int salesId = Integer.parseInt(request.getParameter("salesId"));
        SaleManage saleManage = saleManageService.findSaleOpBySalesId(salesId);
        session.setAttribute("saleManage",saleManage);
        return "/salesmanage/saleopmsg";
    }

    @RequestMapping("saleManage/findAllAssignSaleOpList")
    public String findAllAssignSaleOpList(HttpSession session){
        List<SaleManage> list = saleManageService.findAllAssignSaleOpList();
        session.setAttribute("list",list);
        return "/salesmanage/drawplanlist";
    }
    @RequestMapping("saleManage/drawPlan")
    public String drawPlan(HttpServletRequest request, HttpSession session,Model model){
        int salesId = Integer.parseInt(request.getParameter("salesId"));
        SaleManage saleManage = saleManageService.findSaleOpBySalesId(salesId);
        if(saleManage.getDrawStatus().equals("开发中")) {
            List<SaleManage> list = saleManageService.findDrawPlanListByOpId(salesId);
            session.setAttribute("saleManage", saleManage);
            session.setAttribute("list", list);
            return "/salesmanage/drawplan";
        }
        List<SaleManage> list = saleManageService.findAllAssignSaleOpList();
        session.setAttribute("list",list);
        model.addAttribute("del","非开发中的销售机会无法制定计划！");
        return "/salesmanage/drawplanlist";
    }

    @RequestMapping("saleManage/savePlanItem")
    public String savePlanItem(HttpServletRequest request, HttpSession session){
        int planId = Integer.parseInt(request.getParameter("planId"));
        int opportunityId = Integer.parseInt(request.getParameter("opportunityId"));
        String planItem = request.getParameter("planItem");
        SaleManage saleManage = saleManageService.findDrawPlanById(planId);
        saleManage.setPlanItem(planItem);
        saleManageService.saveDrawPlan(saleManage);
        SaleManage saleManage2 = saleManageService.findSaleOpBySalesId(opportunityId);
        List<SaleManage> list = saleManageService.findDrawPlanListByOpId(opportunityId);
        session.setAttribute("saleManage", saleManage2);
        session.setAttribute("list", list);
        return "/salesmanage/drawplan";
    }

    @RequestMapping("saleManage/addPlanItem")
    public String addPlanItem(HttpServletRequest request, HttpSession session){
        int salesId = Integer.parseInt(request.getParameter("salesId"));
        String drawTime = request.getParameter("drawTime");
        String planItem = request.getParameter("planItem");
        SaleManage saleManage = new SaleManage();
        saleManage.setOpportunityId(salesId);
        saleManage.setDrawTime(drawTime);
        saleManage.setPlanItem(planItem);
        saleManageService.addDrawPlan(saleManage);
        SaleManage saleManage2 = saleManageService.findSaleOpBySalesId(salesId);
        List<SaleManage> list = saleManageService.findDrawPlanListByOpId(salesId);
        session.setAttribute("saleManage", saleManage2);
        session.setAttribute("list", list);
        return "/salesmanage/drawplan";
    }

    @RequestMapping("saleManage/delPlanItem/{planId}/{opportunityId}")
    public String delPlanItem(@PathVariable("planId") Integer planId,@PathVariable("opportunityId") Integer opportunityId,HttpSession session,Model model) {
        saleManageService.delPlanItem(planId);
        SaleManage saleManage = saleManageService.findSaleOpBySalesId(opportunityId);
        List<SaleManage> list = saleManageService.findDrawPlanListByOpId(opportunityId);
        session.setAttribute("saleManage",saleManage);
        session.setAttribute("list",list);
        model.addAttribute("del","删除成功！");
        return "/salesmanage/drawplan";
    }

    @RequestMapping("saleManage/startPlan")
    public String startPlan(HttpServletRequest request,HttpSession session){
        int salesId = Integer.parseInt(request.getParameter("salesId"));
        SaleManage saleManage = saleManageService.findSaleOpBySalesId(salesId);
        List<SaleManage> list = saleManageService.findDrawPlanListByOpId(salesId);
        session.setAttribute("saleManage",saleManage);
        session.setAttribute("list",list);
        return "/salesmanage/startplan";
    }

    @RequestMapping("saleManage/savePlanResult")
    public String savePlanResult(HttpServletRequest request, HttpSession session){
        int planId = Integer.parseInt(request.getParameter("planId"));
        int opportunityId = Integer.parseInt(request.getParameter("opportunityId"));
        String planResult = request.getParameter("planResult");
        SaleManage saleManage = saleManageService.findDrawPlanById(planId);
        saleManage.setPlanResult(planResult);
        saleManageService.saveDrawPlan(saleManage);
        SaleManage saleManage2 = saleManageService.findSaleOpBySalesId(opportunityId);
        List<SaleManage> list = saleManageService.findDrawPlanListByOpId(opportunityId);
        session.setAttribute("saleManage", saleManage2);
        session.setAttribute("list", list);
        return "/salesmanage/startplan";
    }

    @RequestMapping("saleManage/developSuccess")
    public String developSuccess(SaleManage saleManage, HttpSession session,Model model){
        saleManage.setDrawStatus("开发成功");
        saleManageService.editDrawStatus(saleManage);
        saleManageService.addCustomerInfo(saleManage);
        saleManageService.addCustomerContact(saleManage);
        List<SaleManage> list = saleManageService.findAllAssignSaleOpList();
        session.setAttribute("list",list);
        model.addAttribute("del","开发成功！");
        return "/salesmanage/drawplanlist";
    }

    @RequestMapping("saleManage/developFail")
    public String developFail(HttpServletRequest request,HttpSession session){
        int salesId = Integer.parseInt(request.getParameter("salesId"));
        SaleManage saleManage = saleManageService.findSaleOpBySalesId(salesId);
        saleManage.setDrawStatus("开发失败");
        saleManageService.editDrawStatus(saleManage);
        List<SaleManage> list = saleManageService.findAllAssignSaleOpList();
        session.setAttribute("list",list);
        return "/salesmanage/drawplanlist";
    }

    @RequestMapping("saleManage/showDevelopMsg")
    public String showDevelopMsg(HttpServletRequest request, HttpSession session){
        int salesId = Integer.parseInt(request.getParameter("salesId"));
        SaleManage saleManage = saleManageService.findSaleOpBySalesId(salesId);
        List<SaleManage> list = saleManageService.findDrawPlanListByOpId(salesId);
        session.setAttribute("saleManage",saleManage);
        session.setAttribute("list",list);
        return "/salesmanage/showDevelopMsg";
    }
}