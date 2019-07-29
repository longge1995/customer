package Item.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ServiceHistory {
    private  Integer id;
    private  Integer serviceId;
    private  String  processContent;
    private  String  processResult;
    private  String  processTime;
}
