package Item.service.impl;


import Item.entity.DataDictionary;
import Item.service.DataDictionaryService;
import com.baomidou.mybatisplus.core.metadata.IPage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DataDictionaryServiceImpl implements  DataDictionaryService{
    @Autowired
    private Item.mapper.DataDictionaryMapper DataDictionaryMapper;

    @Override
    public List<DataDictionary> DataDictionaryPage(IPage page) {
        return DataDictionaryMapper.datadictionaryPage(page);
    }

    @Override
    public List<DataDictionary> SearchData(IPage page, String datatype, String datadescribe, String datavalue) {
        return DataDictionaryMapper.searchData(page,datatype,datadescribe,datavalue);
    }
    @Override
    public Boolean ReMoveById(int id) { return DataDictionaryMapper.removeById(id); }

    @Override
    public Boolean SaveOrUpdate(DataDictionary dataDictionary) { return DataDictionaryMapper.addData(dataDictionary); }

    @Override
    public Boolean EditData(DataDictionary dataDictionary) { return DataDictionaryMapper.editData(dataDictionary); }

    @Override
    public Boolean getData(int id) {
        return DataDictionaryMapper.getData(id);
    }
}
