<%--
  Created by IntelliJ IDEA.
  User: 吴文钦
  Date: 2021/7/6
  Time: 22:13:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <link rel="stylesheet" href="layui/css/layui.css">
    <%--  下面两个JS的调用顺序必须如此  --%>
    <script type="text/javascript" src="ueditor/ueditor.config.js"></script>
    <script type="text/javascript" src="ueditor/ueditor.all.min.js"></script>

    <script src="js/jquery.min.js"></script>
    <script src="layui/layui.js"></script>
</head>
<body style="padding: 10px 15px 0px 15px">

<form class="layui-form layui-form-pane" action="" id="demo1">

    <div class="layui-form-item">
        <label class="layui-form-label">类型</label>
        <div class="layui-input-inline">
                <select name="name">
                    <option value="公告">公告</option>
                        <option value="通知"> 通知</option>
                        <option value="新闻"> 新闻</option>
                        <option value="文章">文章 </option>
                         <option value="小说">小说 </option>

                </select>
        </div>

        <label class="layui-form-label">标题</label>
        <div class="layui-input-inline">
            <input type="text" name="title" lay-verify="required" placeholder="请输入文章标题" autocomplete="off" class="layui-input">
        </div>

        <label class="layui-form-label">备注</label>
        <div class="layui-input-inline">
            <input type="text" name="remark"   placeholder="选择性输入" autocomplete="off" class="layui-input">
        </div>

    </div>





<textarea id="container" name="content" style="margin-top: 50px; height: 300px">

</textarea>
    <div class="layui-form-item" style="margin-top: 10px;margin-left: 20px">
        <button class="layui-btn layui-btn-normal" lay-submit="" lay-filter="demo1"> 提交</button>
    </div>
</form>

</body>

<script>
    var ue = UE.getEditor("container");
    layui.use(['form','jquery','layer'],function () {
        var  form=layui.form;
        var $ =layui.jquery;
        var layer=  layui.layer;

        //监听提交
        form.on('submit(demo1)',function (data) {
            // layer.alert(JSON.stringify(data.field),{
            //  title: '最终的提交信息'
            // })
            // $.ajaxSettings.async =false;     设置ajax同步
            var json={"json":JSON.stringify(data.field)};

            $.post("addNotice",json,function (data) {
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
