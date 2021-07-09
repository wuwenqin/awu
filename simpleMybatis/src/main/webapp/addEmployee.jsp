<%--
  Created by IntelliJ IDEA.
  User: 吴文钦
  Date: 2021/7/8
  Time: 14:47:47
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=drive-width,initial-scale=1.0">
    <%--    <meta http-equiv="X-UA-Compatible" content="IE=edge">--%>

    <!-- font-awesome 图标字体 http://www.fontawesome.com.cn/faicons/#web-application -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" media="screen" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="css/iconfont.css">
    <script src="js/jquery.min.js"></script>
    <script src="layui/layui.js"></script>
</head>
<body style="background: url(imgs/back.jpg) no-repeat; background-size: cover">
<div id="login-box" style="margin-top: 100px">
    <h1>添加员工</h1>

    <form method="post" id="demo1" class="layui-form layui-form-pane">
        <div class="form">
            <div class="item">
                <i class="fa fa-user-circle-o" aria-hidden="true"></i>
                <input type="Integer" name="deptId" placeholder="部门ID" lay-verify="required">
            </div>
            <div class="item">
                <i class="fa fa-bookmark-o" aria-hidden="true"></i>
                <input type="text" name="jobId" placeholder="职位ID">
            </div>
            <div class="item">
                <i class="fa fa-bookmark-o" aria-hidden="true"></i>
                <input type="text" name="name" placeholder="姓名">
            </div>
            <div class="item">
                <i class="fa fa-bookmark-o" aria-hidden="true"></i>
                <input type="text" name="cardId" placeholder="工号">
            </div>
            <div class="item">
                <i class="fa fa-bookmark-o" aria-hidden="true"></i>
                <input type="text" name="address" placeholder="地址">
            </div>
            <div class="item">
                <i class="fa fa-bookmark-o" aria-hidden="true"></i>
                <input type="text" name="postCode" placeholder="邮政编码">
            </div>
            <div class="item">
                <i class="fa fa-bookmark-o" aria-hidden="true"></i>
                <input type="tel" name="tel" placeholder="手机号">
            </div>
            <div class="item">
                <i class="fa fa-bookmark-o" aria-hidden="true"></i>
                <input type="tel" name="phone" placeholder="备用号">
            </div>
            <div class="item">
                <i class="fa fa-bookmark-o" aria-hidden="true"></i>
                <input type="text" name="qqNum" placeholder="QQ号">
            </div>
            <div class="item">
                <i class="fa fa-bookmark-o" aria-hidden="true"></i>
                <input type="email" name="email" placeholder="邮箱">
            </div>
            <div class="item">
                <i class="fa fa-bookmark-o" aria-hidden="true"></i>
                <input type="text" name="sex" placeholder="性别(男1女2)">
            </div>
            <div class="item">
                <i class="fa fa-bookmark-o" aria-hidden="true"></i>
                <input type="text" name="party" placeholder="政治面貌">
            </div>
            <div class="item">
                <i class="fa fa-bookmark-o" aria-hidden="true"></i>
                <input type="text" name="birthday" placeholder="生日">
            </div>
            <div class="item">
                <i class="fa fa-bookmark-o" aria-hidden="true"></i>
                <input type="text" name="race" placeholder="族类">
            </div>
            <div class="item">
                <i class="fa fa-bookmark-o" aria-hidden="true"></i>
                <input type="text" name="education" placeholder="教育学历">
            </div>
            <div class="item">
                <i class="fa fa-bookmark-o" aria-hidden="true"></i>
                <input type="text" name="speciality" placeholder="专业">
            </div>
            <div class="item">
                <i class="fa fa-bookmark-o" aria-hidden="true"></i>
                <input type="text" name="hobby" placeholder="爱好">
            </div>
            <div class="item">
                <i class="fa fa-bookmark-o" aria-hidden="true"></i>
                <input type="text" name="remark" placeholder="备注">
            </div>

        </div>

        <button lay-submit="" lay-filter="demo1">添加</button>

    </form>
</div>

</body>

<script>
    layui.use(['form','jquery','layer'],function () {
        var  form=layui.form;
        var $ =layui.jquery;
        var layer=  layui.layer;

        //监听提交
        form.on('submit(demo1)',function (data) {
            var json={"json":JSON.stringify(data.field)};
            console.log(json);
            $.post("addNewEmployee",json,function (data) {
                if(data!="0"){
                    layer.msg("添加成功",{icon:1});
                }else{
                    layer.msg("添加失败",{icon:5});
                }
            })
            return false;
        });
    });
</script>

</html>