package Item.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Repository;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Repository

public class ServiceManage  {

        private  int id; //编号
        private  Integer serviceNo; //服务编号
        private  String  serviceType;//服务类型
        private  String  outLine;//概要
        private  String  customerName;//客户名称
        private  Integer customerId;//客户编号
        private  String  status; //状态
        private  String  serviceReq;//服务要求
        private  String  creationName;//创建人姓名
        private  String   creationTime;//创建时间
        private  String   creationTime2;
        private  String  allocator;//被分配者
        private  String   assignTime;//分配时间
        private  String  processName;//处理人
        private  String  processContent;//服务处理
        private  String  processResult;//处理结果
        private  String    processTime;//处理时间
        private  String  processSatisfaction;//满意度


}
