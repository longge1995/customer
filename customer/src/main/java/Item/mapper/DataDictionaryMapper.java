package Item.mapper;

import Item.entity.DataDictionary;
import com.baomidou.mybatisplus.core.metadata.IPage;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DataDictionaryMapper {

    List<DataDictionary> datadictionaryPage(IPage page);
    Boolean removeById(int id);
    Boolean addData(DataDictionary dataDictionary);
    Boolean editData(DataDictionary dataDictionary);
    Boolean getData(int id);
    List<DataDictionary> searchData(IPage page, @Param("datatype") String datatype, @Param("datadescribe") String datadescribe, @Param("datavalue") String datavalue);
}
