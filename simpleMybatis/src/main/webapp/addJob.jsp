<%--
  Created by IntelliJ IDEA.
  User: 吴文钦
  Date: 2021/7/8
  Time: 1:20:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=drive-width,initial-scale=1.0">
    <%--    <meta http-equiv="X-UA-Compatible" content="IE=edge">--%>

    <!-- font-awesome 图标字体 http://www.fontawesome.com.cn/faicons/#web-application -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" media="screen" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="css/iconfont.css">
    <script src="js/jquery.min.js"></script>
    <script src="layui/layui.js"></script>

    <title>Demo</title>
</head>
<body style="background: url(imgs/welBackground.jpg) no-repeat; background-size: 100% auto;">
<div id="login-box" style="margin-top: 100px">
    <h1>添加职位</h1>

    <form method="post" id="demo1" class="layui-form layui-form-pane">
        <div class="form">
            <div class="item">
                <i class="fa fa-user-circle-o" aria-hidden="true"></i>
                <input type="text" name="jname" placeholder="JobName" lay-verify="required">
            </div>
            <div class="item">
                <i class="fa fa-bookmark-o" aria-hidden="true"></i>
                <input type="text" name="jremark" placeholder="JobMark">
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
            $.post("addNewJob",json,function (data) {
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
