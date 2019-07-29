package Item.service;

import Item.entity.DataDictionary;
import com.baomidou.mybatisplus.core.metadata.IPage;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DataDictionaryService {


        List<DataDictionary> DataDictionaryPage(IPage page);
        Boolean ReMoveById(int id);
        Boolean SaveOrUpdate(DataDictionary dataDictionary);
        Boolean getData(int id);
        Boolean EditData(DataDictionary dataDictionary);
        List<DataDictionary> SearchData(IPage page, @Param("datatype") String datatype, @Param("datadescribe") String datadescribe, @Param("datavalue") String datavalue);
    }


