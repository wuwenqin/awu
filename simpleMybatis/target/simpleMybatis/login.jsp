<%--
  Created by IntelliJ IDEA.
  User: 吴文钦
  Date: 2021/7/4
  Time: 18:38:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="loginstyle/css/supersized.css"/>
    <script src="js/jquery.min.js"></script>
<%--    <script type="text/javascript" src="js/indexRain.js"></script>   &lt;%&ndash;下雪特效&ndash;%&gt;--%>
    <script charset="UTF-8" src="js/click.js"></script>   <%--鼠标特效--%>
    <script src="loginstyle/js/jquery-1.8.2.min.js"></script>
    <script src="loginstyle/js/supersized.3.2.7.min.js"></script>
    <script src="loginstyle/js/supersized-init.js"></script>
    <link rel="stylesheet" href="layui/css/layui.css">
    <script src="layui/layui.js"></script>
    <style>
        * {
            margin:0 auto;
        }

        .login_div1{
            position:absolute;
            top: 150px  ;
            right: 100px    ;
            width: 450px;
            height: 500px;
            border-radius: 5px;
            background-color: #ffffff;
            text-align: center;
            box-shadow: 0px 0px 20px #ffffff;
        }

        .login_p1{
            margin-top: 20px;
            color: #1E9FFF;
            font-size: 25px;
            font-weight: bold;
        }

        #demo1{
            margin-top: 40px;
            margin-left: 70px;
        }

        .login_top{
            margin-top: 30px;
        }
    </style>

</head>



<body>
<%--侧边栏未点击出现则全屏投射，出现则分隔开--%>
<%--<div id="wrap">--%>
<%--    <div id="project-top">--%>
<%--        <div class="info">--%>
<%--            <div class="text">--%>
<%--                人事系统--%>
<%--            </div>--%>
<%--            <div class="title">--%>
<%--                LIFE IS A FUCKING MOVIE!--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>




<%--登陆界面--%>
<div class="login_div1" >
    <p class="login_p1">人事-后台登录</p>
    <form class="layui-form layui-form-pane" action="login" id="demo1" method="POST">
        <div class="layui-form-item login_top">
            <label class="layui-form-label" style="width: 60px">
                <i class="layui-icon layui-icon-username" style="font-size: 25px;color: #1E9FFF;font-weight: bold"></i>
            </label>
            <div class="layui-input-inline">
                <input type="text" name="id" lay-verify="required" placeholder="请输入用户名" autocomplete="off"
                class="layui-input"style="width: 250px">
            </div>
        </div>
<%--密码--%>
        <div class="layui-form-item login_top">
            <label class="layui-form-label" style="width: 60px">
                <i class="layui-icon layui-icon-password" style="font-size: 25px;color: #1E9FFF;font-weight: bold"></i>
            </label>
            <div class="layui-input-inline">
                <input type="password" name="password" lay-verify="required" placeholder="请输入密码" autocomplete="off"
                       class="layui-input"style="width: 250px">
            </div>
        </div>
<%--验证码--%>
        <div class="layui-form-item login_top">
            <label class="layui-form-label" style="width: 60px">
                <i class="layui-icon layui-icon-vercode" style="font-size: 25px;color: #1E9FFF;font-weight: bold"></i>
            </label>
            <div class="layui-input-inline">
                <input type="text" name="checkcode" lay-verify="required" placeholder="请输入验证码" autocomplete="off"
                       class="layui-input"style="width: 110px">
            </div>

            <div class="layui-input-label">
                <a href="javascript:void(0)" id="checkcode">
                    <img src="CheckCodeUtil" width="100px" height="38px" alt=""
                         style="margin-left: -100px;border: 1px #000000 solid" id="imgcode">
                </a>
            </div>
        </div>

        <div class="layui-form-item login_top">
            <label class="layui-input-inline">
                <button class="layui-btn layui-bg-blue" lay-submit="" lay-filter="demo1"
                        style="width: 310px">登录</button>
            </label>
        </div>


    </form>

    <div style="margin-left: 70px">
        <div class="layui-form-item login_top" id="layerDemo">
            <label class="layui-input-inline">
                <button data-method="notice" class="layui-btn layui-bg-blue"
                        style="width: 310px">注册</button>
            </label>
        </div>
        <div class="layui-form-item login_top" style="width: 310px;color: #000000">
            <p>向前一小步，文明一大步</p>
        </div>
    </div>

</div>

</body>

<script>

    $(function () {
        $("#checkcode").click(function () {
            $("#imgcode").attr("src","/CheckCodeUtil?time="+new Date().getTime());

        });

        var loginmsg="${loginmsg}";
    if(loginmsg!=""){
        layer.msg(loginmsg,{icon:5});
    }


    });



    layui.use(['form','layedit','layer','jquery'],function () {
var form=layui.form,
    layer=layui.layer,
    layedit=layui.layedit,
    $ =layui.jquery;

//获取登录的数据
        var login="${loginInfo}";
        if(login!=""){
            layer.msg(login,{icon:5});
        }

        //触发事件
        var active={
            notice:function () {

                //示范一个公告层
                layer.open({
                    type:2,
                    title:"<span style='font-weight: bold;font-size: 22px;color: #1E9FFF'>注册用户</span>",
                    closeBtn:false,
                    area:['500px','500px'],
                    shade:0.5,
                    id:'LAY_layuipro', //设定一个id，防止重复弹出
                    btn:['取消'],
                    btnAlign:'c',
                    moveType:1, //拖拽模式，0或1
                    content:'register.jsp'
                });
            }
        };

        $('#layerDemo .layui-btn').on('click',function () {
            var othis=$(this),method=othis.data('method');
            active[method] ? active[method].call(this,othis) :'';
        });

        //自定义验证规则
        form.verify({
            title:function (value) {
                if(value.length<5){
                    return '标题至少得5个字符';
                }
            }
            ,pass:[/^[\S]{6,12}$/,'密码必须6到12位，且不能出现空格']
            ,content: function (value) {
                layedit.sync(editIndex);
            }
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
