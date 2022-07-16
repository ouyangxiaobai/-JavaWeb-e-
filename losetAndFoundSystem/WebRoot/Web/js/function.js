//全选
function checkAll(chk) {
    var objs = document.getElementsByTagName("input");
    var flag = chk.checked;
    //提示信息span
    var spanInfo=document.getElementById("ckInfoSpan");
    if(spanInfo!=null&&spanInfo.innerHTML.length>0){
        if(flag){
            spanInfo.innerHTML="反选";
        }else{
            spanInfo.innerHTML="全选";
        }
    }
    for (var i = 1; i < objs.length; i++) {
        if (objs[i].type == "checkbox") {

            if (objs[i].id.toString().indexOf("ckSelect") > 0) {
                if (flag)
                    objs[i].checked = true;
                else
                    objs[i].checked = false;
            }
        }
    }
}
//0代表检测是否至少选中了一项，1代表检测选中且只能选中一项
function isChecked(u) {
    var objs = document.getElementsByTagName("input");
    var temp = false;
    var count = 0;
    for (var i = 1; i < objs.length; i++) {
        if (objs[i].type == "checkbox") {
            if (objs[i].id.toString().indexOf("ckSelect") > 0) {
                if (objs[i].checked) {
                    temp = true;
                    count += 1;
                    if (count > 1) {
                        break;
                    }
                }

            }
        }
    }
    if (!temp) {
        alert("请先选择操作项！");
    } else {//选择了几项
        if (u == 1) {//修改
            if (count > 1) {
                alert("请保证只选中了一项来操作！");
                temp = false;
            }
        } else if (u == 0) {//删除
            if (confirm("确认删除选中项吗?")) {
                temp = true;
                
            } else {
                temp = false;
            }
        }else if(u==3)
        {
          if (count > 1) {
                alert("请保证只选中了一项来操作！");
                temp = false;
            }
        }else if(u==4)
        {
           if (count > 1) {
                alert("请保证只选中了一项来操作！");
                temp = false;
            }
        }
        
    }
    return temp;
}
