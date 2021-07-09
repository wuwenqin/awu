<%--
  Created by IntelliJ IDEA.
  User: 吴文钦
  Date: 2021/7/5
  Time: 1:52:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="layui/css/layui.css">
    <script src="layui/layui.js"></script>
    <script src="js/jquery.min.js"></script>
</head>
<body>

<form class="layui-form" action="">
    <div class="layui-form-item">
        <label class="layui-form-label">账号</label>
        <div class="layui-input-inline" >
            <input type="text" name="id" required disabled  lay-verify="required" value="${user.id}"  autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">用户名</label>
        <div class="layui-input-inline">
            <input type="text" name="username" required disabled lay-verify="required" value="${user.username}"  autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">密码</label>
        <div class="layui-input-inline">
            <input type="password" name="password" required  lay-verify="required" value="${user.password}"  autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">手机号</label>
        <div class="layui-input-inline">
            <input type="text" name="phone" required disabled lay-verify="required" value="${user.phone}"  autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">创建日期</label>
        <div class="layui-input-inline">
            <input type="text" name="createdate" required disabled lay-verify="required" value="${user.createdate}"  autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">备注</label>
        <div class="layui-input-inline">
            <input type="text" name="remark" required  lay-verify="required" value="${user.remark}"  autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item login_top">
        <label class="layui-input-inline">
            <button class="layui-btn layui-bg-blue" lay-submit="" lay-filter="demo1"
                    style="width: 310px">修改</button>
        </label>
    </div>

</form>

</body>
</html>
