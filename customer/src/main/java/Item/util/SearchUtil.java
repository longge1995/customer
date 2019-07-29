package Item.util;

import Item.entity.ServiceManage;

public class SearchUtil {

    public static ServiceManage judgeSearch(ServiceManage serviceManage){

        if(serviceManage.getCustomerName().equals("")){
            serviceManage.setCustomerName(null);
        }
        if(serviceManage.getOutLine().equals("")){
            serviceManage.setOutLine(null);
        }
        if(serviceManage.getServiceType().equals("")){
            serviceManage.setServiceType(null);
        }
        if(serviceManage.getStatus().equals("")){
            serviceManage.setStatus(null);
        }
        if(serviceManage.getCreationTime().equals("")){
            serviceManage.setCreationTime(null);
        }
        if(serviceManage.getCreationTime2().equals("")){
            serviceManage.setCreationTime2(null);
        }

        return  serviceManage;
    }
}
