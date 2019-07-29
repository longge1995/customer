package Item.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderDetail {
    private Integer id;
    private Integer orderId;
    private String productName;
    private Integer num;
    private String units;
    private double price;
    private double money;
}
