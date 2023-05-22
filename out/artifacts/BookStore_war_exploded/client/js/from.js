var falg1=false;
var falg2=false;
var falg3=false;
var falg4=false;
var falg5=false;
var falg6=false;
var falg7=false;
var falg8=false;
var falg9=false;

function checkName() {
    falg1=true;
    /* 使用document，getElementById()获取id为txtUser（即用户名）的输入域的值，判断其长度是否合法*/
    if (document.getElementById("txtUser").value.length < 6 || document.getElementById("txtUser").value.length > 18) {
        //设置为type的＜an＞显示错误信息
        document.getElementById("tips_username").innerHTML = "<em style='color: #FF0000'>用户名由6-18位字符组成</em>";
        document.getElementById("txtUser").focus();
        return false;
    } else {
        document.getElementById("tips_username").innerHTML = "OK!";
    }
}

function checkPassWord(){
    falg2=true;
    //正则表达式，由字母、数字和下划线组成
    var reg = /[^A-Za-z0-9_]+/;
    var regs =   /^[a-zA-Z0-9_\u4e00-\u9fa5]+$/;
    //判断密码长度是否符合规则
    if (document.getElementById("txtPwd").value.length < 6 || document.getElementById("txtPwd").value.length > 18 || regs.test(document.getElementById("txtPwd").value)) {
        document.getElementById("tips_password").innerHTML = "<em style='color：#FF0000'>密码由6—18位字符组成，且必须包含字母、数字和标点符号</em>"
        document.getElementById("txtPwd").focus();
        return false;
    } else {
        document.getElementById("tips_password").innerHTML = "OK!";
    }
}
function checkRpt() {
    falg3=true;
    //校验两次密码输入是否一致
    if (document.getElementById("txtRpt").value != document.getElementById("txtPwd").value) {
        document.getElementById("tips_repeat").innerHTML = "<em style='color：#FF0000'>两次输人的密码不一致</em>";
        document.getElementById("txtRpt").focus();
        return false;
    } else {
        document.getElementById("tips_repeat").innerHTML = "OK!";
    }
}
function checkSelUser() {//校验用户类别，如果选择的是第0项，表示未选择
    falg4=true;
    if (document.getElementById("selUaer").selectedIndex == 0) {
        document.getElementById("tips_usertype").innerHTML = "<em style='color:#FF0000'>没有选择用户类型</em>";
        document.getElementById("selUser").focus();
        return false;
    } else {
        document.getElementById("tips_usertype").innerHTML = "OK!";
    }
}
function checkGender() {
    falg5=true;
//获取所有名称为gender的 input 标签
    var genderNum = document.getElementsByName("gender");
    var gender = "";
    //遍历这些名称为gender的标签
    for (var i = 0; i < genderNum.length; ++i) {
        //如果某个gender被选中，则记录
        if (genderNum[i].checked)
            gender = genderNum[i].value;
    }
    if (gender == "") {
        document.getElementById("tips_gender").innerHTML = "<em style='color：＃FE0000'>至少选择其中一项</em>";
        return false;

    } else {
        document.getElementById("tips_gender").innerHTML = "OK!";
    }
}


function checkDate(){
    falg6=true;
    if (document.getElementById("txtDate").value == "") {
        document.getElementById("tips_birthdate").innerHTML = "<em style='color：#FF0000'>没有填写出生日期或者日期错误</em>";
        document.getElementById("txtDate").focus();
        return false;
    } else {
        document.getElementById("tips_birthdate").innerHTML = "OK!";
    }
}

/*
校验爱好是否合法
*/
function changeHobby() {
    falg7=true;
    var hobby = 0;
//objNum为所有名称为hobby的 input 标签
    var objNum = document.getElementsByName("hobby"); //遍历所有的hobby标签
    for (var i = 0; i < objNum.length; ++i) {
//判断某个hobby标签是否被选中
        if (objNum[i].checked == true) hobby++;
    }
//如果有选中的hobby标签
    if (hobby >= 1) {
        document.getElementById("tips_hobby").innerHTML = "OK!";
    } else {
        document.getElementById("tips_hobby").innerHTML
            = "<em style= 'color:#FF0000'>至少选择其中一项</em>"
        falg7=false;
        return false;
    }
}


function  checkEmail(){
    falg8=true;
    //获取Email输入域的值
    var email = document.getElementById("txtMail").value; //电子邮件的正则表达式
    var pattern =
        /^[a-zA-Z0-9#_\^\$\.\*\+\-\?\=\!\:\/\\\/\(\)\[\]\{\}]+@[a-zA-Z0-9]+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/;
    if (email.length == 0) {
        document.getElementById("tips_email").innerHTML = "<em style='color:#FF0000'>电子邮箱不能为空</em>";
        document.getElementById("txtMail").focus();
        return false;
    } else if (!pattern.test(email)) {
        document.getElementById("tips_email").innerHTM = "<em style='color：#FF0000'>Email 不合法</em>";
        document.getElementById("txtMail").focus();
        return false;
    } else {
        document.getElementById("tips_email").innerHTML = "OK!";
    }
}
function checkIntroduction(){
    falg9=true;
    //判断自我介绍的长度是否超过100个字符
    if (document.getElementById("txtIntro").value.length > 100) {
        document.getElementById("tips_introduction").innerHTML = "<em style='color：#FF0000'>长度不能超过100个字符</em>";
        document.getElementById("txtIntro").focus();
        return false;
    } else {
        document.getElementById("tips_introduction").innerHTML = "OK!";
    }
}

function checkForm(){
    return falg1 && falg2 && falg3 && falg4 && falg5
        && falg6 && falg7 && falg8 && falg9 ;
}


