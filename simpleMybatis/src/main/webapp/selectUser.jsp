<%--
  Created by IntelliJ IDEA.
  User: 吴文钦
  Date: 2021/7/4
  Time: 15:41:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="layui/css/layui.css">
    <script src="layui/layui.js"></script>

    <style>
        .textStyle{
            width: 50px;
        }

        .inputStyle{
            width:150px;
            height: 30px;
        }

    </style>
</head>
<body>
<form class="layui-form" action="">
    <div class="layui-form-item">
        <div class="layui-inline" >
            <label class="layui-form-label textStyle"  >账号</label>
            <div class="layui-input-inline">
                <input type="text" name="id"  class="layui-input inputStyle">
            </div>
        </div>
        <div class="layui-inline" style="margin-left: -70px">
            <label class="layui-form-label textStyle">手机号</label>
            <div class="layui-input-inline">
                <input type="text" name="phone"  autocomplete="off" class="layui-input inputStyle">
            </div>
        </div>

        <div class="layui-inline" style="margin-left: -70px">
            <label class="layui-form-label textStyle">用户名</label>
            <div class="layui-input-inline">
                <input type="text" name="username"   autocomplete="off" class="layui-input inputStyle">
            </div>
        </div>

        <div class="layui-inline" style="margin-left: -70px">
            <label class="layui-form-label textStyle">角色</label>
            <div class="layui-input-inline inputStyle">
                <div class="layui-input-inline">
                    <select name="roleId">
                         <option value="">请选择角色</option>
                        <option value="1">普通用户</option>
                        <option value="2">管理员</option>
                        <option value="3">超级管理员</option>

                    </select>
                </div>
            </div>
        </div>

        <div class="layui-inline "style="margin-left: -40px ;margin-top: -16px">
            <label class="layui-form-label">
                <button class="layui-btn layui-btn-normal" lay-submit="" lay-filter="demo1" style="height: 40px">搜索</button>
            </label>

        </div>
    </div>




</form>
<table class="layui-hide" id="test" lay-filter="test"></table>
<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">

         </div>
</script>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>






</body>

<script>
    layui.use(['table','form'], function(){
        var table = layui.table;

        var form =layui.form;
        var $=layui.jquery;
        //监听提交
        form.on('submit(demo1)', function(data){
            // layer.alert(JSON.stringify(data.field), {
            //     title: '最终的提交信息'
            // })

            tableIns.reload({
                url: "selectByWhereUsers",
                where:{
                    id:data.field.id,
                    phone:data.field.phone,
                    username:data.field.username,
                    roleId:data.field.roleId
                },
                page:{
                    curr:1,
                }


            })

            return false;
        });



        tableIns=table.render({
            elem: '#test'
            ,url:'selectUser'
            ,toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
            ,defaultToolbar: ['filter', 'exports', 'print', { //自定义头部工具栏右侧图标。如无需自定义，去除该参数即可
                title: '提示'
                ,layEvent: 'LAYTABLE_TIPS'
                ,icon: 'layui-icon-tips'
            }]
            ,title: '用户数据表'
            ,cols: [[
                {type: 'checkbox', fixed: 'left'}
                ,{field:'id', title:'账号', width:'10%', fixed: 'left', unresize: true, sort: true}
                ,{field:'username', title:'用户名', width:'10%', edit: 'text'}
                ,{field:'password', title:'密码', width:'10%', edit: 'text'}
                ,{field:'roleId', title:'角色', width:'10%', edit: 'text', sort: true}
                ,{field:'phone', title:'手机号', width:'15%'}
                ,{field:'createdate', title:'注册时间'}
                ,{field:'remark', title:'备注', width:'15%', sort: true,edit: 'text'}

                ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:'10%'}
            ]]
            ,page: true
        });

        //头工具栏事件
        table.on('toolbar(test)', function(obj){
            var checkStatus = table.checkStatus(obj.config.id);
            switch(obj.event){
                case 'getCheckData':
                    var data = checkStatus.data;
                    layer.alert(JSON.stringify(data));
                    break;
                case 'getCheckLength':
                    var data = checkStatus.data;
                    layer.msg('选中了：'+ data.length + ' 个');
                    break;
                case 'isAll':
                    layer.msg(checkStatus.isAll ? '全选': '未全选');
                    break;

                //自定义头工具栏右侧图标 - 提示
                case 'LAYTABLE_TIPS':
                    layer.alert('这是工具栏右侧自定义的一个图标按钮');
                    break;
            };
        });

        //监听行工具事件
        table.on('tool(test)', function(obj){
            var data = obj.data;
            if(obj.event === 'del'){
                layer.confirm('真的删除行么', function(index){
                    obj.del();
                    var json={"id":data.id};
                    $.post("deleteById",json,function (data) {
                        if(data!="0"){
                            layer.msg("删除成功",{icon:1});
                        }else {
                            layer.msg("删除失败,请检查!",{icon:5});
                        }
                    });
                    layer.close(index);
                });
            } else if(obj.event === 'edit'){
                layer.confirm('确定要修改吗？',function (index) {
                    var json={"json":JSON.stringify(data)};
                    console.log(json);
                    $.post("updateUser",json,function (data) {
                        if(data!="0"){
                            layer.msg("修改成功",{icon:1});
                        }else {
                            layer.msg("修改失败,请检查!",{icon:5});
                        }
                    });
                    layer.close(index);
                })
            }
        });
        //表单取值
        layui.$('#LAY-component-form-getval').on('click', function(){
            var data = form.val('example');
            alert(JSON.stringify(data));
        });
    });

</script>


</html>
