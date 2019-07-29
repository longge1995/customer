package Item.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CustomerService {
    private Integer id;
    private String time;
    private String serviceType;
    private Long sum;

}
