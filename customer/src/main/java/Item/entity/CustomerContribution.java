package Item.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CustomerContribution {
    private Integer id;
    private Integer oTime;
    private String name;
    private String time;
    private Long money;

    @Override
    public String toString(){
        return "CustomerContribution(id="+id+",name="+name+", time=" + time+", money="+money+")";
    }


}

