package Item.mapper;

import Item.entity.CustomerManage;
import Item.entity.ServiceHistory;
import Item.entity.ServiceManage;
import Item.entity.ServiceHistory;
import Item.entity.User;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;

import java.util.List;

public interface ServiceManageMapper extends BaseMapper<ServiceManage> {

    List<ServiceManage> findAll(IPage page);
    boolean save(ServiceManage serviceManage);
    boolean del(Integer id);
    boolean saveProcess(ServiceManage serviceManage);
    List<ServiceManage> search(ServiceManage serviceManage);
    ServiceManage findById(Integer id);
    List<User> findAllUser();
    boolean saveAssign(ServiceManage serviceManage);
    List<CustomerManage> findAllCutomer();
    boolean addServiceHistory(ServiceManage serviceManage);
    List<ServiceHistory> findServiceHistory(Integer id);
}
