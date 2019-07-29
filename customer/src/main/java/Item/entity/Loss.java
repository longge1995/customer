package Item.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Loss {
    private Integer id;
    private Integer customerId;
    private String customerMgr;
    private String customerName;
    private String lastOrderTime;
    private String pauseWay;
    private String addPauseWay;
    private String lossTime;
    private String lossReason;
    private Integer status;
    private Integer timenum;
    private String year;

}
