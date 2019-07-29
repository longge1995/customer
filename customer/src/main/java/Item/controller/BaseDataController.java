package Item.controller;


import Item.service.DataDictionaryService;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import Item.entity.DataDictionary;
import Item.entity.vo.ResponseData;
import Item.service.DataDictionaryService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

import static java.lang.System.out;

/**
 * <p>
 * 用户表 前端控制器
 * </p>
 *
 * @author CDHong
 * @since 2018-11-20
 */
@RestController
@RequestMapping("/basedata")
public class BaseDataController {

    @Autowired
    private DataDictionaryService datadictionaryService;




    @PostMapping("/getdata/{id}")
    public boolean getData(@PathVariable("id") Integer id){
        boolean flg  = datadictionaryService.getData(id);
        return flg;
    }


//    @RequestMapping("/list")
//    public ResponseData list(Page page){
//        List<DataDictionary> list = datadictionaryService.DataDictionaryPage(page);
//        return ResponseData.okPage(page.getTotal(),list);
//    }

    @RequestMapping("/list")
    public ResponseData list(Page page, @RequestParam(value = "datatype",required = false) String datatype,@RequestParam(value = "datadescribe",required = false) String datadescribe,@RequestParam(value = "datavalue",required = false) String datavalue){
        List<DataDictionary> list = datadictionaryService.SearchData(page, datatype,datadescribe,datavalue);
        System.out.println("哈哈");
        return ResponseData.okPage(page.getTotal(),list);
    }

    @PostMapping("/save-edit")
    //添加
    public ResponseData saveOrEdit(DataDictionary datadictionary){
        boolean flg = datadictionaryService.SaveOrUpdate(datadictionary);
        if(flg){
            return ResponseData.okMsg("操作成功！！");
        }
        return ResponseData.failMsg("操作失败！！");
    }

    @PostMapping("/edit")
    //添加
    public ResponseData Edit(DataDictionary datadictionary){
        boolean flg = datadictionaryService.EditData(datadictionary);
        if(flg){
            return ResponseData.okMsg("操作成功！！");
        }
        return ResponseData.failMsg("操作失败！！");
    }

    @PostMapping("/del/{id}")
    public ResponseData del(@PathVariable("id") Integer id){
        boolean flg = datadictionaryService.ReMoveById(id);
        if(flg){
            return ResponseData.okMsg("删除成功！！");
        }
        return ResponseData.failMsg("删除失败！！");
    }


}
