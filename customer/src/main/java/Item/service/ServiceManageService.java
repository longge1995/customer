package Item.service;

import Item.entity.CustomerManage;
import Item.entity.ServiceHistory;
import Item.entity.ServiceManage;
import Item.entity.ServiceHistory;
import Item.entity.User;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;


public interface ServiceManageService extends IService<ServiceManage> {

    List<ServiceManage> findAll(IPage page);
    boolean save(ServiceManage serviceManage);
    boolean del(Integer id);
    List<ServiceManage> search(ServiceManage serviceManage);
    ServiceManage findById(Integer id);
    boolean saveProcess(ServiceManage serviceManage);
    List<User> findAllUser();
    boolean saveAssign(ServiceManage serviceManage);
    List<CustomerManage> findAllCustomer();
    boolean addServiceHistory(ServiceManage serviceManage);
    List<ServiceHistory> findServiceHistory(Integer id);
}
