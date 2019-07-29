package Item.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {

    private  Integer id;
    private  String  name;
    private  String  job;
    private  String phone;
    private  String  email;
}
