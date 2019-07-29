package Item.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CustomerForm {
    private Integer id;
    private String customerGrade;
    private Integer sum;
    private String customerSatisfaction;
    private String customerCredit;

}
