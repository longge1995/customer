package Item.service.impl;

import Item.entity.SaleManage;
import Item.entity.User;
import Item.mapper.SaleManageMapper;
import Item.service.SaleManageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class SaleManageServiceImpl implements SaleManageService {

    @Autowired
    private SaleManageMapper saleManageMapper;

    @Override
    @Transactional
    public boolean addSaleOp(SaleManage saleManage) {
        return saleManageMapper.addSaleOp(saleManage);
    }

    @Override
    @Transactional
    public boolean editSaleOp(SaleManage saleManage) {
        return saleManageMapper.editSaleOp(saleManage);
    }

    @Override
    @Transactional
    public boolean delSaleOp(Integer id) {
        return saleManageMapper.delSaleOp(id);
    }

    @Override
    public boolean saveAssignSaleOp(SaleManage saleManage) {
        return saleManageMapper.saveAssignSaleOp(saleManage);
    }

    @Override
    public SaleManage findSaleOpById(Integer id) {
        return saleManageMapper.findSaleOpById(id);
    }

    @Override
    @Transactional
    public SaleManage findSaleOpBySalesId(Integer id) {
        return saleManageMapper.findSaleOpBySalesId(id);
    }

    @Override
    @Transactional
    public List<SaleManage> findAllSaleOpMsg() {
        return saleManageMapper.findAllSaleOpMsg();
    }

    @Override
    @Transactional
    public List<SaleManage> findAllSaleOpList() {
        return saleManageMapper.findAllSaleOpList();
    }

    @Override
    @Transactional
    public List<SaleManage> searchSaleOp(SaleManage saleManage) {
        return saleManageMapper.searchSaleOp(saleManage);
    }


    @Override
    public List<User> findAllAssign() {
        return saleManageMapper.findAllAssign();
    }
    @Override
    public Integer findIdByName(String name) {
        return saleManageMapper.findIdByName(name);
    }

    @Override
    public List<SaleManage> findAllAssignSaleOpList() {
        return saleManageMapper.findAllAssignSaleOpList();
    }

    @Override
    public List<SaleManage> findDrawPlanListByOpId(Integer id) {
        return saleManageMapper.findDrawPlanListByOpId(id);
    }

    @Override
    public SaleManage findDrawPlanById(Integer id) {
        return saleManageMapper.findDrawPlanById(id);
    }

    @Override
    public boolean saveDrawPlan(SaleManage saleManage) {
        return saleManageMapper.saveDrawPlan(saleManage);
    }

    @Override
    public boolean addDrawPlan(SaleManage saleManage) {
        return saleManageMapper.addDrawPlan(saleManage);
    }

    @Override
    public boolean delPlanItem(Integer id) {
        return saleManageMapper.delPlanItem(id);
    }

    @Override
    public boolean addCustomerInfo(SaleManage saleManage) {
        return saleManageMapper.addCustomerInfo(saleManage);
    }

    @Override
    public boolean addCustomerContact(SaleManage saleManage) {
        return saleManageMapper.addCustomerContact(saleManage);
    }

    @Override
    public boolean editDrawStatus(SaleManage saleManage) {
        return saleManageMapper.editDrawStatus(saleManage);
    }

}
