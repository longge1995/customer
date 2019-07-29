layui.use(['layer','table','jquery','form'],function(){
    let layer = layui.layer,
        table = layui.table,
        $ = layui.jquery,
        form = layui.form;

    //加载数据表格
    let tabInstance = table.render({
        elem: '#datadictionary_list',
        url: '/basedata/list', //数据接口
        page: true, //开启分页
        limit:5, //每页显示的条数，默认10
        limits:[2,5,10,15,], //每页显示条数选择框数据
        request:{
            pageName: 'current',
            limitName: 'size'
        },
        cols: [[ //表头
            {field: 'id', title: 'ID', width:80, sort: true, fixed: 'left'},
            {field: 'datatype', title: '类别'},
            {field: 'datadescribe', title: '条目'},
            {field: 'datavalue', title: '值'},

            {field: 'editable', title: '是否可编辑',templet:function(user){
                    flg=user.editable;
                    return flg?"是":"否";
                    //flg=1的是后就ture;flg=0的时候就否；
            }},

            {title: '操作', width: 135,fixed:'right',toolbar:'#userTool'}

        ]]
    });

    //搜索监听启用
    form.on('submit(search)',function(data){
        tabInstance.reload({
            where :data.field
        });
        return false;
    });

    //返回监听启用
    form.on('submit(return)',function(data){
        console.log(data);
        data.field = "";
        tabInstance.reload({
            where :data.field
        });
        return false;
    });



    // 监听工具栏 操作
    // 'tool(这里面的应该是table id经过filter后的名字，而不是toolbar的ID!!!)'
    table.on('tool(datadictionary_list)',function(obj){
        switch (obj.event){
            case 'edit_btn':
                //编辑
                layer.open({
                    type: 2,
                    content: 'views/basedata/edit.jsp',
                    skin:'layui-layer-molv',
                    title:"编辑数据字典",
                    area:["600px","370px"],
                    btn:['确定','关闭'],
                    success: function(layero, index){  //弹出页面加载成功，执行该函数
                        let edit_layer = layer.getChildFrame('body', index);
                        console.log(obj);
                        edit_layer.find("#id").val(obj.data.id);
                        edit_layer.find("#datatype").val(obj.data.datatype);
                        edit_layer.find("#datadescribe").val(obj.data.datadescribe);
                        edit_layer.find("#datavalue").val(obj.data.datavalue);
                       // edit_layer.find("#editable.checked").val(obj.data.editable);//data.editable还是0，1,省略跳过绑定table下的editable值
                    },
                    yes: function(index, layero){
                        //user_edit
                        let user_form = layer.getChildFrame('body', index).find("#datadictionary_list_edit");
                        let data = {};
                        //把数组转为JSON
                        user_form.serializeArray().forEach(function(val){
                            data[val.name] = val.value;
                        });

                        $.post('basedata/edit',data,function(info){
                            layer.close(index);
                            layer.msg(info.msg);
                            tabInstance.reload();
                        });
                    }
                });
                break;
            case 'del_btn':
                layer.confirm('你确定要删除吗？',{icon:3,anim: 2,skin:'layui-layer-molv'},function(){

                    $.post('basedata/del/'+obj.data.id,function(data){
                        tabInstance.reload();
                        layer.msg(data.msg);
                    });
                });
        }
    });



   // 对datadictionary_list_add表单的check 监听,将是否可编辑的被布尔类型：ture和false  转换成整型：1和0
  form.on('checkbox(checkbox1)', function(data){

        if(data.elem.checked)//开关是否开启，true或者false
        {
        data.value=1;
        }
        else{
        data.value=0;
        }
    });

    // 对datadictionary_list_edit表单的check 监听,将是否可编辑的被布尔类型：ture和false  转换成整型：1和0
    form.on('checkbox(checkbox2)', function(data){

        if(data.elem.checked)//开关是否开启，true或者false
        {
            data.value=1;  //这里data.value就是checkbox2.value
        }
        else{
            data.value=0;
        }
    });


    //添加
    $(".add_btn").click(function(){
        layer.open({
            type: 2,
            content: 'views/basedata/add.jsp',
            skin:'layui-layer-molv',
            title:"新建数据字典",
            area:["600px","370px"],
            btn:['确定','关闭'],
            success: function(layero, index){  //弹出页面加载成功，执行该函数
                let edit_layer = layer.getChildFrame('body', index);

            },
            yes: function(index, layero){
                //datadictionary_list_add
                let datadictionarylist_form = layer.getChildFrame('body', index).find("#datadictionary_list_add");
                let data = {};
                //把数组转为JSON
                datadictionarylist_form.serializeArray().forEach(function(val){
                    data[val.name] = val.value;
                });

                //先发送带ID值得请求判断一下ID与数据库表的ID有没重复
                //只返回了一个boolean 类型，所以A就为boolean flg，如果有其他就可以A.flg;
                $.post('basedata/getdata/'+data.id,function (A) {
                    if(A){alert("ID不能重复");}

                });

               //再发送整个表单数据实现添加，刷新页面的请求
                $.post('basedata/save-edit',data,function(info){
                    layer.close(index);
                    layer.msg(info.msg);
                    tabInstance.reload();
                });

            }
        });


    });

});