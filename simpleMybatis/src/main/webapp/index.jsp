<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="layui/css/layui.css">
    <script src="layui/layui.js"></script>
    <script src="js/jquery.min.js"></script>
    <style></style>
</head>
<body>
<div class="layui-layout layui-layout-admin">
    <div class="layui-header layui-bg-green">
        <div class="layui-logo layui-hide-xs layui-bg-black" style="font-size: 20px">五邑大学人事系统</div>
        <!-- 头部区域（可配合layui 已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <!-- 移动端显示 -->
            <li class="layui-nav-item layui-show-xs-inline-block layui-hide-sm" lay-header-event="menuLeft">
                <i class="layui-icon layui-icon-spread-left"></i>
            </li>

        </ul>
        <ul class="layui-nav layui-layout-right">

            <li class="layui-nav-item layui-hide-xs"><a href=""><i class="layui-icon layui-icon-time"></i>
                <span id="timeText" > </span>
            </a></li>

            <li class="layui-nav-item layui-hide-xs"><a href="logout">退出登录</a></li>

            <li class="layui-nav-item" lay-header-event="menuRight" lay-unselect>
                <a href="javascript:;">
                    <i class="layui-icon layui-icon-more-vertical"></i>
                </a>
            </li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black" >
        <div style="text-align: center ; margin-top: 15px">
            <li class="layui-nav-item layui-hide layui-show-md-inline-block">
                <a href="javascript:;" data-method="setTop" id="myinfo">
                    <img src="imgs/1.jpg" class="layui-nav-img" style="width: 120px;height: 120px">
                </a>
                <p>${user.username}，欢迎登录系统</p>
            </li>
        </div>

        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree" lay-filter="test">
                <li class="layui-nav-item layui-bg-green" style="margin-top: 15px"><a href="javascript:;" style="font-size: 16px;color: #00F7DE">学校人事信息管理</a></li>

                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;"><i class="layui-icon layui-icon-username" style="font-size: 19px; color: #1E9FFF;"></i>
                        &nbsp;用户管理</a>
                    <dl class="layui-nav-child" style="padding-left: 20px">
                        <dd><a href="javascript:;"
                               data-url="addUser.jsp"
                               data-id="addUser"
                               data-title="<i class='layui-icon layui-icon-add-1'
                            style='font-size: 17px; font-weight: bold; color:#009688;'></i>用户添加"
                               data-type="tabAdd"
                               class="site-demo-active"
                        ><i class="layui-icon layui-icon-add-1" style="font-size: 19px; color: #1E9FFF;"></i>
                            &nbsp;添加用户</a></dd>

                        <dd><a href="javascript:;"
                               data-url="selectUser.jsp"
                               data-id="selectUser"
                               data-title="<i class='layui-icon layui-icon-search'
                            style='font-size: 17px; font-weight: bold; color:#009688;'></i>用户查询"
                               data-type="tabAdd"
                               class="site-demo-active"><i class="layui-icon layui-icon-search" style="font-size: 19px; color: #1E9FFF;"></i>
                            &nbsp;查询用户</a></dd>

                    </dl>
                </li>

                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;"><i class="layui-icon layui-icon-username" style="font-size: 19px; color: #1E9FFF;"></i>
                        &nbsp;部门管理</a>
                    <dl class="layui-nav-child" style="padding-left: 20px">
                        <dd><a href="javascript:;"
                               data-url="addDept.jsp"
                               data-id="addDept"
                               data-title="<i class='layui-icon layui-icon-add-1'
                            style='font-size: 17px; font-weight: bold; color:#009688;'></i>添加部门"
                               data-type="tabAdd"
                               class="site-demo-active"
                        ><i class="layui-icon layui-icon-add-1" style="font-size: 19px; color: #1E9FFF;"></i>
                            &nbsp;添加部门</a></dd>
                        <dd><a href="javascript:;"
                               data-url="selectDept.jsp"
                               data-id="selectDept"
                               data-title="<i class='layui-icon layui-icon-search'
                            style='font-size: 17px; font-weight: bold; color:#009688;'></i>部门查询"
                               data-type="tabAdd"
                               class="site-demo-active"
                        ><i class="layui-icon layui-icon-search" style="font-size: 19px; color: #1E9FFF;"></i>
                            &nbsp;查询部门</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;"><i class="layui-icon layui-icon-username" style="font-size: 19px; color: #1E9FFF;"></i>
                        &nbsp;职位管理</a>
                    <dl class="layui-nav-child" style="padding-left: 20px">
                        <dd><a href="javascript:;"

                               data-url="addJob.jsp"
                               data-id="addJob"
                               data-title="<i class='layui-icon layui-icon-add-1'
                            style='font-size: 17px; font-weight: bold; color:#009688;'></i>职位添加"
                               data-type="tabAdd"
                               class="site-demo-active"
                        ><i class="layui-icon layui-icon-add-1" style="font-size: 19px; color: #1E9FFF;"></i>
                            &nbsp;添加职位</a></dd>
                        <dd><a href="javascript:;"

                               data-url="selectJob.jsp"
                               data-id="selectJob"
                               data-title="<i class='layui-icon layui-icon-search'
                            style='font-size: 17px; font-weight: bold; color:#009688;'></i>职位查询"
                               data-type="tabAdd"
                               class="site-demo-active"
                        ><i class="layui-icon layui-icon-search" style="font-size: 19px; color: #1E9FFF;"></i>
                            &nbsp;查询职位</a></dd>
                    </dl>
                </li>

                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;"><i class="layui-icon layui-icon-username" style="font-size: 19px; color: #1E9FFF;"></i>
                        &nbsp;员工管理</a>
                    <dl class="layui-nav-child" style="padding-left: 20px">
                        <dd><a href="javascript:;"
                               data-url="addEmployee.jsp"
                               data-id="addEmployee"
                               data-title="<i class='layui-icon layui-icon-add-1'
                            style='font-size: 17px; font-weight: bold; color:#009688;'></i>员工添加"
                               data-type="tabAdd"
                               class="site-demo-active"
                        ><i class="layui-icon layui-icon-add-1" style="font-size: 19px; color: #1E9FFF;"></i>
                            &nbsp;添加员工</a></dd>
                        <dd><a href="javascript:;"
                               data-url="selectEmployee.jsp"
                               data-id="selectEmployee"
                               data-title="<i class='layui-icon layui-icon-search'
                            style='font-size: 17px; font-weight: bold; color:#009688;'></i>员工查询"
                               data-type="tabAdd"
                               class="site-demo-active"
                        ><i class="layui-icon layui-icon-search" style="font-size: 19px; color: #1E9FFF;"></i>
                            &nbsp;查询员工</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;"><i class="layui-icon layui-icon-username" style="font-size: 19px; color: #1E9FFF;"></i>
                        &nbsp;角色管理</a>
                    <dl class="layui-nav-child" style="padding-left: 20px">
                        <dd><a href="javascript:;"
                               data-url="addRole.jsp"
                               data-id="addRole"
                               data-title="<i class='layui-icon layui-icon-add-1'
                            style='font-size: 17px; font-weight: bold; color:#009688;'></i>角色添加"
                               data-type="tabAdd"
                               class="site-demo-active"

                        ><i class="layui-icon layui-icon-add-1" style="font-size: 19px; color: #1E9FFF;"></i>
                            &nbsp;添加角色</a></dd>
                        <dd><a href="javascript:;"

                               data-url="selectRole.jsp"
                               data-id="selectRole"
                               data-title="<i class='layui-icon layui-icon-search'
                            style='font-size: 17px; font-weight: bold; color:#009688;'></i>角色查询"
                               data-type="tabAdd"
                               class="site-demo-active"
                        ><i class="layui-icon layui-icon-search" style="font-size: 19px; color: #1E9FFF;"></i>
                            &nbsp;查询角色</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;"><i class="layui-icon layui-icon-username" style="font-size: 19px; color: #1E9FFF;"></i>
                        &nbsp;公告管理</a>
                    <dl class="layui-nav-child" style="padding-left: 20px">
                        <dd><a href="javascript:;"
                               data-url="addNotice.jsp"
                               data-id="addNotice"
                               data-title="<i class='layui-icon layui-icon-add-1'
                            style='font-size: 17px; font-weight: bold; color:#009688;'></i>添加公告"
                               data-type="tabAdd"
                               class="site-demo-active"><i class="layui-icon layui-icon-add-1" style="font-size: 19px; color: #1E9FFF;"></i>
                            &nbsp;添加公告</a></dd>
                        <dd><a href="javascript:;"
                                data-url="selectNotice.jsp"
                               data-id="selectNotice"
                               data-title="<i class='layui-icon layui-icon-search'style='font-size: 17px; font-weight: bold; color:#009688;'></i>查询公告 "
                               data-type="tabAdd" class="site-demo-active"
                        ><i class="layui-icon layui-icon-search" style="font-size: 19px; color: #1E9FFF;"></i>
                            &nbsp;查询公告</a></dd>
                    </dl>
                </li>

                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;"><i class="layui-icon layui-icon-username" style="font-size: 19px; color: #1E9FFF;"></i>
                        &nbsp;上传下载</a>
                    <dl class="layui-nav-child" style="padding-left: 20px">
                        <dd><a href="javascript:;"
                            data-url="uploadFile.jsp"
                            data-id="uploadFile"
                            data-title="<i class='layui-icon layui-icon-upload-drag'
                                           style='font-size: 17px; font-weight: bold; color:#009688;'></i>文件上传"
                            data-type="tabAdd"
                            class="site-demo-active"><i class="layui-icon layui-icon-add-1" style="font-size: 19px; color: #1E9FFF;"></i>
                            &nbsp;文件上传</a></dd>
                        <dd><a href="javascript:;"
                               data-url="download.jsp"
                               data-id="selectFiles"
                               data-title="<i class='layui-icon layui-icon-print'
                                           style='font-size: 17px; font-weight: bold; color:#009688;'></i>文件下载"
                               data-type="tabAdd"
                               class="site-demo-active"><i class="layui-icon layui-icon-search" style="font-size: 19px; color: #1E9FFF;"></i>
                            &nbsp;文件下载</a></dd>
                    </dl>
                </li>


            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->

        <!--      这里是选项卡的配置内容  -->
        <div class="layui-tab layui-tab-brief" lay-filter="demo" lay-allowclose="true">
            <ul class="layui-tab-title">
                <li class="layui-this">
                    <i class="layui-icon layui-icon-home" style="font-size: 18px;color: #1E9FFF;font-weight: bold"></i>
                    欢迎首页</li>
                <!--                <li>用户管理</li>-->
                <!--                <li>权限分配</li>-->
                <!--                <li>商品管理</li>-->
                <!--                <li>订单管理</li>-->
            </ul>
            <div class="layui-tab-content">
                <div class="layui-tab-item layui-show">
                    <iframe src="welcome.jsp" width="100%" height="540px"></iframe>
                </div>
                <!--                <div class="layui-tab-item">内容2</div>-->
                <!--                <div class="layui-tab-item">内容3</div>-->
                <!--                <div class="layui-tab-item">内容4</div>-->
                <!--                <div class="layui-tab-item">内容5</div>-->
            </div>
        </div>
        <div style="padding: 15px;">
            <!--<iframe src="lunbo.html" width="100%;"height="600px"></iframe>-->
        </div>
    </div>

    <div class="layui-footer" style="text-align: center">
        <!-- 底部固定区域 -->
        @2021   五邑大学智能制造学部 电子信息工程(信息安全)
    </div>
    <!--    <img src="imgs/school.jpg" alt="五邑大学">-->

</div>
</body>

<!-- 放在body标签内会影响页面加载 -->
<script>



    $.ajaxSetup({
//设置ajax请求结束后的执行动作
        complete:
            function (XMLHttpRequest, textStatus) {
            console.log(XMLHttpRequest);
// 通过XMLHttpRequest取得响应头，sessionstatus
                var redirect = XMLHttpRequest.getResponseHeader("REDIRECT");
                if (redirect == "REDIRECT") {
                    var win = window;
                    while (win != win.top) {
                        win = win.top;
                    }
                    win.location.href = XMLHttpRequest.getResponseHeader("CONTEXTPATH");
                }
            }
    });


    //jq页面加载完成事件
    $(function(){
        //创建定时器
        var mytime=setInterval(function () {
            getTime();
        },1000);
    });

    //单独定义一个方法，可以获取时间后按照自己的显示方式定义
    function getTime(){
        var time=new Date();
        //分别获取年月日，时分秒
        var year=time.getFullYear();
        var month=(time.getMonth() +1)<10?('0'+(time.getMonth()+1)):time.getMonth()+1;
        var day=time.getDate()<10?('0'+time.getDate()):time.getDate();
        var hour=time.getHours()<10?('0'+time.getHours()):time.getHours();
        var min=time.getMinutes()<10?('0'+time.getMinutes()):time.getMinutes();
        var seconds=time.getSeconds()<10?('0'+time.getSeconds()):time.getSeconds();

        var timeString=year+"年"+month+"月"+day+"日&nbsp;&nbsp;"+hour+":"+min+":"+seconds +"&nbsp;&nbsp;"+"星期"+"日一二三四五六".charAt(time.getDay());
        $("#timeText").html(timeString);

    }


    //JS
    layui.use(['element', 'layer', 'util'], function(){
        var element = layui.element
            ,layer = layui.layer
            ,util = layui.util
            ,$ = layui.$;

        //头部事件 右边
        util.event('lay-header-event', {
            //左侧菜单事件
            menuLeft: function(othis){
                layer.msg('展开左侧菜单的操作', {icon: 0});
            }
            ,menuRight: function(){
                layer.open({
                    title:"五邑大学简介",
                    type: 1
                    ,content: '<div style="padding: 15px;"> <img src="imgs/index.jpg" alt="五邑大学" width="220px" height="100px">学校简介\n' +
                        '五邑大学是由广东省人民政府于1985年设立的以工科为主的多科性大学，是广东省较早获得硕士、学士学位授予权的地方高校，具有接收港澳台侨学生、国际学生资格和推荐优秀应届本科毕业生免试攻读研究生资格，现为广东省高水平理工科大学建设高校。\n' +
                        '\n' +
                        '学校坚持践行“好学、多思、求实、创新”的校训，秉承“根植侨乡，服务社会，内外合力，特色发展”的办学理念，积极培养思想品德高尚、基础知识扎实，具有国际化视野、较强实践能力和创新创业能力，适应地方经济社会发展需求的高素质应用型人才。\n' +
                        '\n' +
                        '学校位于粤港澳大湾区重要节点城市、“中国第一侨乡”——广东省江门市，校园占地面积1000余亩，总建筑面积近70万平方米。环境优美，基础设施齐全，办学条件良好。学校面向全国24个省区市及港澳台地区招收本科学生，面向国内外招收研究生。现有各类在籍学生近2.4万人，其中全日制本科生近2万人，研究生800余人。\n' +
                        '\n' +
                        '学校设有19个教学机构，87个本科专业（方向），涉及工、理、经、管、文、法、艺术等7个学科门类，理工类专业（方向）占比67%。现有国家级一流本科专业建设点6个，国家级特色专业、国家级专业综合改革试点共5个；省级一流本科专业建设点9个，省级重点（名牌）专业、省级应用型人才培养示范专业等共39个。国家级大学生校外实践教育基地1个，省级大学生实践教学基地24个，省级示范性教师教育实践基地5个，省级实验教学示范中心14个。建有现代工业生产技术综合训练中心、生物科技与大健康学院实验中心、人工智能学习馆等一批实验实训基地。其中，“现代工业生产技术综合训练中心”是学校培养适应产业需求的现代技术创新型人才的重要基地，是融人才培养、科学研究、技术创新、企业服务、学生创新创业等功能于一体的示范性实训中心。学校人才培养质量得到社会广泛认可，本科生初次就业率多年位居全省公办本科高校前列。\n' +
                        '\n' +
                        '学校现有10个省级重点学科，7个一级学科硕士学位授权点、3个二级学科硕士学位授权点以及5个专业硕士授权类别，硕士授权覆盖学校所有理工科专业。\n' +
                        '\n' +
                        '学校现有专任教师1100余人。专任教师高级职称占比达40%，博士学位占比达51%；拥有国家级高层次人才31人（其中包括院士5人、长江学者5人、国家“杰青”4人、海外“杰青”1人、国家“优青”1人、国家“万人计划”入选者1人等），省级高层次人才22人，海外各类优秀人才67人。\n' +
                        '\n' +
                        '学校拥有省重点实验室1个，省级新型研发机构1个、省级工程技术研究中心7个、省级人文社科研究基地2个、省级非物质文化遗产研究基地1个、省级文艺评论基地1个、省级区域产业知识产权分析评议中心1个、市厅级科研平台58个。学校着力在生物医药、新材料、智能制造等领域构建了“粤港澳大湾区人类重大疾病大动物模型联合创新基地”“数字光芯片联合实验室”“江门市大健康国际创新研究院”“纺织新材料粤港联合实验室”“江门市海洋创新发展研究中心”等高水平创新平台，服务地方经济社会高质量发展。\n' +
                        '\n' +
                        '学校大力开展对外交流合作，先后与美国、英国、德国、澳大利亚、日本、葡萄牙、香港、澳门等18个国家及地区共60多所高校及科研机构建立了合作关系，在学科建设、人才培养、学术研究、师资培训等方面开展了实质性合作。其中，与美国罗格斯大学、美国罗德岛大学、澳大利亚伍伦贡大学、加拿大英属哥伦比亚大学、英国利物浦大学、英国利物浦热带医学院、香港理工大学、澳门大学等13所高水平大学或科研机构共建国（境）外研究生联合培养基地，与“一带一路”沿线国家和地区开展短期研修项目。\n' +
                        '\n' +
                        '新时代、新使命、新征程、新作为。五邑大学坚持以习近平新时代中国特色社会主义思想为指导，深入贯彻习近平总书记对广东重要讲话和重要指示批示精神，抢抓“双区”建设重大历史机遇，大力加强内涵建设，深入推动改革创新，不断促进高质量发展，为建设“应用型人才培养特色鲜明，服务地方产业发展能力突出”的高水平理工科大学而努力奋斗！\n' +
                        '\n' +
                        '发布部门：党政办公室\n' +
                        '更新时间：2021年5月</div>'
                    ,area: ['260px', '100%']
                    ,offset: 'rt' //右上角
                    ,anim: 5
                    ,shadeClose: true
                });
            }
        });

        //触发事件
        var active = {
            setTop:function(){
                var that=this;
                //多窗口模式，层叠置顶
                layer.open({
                    type:2,
                    title:'个人资料',
                    area: ['390px','560px'],
                    shade:0,
                    maxmin:true,
                    content:"myinfo.jsp",
                    zIndex:layer.zIndex,
                });

            },



            //url:要添加的tab的内容显示路径，id：定义一个id用来识别唯一，title:添加选项卡的标题
            tabAdd: function (url, id, title) {
                //新增一个Tab项 传入三个参数，分别对应其标题，tab页面的地址，还有一个规定的id，是标签中data-id的属性值
                //关于tabAdd的方法所传入的参数可看layui的开发文档中基础方法部分
                element.tabAdd('demo', {  //这里的demo对应着选项卡中的demo
                    title: title,
                    content: '<iframe data-frameid="' + id
                        + '" scrolling="auto" frameborder="0" src="'
                        + url + '" style="width:98%;height: 500px"></iframe>',
                    id: id
                    //规定好的id
                })
                element.render('tab');
            },
            tabChange: function (id) {
                //切换到指定Tab项
                element.tabChange('demo', id); //根据传入的id传入到指定的tab项
            },
            tabDelete: function (id) {
                element.tabDelete("demo", id);//删除
            },
            tabDeleteAll: function (ids) {//删除所有
                $.each(ids, function (i, item) {
                    element.tabDelete("demo", item); //ids是一个数组，里面存放了多个id，调用tabDelete方法分别删除
                })
            }
        };

        $('#myinfo').click(function () {
            var othis=$(this),method=othis.data('method');
            active[method]?active[method].call(this,othis):'';
        });


        //当点击有site-demo-active属性的标签时，即左侧菜单栏中内容 ，触发点击事件
        $('.site-demo-active').on(
            'click',
            function () {
                var dataid = $(this);

                //这时会判断右侧.layui-tab-title属性下的有lay-id属性的li的数目，即已经打开的tab项数目
                if ($(".layui-tab-title li[lay-id]").length <= 0) {
                    //如果比零小，则直接打开新的tab项
                    active
                        .tabAdd(dataid.attr("data-url"), dataid
                            .attr("data-id"), dataid
                            .attr("data-title"));
                } else {
                    //否则判断该tab项是否以及存在

                    var isData = false; //初始化一个标志，为false说明未打开该tab项 为true则说明已有
                    $.each($(".layui-tab-title li[lay-id]"),
                        function () {
                            //如果点击左侧菜单栏所传入的id 在右侧tab项中的lay-id属性可以找到，则说明该tab项已经打开
                            if ($(this).attr("lay-id") == dataid
                                .attr("data-id")) {
                                isData = true;
                            }
                        })
                    if (isData == false) {
                        //标志为false 新增一个tab项
                        active.tabAdd(dataid.attr("data-url"), dataid
                            .attr("data-id"), dataid
                            .attr("data-title"));
                    }
                }
                //最后不管是否新增tab，最后都转到要打开的选项页面上
                active.tabChange(dataid.attr("data-id"));
            });




    });
</script>
</html>