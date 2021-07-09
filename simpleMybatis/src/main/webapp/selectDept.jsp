<%--
  Created by IntelliJ IDEA.
  User: 吴文钦
  Date: 2021/7/7
  Time: 22:40:54
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

<table class="layui-hide" id="test" lay-filter="test"></table>
<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">

    </div>
</script>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-xs" lay-event="delete">删除</a>
</script>


</body>
<script>
    layui.use('table', function () {
        var table = layui.table;
        var $=layui.jquery;
        table.render({
            elem: '#test'
            , url: 'selectDept'
            , toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
            , defaultToolbar: ['filter', 'exports', 'print', { //自定义头部工具栏右侧图标。如无需自定义，去除该参数即可
                title: '提示'
                , layEvent: 'LAYTABLE_TIPS'
                , icon: 'layui-icon-tips'
            }]
            , title: '用户数据表'
            , cols: [[
                {type: 'checkbox', fixed: 'left'}
                , {field: 'did', title: 'ID', width: '20%',  }

                , {field: 'dname', title: '名称', width: '10%', edit: 'text', sort: true}
                , {
                    field: 'dremark', title: '备注', width: '20%',edit: 'text'}
                , {fixed: 'right', title: '操作', toolbar: '#barDemo', width: 150}
            ]]
            , page: true
        });

        //头工具栏事件
        table.on('toolbar(test)', function (obj) {
            var checkStatus = table.checkStatus(obj.config.id);
            switch (obj.event) {
                case 'getCheckData':
                    var data = checkStatus.data;
                    layer.alert(JSON.stringify(data));
                    break;
                case 'getCheckLength':
                    var data = checkStatus.data;
                    layer.msg('选中了：' + data.length + ' 个');
                    break;
                case 'isAll':
                    layer.msg(checkStatus.isAll ? '全选' : '未全选');
                    break;

                //自定义头工具栏右侧图标 - 提示
                case 'LAYTABLE_TIPS':
                    layer.alert('这是工具栏右侧自定义的一个图标按钮');
                    break;
            }
            ;
        });

        //监听行工具事件
        table.on('tool(test)', function (obj) {
            var data = obj.data;

          if(obj.event === 'edit'){
                layer.confirm('确定要修改吗？',function (index) {
                    var json={"json":JSON.stringify(data)};
                    console.log(json);
                    $.post("updateDept",json,function (data) {
                        if(data!="0"){
                            layer.msg("修改成功",{icon:1});
                        }else {
                            layer.msg("修改失败,请检查!",{icon:5});
                        }
                    });
                    layer.close(index);
                })
            }else if(obj.event==='delete'){
                layer.confirm('真的删除么', function(index){
                    obj.del();
                    var json={"id":data.did};
                    console.log(json);
                    $.post("deleteByDept",json,function (data) {
                        if(data!="0"){
                            layer.msg("删除成功",{icon:1});
                        }else {
                            layer.msg("删除失败,请检查!",{icon:5});
                        }
                    });
                    layer.close(index);
                });
            }



        });
    });
</script>
</html>