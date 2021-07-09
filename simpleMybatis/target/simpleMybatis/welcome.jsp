<%--
  Created by IntelliJ IDEA.
  User: 吴文钦
  Date: 2021/7/4
  Time: 13:42:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="layui/css/layui.css">
    <script src="layui/layui.js"></script>

    <style>
        .button_style{
            width: 110px;
            height: 70px;
            font-size: 14px;
        }

        h2{
            /*font-weight: bold;*/
            margin-left: 30px;
            margin-top: 20px;
        }

        .p1{
            line-height: 30px;
            text-indent: 40px;
        }
    </style>

</head>
<body>


<div class="layui-bg-gray" style="padding: 30px;">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md8" style="height: 500px">
            <div class="layui-card">
                <div class="layui-card-header">学校简介</div>
                <div class="layui-card-body">

                    <div class="layui-carousel" id="test1" lay-filter="test1">
                        <div carousel-item="">
                            <div><img src="imgs/001.jpg"alt="广州" style="width: 800px;height: 300px"> </div>
                            <div><img src="imgs/002.jpg"alt="广州" style="width: 800px;height: 300px"></div>
                            <div><img src="imgs/003.jpg"alt="广州" style="width: 800px;height: 300px" ></div>
                            <div><img src="imgs/004.jpg"alt="广州" style="width: 800px;height: 300px"></div>
                            <div><img src="imgs/005.jpg"alt="广州" style="width: 800px;height: 300px"></div>
                        </div>
                    </div>

                </div>

                <div>
                    <h2>学校简介</h2>
                    <hr>
                    <p class="p1">
                        五邑大学是由广东省人民政府于1985年设立的以工科为主的多科性大学，是广东省较早获得硕士、学士学位授予权的地方高校，具有接收港澳台侨学生、国际学生资格和推荐优秀应届本科毕业生免试攻读研究生资格，现为广东省高水平理工科大学建设高校。
                    </p>
                    <p class="p1">
                        学校坚持践行“好学、多思、求实、创新”的校训，秉承“根植侨乡，服务社会，内外合力，特色发展”的办学理念，积极培养思想品德高尚、基础知识扎实，具有国际化视野、较强实践能力和创新创业能力，适应地方经济社会发展需求的高素质应用型人才。
                    </p>
                </div>
            </div>
        </div>
        <div class="layui-col-md4">
            <div class="layui-card">
                <div class="layui-card-header">综合统计</div>
                <div class="layui-card-body">
                    <button class="layui-btn layui-btn-danger  button_style">
<%--                        <i class="layui-icon layui-icon-search" style="font-size: 18px; color: #1E9FFF; font-weight: bold;"></i>--%>
                    用户数量
                    <p style=" font-size: 20px">
                        ${counts.userCount}
                    </p>
                    </button>
                    <button class="layui-btn layui-btn-warm button_style"  >
                        部门数量
                        <p style=" font-size: 20px">
                            ${counts.deptCount}
                        </p>
                    </button>
                    <button class="layui-btn layui-btn-normal button_style"  >
                        职位数量
                        <p style=" font-size: 20px">${counts.jobCount}</p></button>
                </div>

                <div class="layui-card-body">
                    <button class="layui-btn layui-btn-warm button_style" >
                        员工数量
                        <p style=" font-size: 20px">${counts.employeeCount}</p></button>
                    </button>
                    <button class="layui-btn layui-btn-normal button_style" >
                        公告数量
                        <p style=" font-size: 20px">${counts.noticeCount}</p></button>
                    </button>
                    <button class="layui-btn layui-btn-danger button_style" >
                        文件数量
                        <p style=" font-size: 20px">${counts.uploadCount}</p></button>
                    </button>
                </div>
            </div>
        </div>
        <div class="layui-col-md4">
            <div class="layui-card">
                <div class="layui-card-header">快捷入口</div>
                <div class="layui-card-body">
                    <a class="layui-btn layui-btn-normal button_style" href="https://www.layui.com/doc/element/icon.html" target="_blank">
                    <i class="layui-icon layui-icon-face-smile" style="font-weight:bold;font-size: 30px;color: #ffffff;"></i>
                        <p>常用图标</p>
                    </a>

                    <a class="layui-btn layui-btn-warm button_style" href="https://www.layui.com/doc/" target="_blank">
                        <i class="layui-icon layui-icon-face-smile" style="font-weight:bold;font-size: 30px;color: #ffffff;"></i>
                        <p>官方文档</p>
                    </a>

                    <a class="layui-btn layui-btn-danger button_style" href="https://www.layui.com/demo" target="_blank">
                        <i class="layui-icon layui-icon-face-smile" style="font-weight:bold;font-size: 30px;color: #ffffff;"></i>
                        <p>官方示例</p>
                    </a>

                </div>
            </div>
        </div>

        <div class="layui-col-md4">
            <div class="layui-card">
                <div class="layui-card-header">最新公告</div>
                <div class="layui-card-body">
                    <table class="layui-hide" id="test" lay-filter="test"></table>

                </div>
            </div>
        </div>
    </div>
</div>




</body>


<script>
    layui.use(['carousel', 'form','table'], function(){
        var carousel = layui.carousel
            ,form = layui.form
        ,table=layui.table
        ;

        table.render({
            elem: '#test'
            ,url:'noticeFind'
            ,cols: [[

                {field:'title', title:'标题', width:120}
                ,{field:'content', title:'内容', width:120}
            ]]
            ,page: true
        });

        //监听行单击事件（双击事件为：rowDouble）
        table.on('row(test)', function(obj){
            var data = obj.data;

            layer.alert("ID&nbsp;&nbsp;"+data.id+"<br>名称&nbsp;&nbsp;"+data.name+"<br>标题&nbsp;&nbsp;"+data.title+"<br>内容&nbsp;&nbsp;"+data.content+"<br>发布者&nbsp;&nbsp;"+data.userid,{
                title: '当前行数据：'
            });

            //标注选中样式
            obj.tr.addClass('layui-table-click').siblings().removeClass('layui-table-click');
        });


        //常规轮播
        carousel.render({
            elem: '#test1'
            ,arrow: 'always'
            ,interval: 1800
            // ,anim: 'fade'
            ,width:'800px'
            ,height: '300px'

        });

        // //改变下时间间隔、动画类型、高度
        // carousel.render({
        //     elem: '#test2'
        //     ,interval: 1800
        //     ,anim: 'fade'
        //     ,height: '120px'
        // });

        // //设定各种参数
        // var ins3 = carousel.render({
        //     elem: '#test3'
        // });
        // //图片轮播
        // carousel.render({
        //     elem: '#test10'
        //     ,width: '778px'
        //     ,height: '440px'
        //     ,interval: 5000
        // });

        //事件
        carousel.on('change(test4)', function(res){
            console.log(res)
        });

        var $ = layui.$, active = {
            set: function(othis){
                var THIS = 'layui-bg-normal'
                    ,key = othis.data('key')
                    ,options = {};

                othis.css('background-color', '#5FB878').siblings().removeAttr('style');
                options[key] = othis.data('value');
                ins3.reload(options);
            }
        };

        // //监听开关
        // form.on('switch(autoplay)', function(){
        //     ins3.reload({
        //         autoplay: this.checked
        //     });
        // });

        $('.demoSet').on('keyup', function(){
            var value = this.value
                ,options = {};
            if(!/^\d+$/.test(value)) return;

            options[this.name] = value;
            ins3.reload(options);
        });

        //其它示例
        $('.demoTest .layui-btn').on('click', function(){
            var othis = $(this), type = othis.data('type');
            active[type] ? active[type].call(this, othis) : '';
        });
    });
</script>

</html>
