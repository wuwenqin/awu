<%--
  Created by IntelliJ IDEA.
  User: 吴文钦
  Date: 2021/7/7
  Time: 14:00:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="layui/css/layui.css">
    <script src="layui/layui.js"></script>
</head>
<body>

<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
    <legend>拖拽上传</legend>
</fieldset>

<div class="layui-upload-drag" id="test10">
    <i class="layui-icon"></i>
    <p>点击上传，或将文件拖拽到此处</p>
    <div class="layui-hide" id="uploadDemoView">
        <hr>
        <img src="" alt="上传成功后渲染" style="max-width: 196px">
    </div>
</div>

</body>
<script>
    layui.use(['upload', 'element', 'layer'], function(){
        var $ = layui.jquery
            ,upload = layui.upload
            ,element = layui.element
            ,layer = layui.layer;



        //拖拽上传
        upload.render({
            elem: '#test10'
            ,multiple:true
            ,size:2097152
            ,accept:'file'
            ,url: 'uploadFileLoad' //改成您自己的上传接口
            ,done: function(res){
                if(res.code=="200"){
                    layer.msg('上传成功',{icon:1});
                }else {
                    layer.msg('上传失败',{icon:5});
                    // layui.$('#uploadDemoView').removeClass('layui-hide').find('img').attr('src', res.files.file);
                    console.log(res)
                }

            }
        });



    });
</script>
</html>
