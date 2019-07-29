package Item.entity.vo;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@JsonInclude(JsonInclude.Include.NON_NULL)
public class ResponseData {

    private Integer code;  //0  success 1 fail
    private String msg;
    private Long count;
    private Object data;

    public static ResponseData okPage(long count, Object data){ return new ResponseData(0,null,count,data);
    }

    public static ResponseData okData(Object data){
        return new ResponseData(0,null,null,data);
    }


    public static ResponseData okMsg(String msg){
        return new ResponseData(0,msg,null,null);
    }

    public static ResponseData failMsg(String msg){
        return new ResponseData(1,msg,null,null);
    }

}