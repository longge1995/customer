package Item.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Record {
    private Integer id;
    private String place;
    private String outline;
    private String detailedInfo;
    private String remarks;
    private String contactTime;
    private Integer customerId;

}
