<%--
  Created by IntelliJ IDEA.
  User: 吴文钦
  Date: 2021/7/8
  Time: 14:48:58
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
    <a class="layui-btn layui-btn-xs layui-btn-normal" lay-event="find">查看</a>
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
                url: "selectEmployee",
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
            ,url:'selectEmployee'
            ,toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
            ,defaultToolbar: ['filter', 'exports', 'print', { //自定义头部工具栏右侧图标。如无需自定义，去除该参数即可
                title: '提示'
                ,layEvent: 'LAYTABLE_TIPS'
                ,icon: 'layui-icon-tips'
            }]
            ,title: '公告数据表'
            ,cols: [[
                {type: 'checkbox', fixed: 'left'}
                ,{field:'id', title:'ID', width:'8%', fixed: 'left', unresize: true, sort: true}
                ,{field:'deptId', title:'部门ID', width:'8%', fixed: 'left', unresize: true, sort: true}
                ,{field:'jobId', title:'职位ID', width:'8%', fixed: 'left', unresize: true, sort: true}
                ,{field:'name', title:'名称', width:'15%', edit: 'text'}
                ,{field:'cardId', title:'员工号', width:'15%', sort: true}
                ,{field:'address', title:'地址', width:'8%'}
                ,{field:'postCode', title:'postCode', width:'7%', sort: true,edit: 'text'}
                ,{field:'tel', title:'手机号', width:'7%', sort: true,edit: 'text'}
                ,{field:'phone', title:'备用号', width:'7%', sort: true,edit: 'text'}
                ,{field:'qqNum', title:'QQ号', width:'7%', sort: true,edit: 'text'}
                ,{field:'email', title:'邮箱', width:'7%', sort: true,edit: 'text'}
                ,{field:'sex', title:'性别', width:'4%', sort: true,edit: 'text'}
                ,{field:'party', title:'面貌', width:'7%', sort: true,edit: 'text'}
                ,{field:'birthday', title:'生日', width:'7%', sort: true,edit: 'text'}
                ,{field:'race', title:'族类', width:'7%', sort: true,edit: 'text'}
                ,{field:'education', title:'教育', width:'7%', sort: true,edit: 'text'}
                ,{field:'speciality', title:'专业', width:'7%', sort: true,edit: 'text'}
                ,{field:'hobby', title:'爱好', width:'7%', sort: true,edit: 'text'}
                ,{field:'remark', title:'备注', width:'7%', sort: true,edit: 'text'}
                ,{field:'createDate', title:'导入时间', width:'7%', sort: true,edit: 'text'}
                ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:'15%'}
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
                    $.post("deleteByEmployee",json,function (data) {
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
                    $.post("updateEmployee",json,function (data) {
                        if(data!="0"){
                            layer.msg("修改成功",{icon:1});
                        }else {
                            layer.msg("修改失败,请检查!",{icon:5});
                        }
                    });
                    layer.close(index);
                })
            }else if(obj.event==='find'){

                layer.alert("ID&nbsp;&nbsp;"+data.id+"<br>部门ID&nbsp;&nbsp;"+data.deptId+ "<br>职位ID&nbsp;&nbsp;" +data.jobId+"<br>名称ID&nbsp;&nbsp;"+data.name+"<br>卡号ID&nbsp;&nbsp;" +data.cardId+"<br>地址&nbsp;&nbsp;"+data.address+"<br>postCode&nbsp;&nbsp;"+data.postCode+"<br>手机号&nbsp;&nbsp;"+data.tel+"<br>备用手机号&nbsp;&nbsp;" +data.phone+"<br>QQ号&nbsp;&nbsp;" +data.qqNum+"<br>邮箱&nbsp;&nbsp;" + data.email+"<br>性别&nbsp;&nbsp;"+data.sex+"<br>政治面貌&nbsp;&nbsp;"+data.party+"<br>生日&nbsp;&nbsp;"+data.birthday+"<br>族类&nbsp;&nbsp;"+data.race+"<br>教育学历&nbsp;&nbsp;"+data.education+"<br>专业&nbsp;&nbsp;"+data.speciality+"<br>爱好&nbsp;&nbsp;" +data.hobby+"<br>备注&nbsp;&nbsp;" +data.remark+"<br>导入时间&nbsp;&nbsp;"+data.createDate ,{
                    title: '当前行数据：'
                });

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
