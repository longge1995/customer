package Item.service;

import Item.entity.SaleManage;
import Item.entity.User;

import java.util.List;

public interface SaleManageService {

    boolean addSaleOp(SaleManage saleManage);
    boolean editSaleOp(SaleManage saleManage);
    boolean delSaleOp(Integer id);
    boolean saveAssignSaleOp(SaleManage saleManage);

    SaleManage findSaleOpById(Integer id);
    SaleManage findSaleOpBySalesId(Integer id);
    List<SaleManage> findAllSaleOpMsg();
    List<SaleManage> findAllSaleOpList();
    List<SaleManage> searchSaleOp(SaleManage saleManage);

    List<User> findAllAssign();
    Integer findIdByName(String name);

    List<SaleManage> findAllAssignSaleOpList();

    List<SaleManage> findDrawPlanListByOpId(Integer id);
    SaleManage findDrawPlanById(Integer id);
    boolean saveDrawPlan(SaleManage saleManage);
    boolean addDrawPlan(SaleManage saleManage);
    boolean delPlanItem(Integer id);

    boolean addCustomerInfo(SaleManage saleManage);
    boolean addCustomerContact(SaleManage saleManage);
    boolean editDrawStatus(SaleManage saleManage);

}
