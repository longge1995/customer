package Item.service.impl;

import Item.entity.CustomerManage;
import Item.entity.ServiceManage;
import Item.entity.ServiceHistory;
import Item.entity.User;
import Item.mapper.ServiceManageMapper;
import Item.service.ServiceManageService;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ServiceManageServiceImpl extends ServiceImpl<ServiceManageMapper, ServiceManage> implements ServiceManageService {
    @Autowired
    private ServiceManageMapper serviceManageMapper;
    @Override
    public List<ServiceManage> findAll(IPage page) {
        return serviceManageMapper.findAll(page);
    }

    @Override
    public boolean save(ServiceManage serviceManage) {
        return serviceManageMapper.save(serviceManage);
    }

    @Override
    public boolean del(Integer id) {
        return serviceManageMapper.del(id);
    }

    @Override
    public List<ServiceManage> search(ServiceManage serviceManage) {
        return serviceManageMapper.search(serviceManage);
    }

    @Override
    public ServiceManage findById(Integer id) {
        return serviceManageMapper.findById(id);
    }

    @Override
    public boolean saveProcess(ServiceManage serviceManage) {
        return serviceManageMapper.saveProcess(serviceManage);
    }

    @Override
    public List<User> findAllUser() {
        return serviceManageMapper.findAllUser();
    }

    @Override
    public boolean saveAssign(ServiceManage serviceManage) {
        return serviceManageMapper.saveAssign(serviceManage);
    }

    @Override
    public List<CustomerManage> findAllCustomer() {
        return serviceManageMapper.findAllCutomer();
    }

    @Override
    public boolean addServiceHistory(ServiceManage serviceManage) {
        return serviceManageMapper.addServiceHistory(serviceManage);
    }

    @Override
    public List<ServiceHistory> findServiceHistory(Integer id) {
        return serviceManageMapper.findServiceHistory(id);
    }
}
