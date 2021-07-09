<%--
  Created by IntelliJ IDEA.
  User: 吴文钦
  Date: 2021/7/4
  Time: 21:39:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <script src="js/jquery.min.js"></script>
<%--    <script src="loginstyle/js/jquery-1.8.2.min.js"></script>--%>
    <link rel="stylesheet" href="layui/css/layui.css">
    <script src="layui/layui.js"></script>

    <style type="text/css">
        body {
            background-repeat: no-repeat;
            background-position: center;
            background-image: url(imgs/welBackground2.jpg);
        }
    </style>
</head>
<body>
<div style="text-align:center ">
    <form action="/register" class="layui-form" method="post">
        <table style="margin-left:20%; font-size: 20px">
            <div>
                <caption>用户注册</caption>

                <tr>
                    <td>手机号码:</td>
                    <td><input name="phone" type="text" lay-verify="required|phone|phonecheck" id="phonetext" size="20"></td>
                </tr>
                <tr>
                    <td>用户名：</td>
                    <td><input name="username" type="text" size="20" id="username" lay-verify="required"><span
                            id="checkusername"></span></td>
                </tr>
                <tr>
                    <td>密码:</td>
                    <td><input name="password" type="password" lay-verify="required" placeholder="请输入密码" size="20"></td>
                </tr>

                <tr>
                    <td>密码验证:</td>
                    <td><input name="pw" type="password" lay-verify="required|equalpw" placeholder="请确认密码" size="20"></td>
                </tr>


                <tr>
                    <td>验证码:</td>
                    <td><input type="text" name="checkcode" lay-verify="required" placeholder="请输入验证码"
                               autocomplete="off"
                                 style="width: 110px"> <a href="javascript:void(0)" id="checkcode">
                        <img src="CheckCodeUtil" width="100px" height="38px" alt=""
                             id="imgcode">
                    </a></td>
                </tr>

            </div>
        </table>
        <input type="submit" value="注册">
        <input type="reset" value="重置">
    </form>
    <br>
</div>


</body>







<script>

    $(function () {
        $("#checkcode").click(function () {
            $("#imgcode").attr("src", "/CheckCodeUtil?time=" + new Date().getTime());

        });

        var registmsg = "${registmsg}";
        if (registmsg == "register successful") {
            layer.msg("注册成功", {icon: 1});
        }else if(registmsg=="register failed"){
            layer.msg("注册失败", {icon: 5});
        }
        // else if(registmsg==""){
        //         layer.msg("注册失败", {icon: 5});
        //     }


    });





    layui.use(['form','layedit','layer','jquery'],function () {
        var form=layui.form,
            layer=layui.layer,
            layedit=layui.layedit,
            $ =layui.jquery;




        //自定义验证规则
        form.verify({
            title: function (value) {
                if (value.length < 5) {
                    return '标题至少得5个字符';
                }
            }
            , pass: [
                /^[\S]{6,12}$/, '密码必须6到12位，且不能出现空格']
            , content: function (value) {
                layedit.sync(editIndex);
            },
            equalpw: function (value) {
                alert(value);
                if ($('input[name=password]').val() !== value)
                    return '两次密码输入不一致';
            },
            phonecheck:function (value) {
                alert(value);
                //用ajax技术，异步加载，局部刷新
                //jq:ajax(),load(),get(),post()
                //三个参数，url,json,function
                //构建json数据
                var json ={"phoneString":value};
                var flag=false;
                $.post("checkPhone",json,function (data) {
                    if(data=="1"){
                        alert(data);
                        console.log("该手机号被注册过");
                        flag=true;
                    }
                });
                alert(flag);
                if(flag){
                    return "改手机号被注册过";
                }

            },

        });

        // //监听提交
        // form.on('submit(demo1)',function (data) {
        //     return true;
        // });
        //
        // //表单取值
        // layui.$('#LAY-component-form-getval').on('click',function () {
        //     var data =form.val('example');
        //     alert(JSON.stringify(data));
        // });

    });

</script>
</html>
