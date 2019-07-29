$(function () {

    console.log(111)
    $(":submit").click(function(){
        //如果搜索框中有值，则return true
        let search_val = $("#search_btn").val();
        if(search_val === ""){
            alert("请输入搜索条件！");
            return false;
        }
        return true;  //取消事件的默认行为
    });
});