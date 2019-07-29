package Item.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CustomerLoss {
    private Integer id;
    private String year;
    private String customerName;
    private String customerManager;
    private String lossReason;
}
