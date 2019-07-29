package Item.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CustomerContact {
    private Integer id;
    private Integer customerId;
    private String name;
    private String sex;
    private String job;
    private String phone;
    private String tel;
    private String remark;
    private String founder;
    private String founderId;
    private String creationTime;
}

