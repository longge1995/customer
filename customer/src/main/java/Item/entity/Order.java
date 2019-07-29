package Item.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Order {
    private Integer id;
    private String orderId;
    private String orderTime;
    private String deliverGoods;
    private Integer status;
    private Integer customerId;
    private double money;
}
