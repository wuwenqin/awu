package com.ssm.controller;

import cn.hutool.json.JSONObject;
import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ssm.entity.Counts;
import com.ssm.entity.User;
import com.ssm.mapper.UserMapper;
import com.ssm.service.UserService;
import com.ssm.utils.LoginUtils;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import springfox.documentation.spring.web.json.Json;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Controller
public class UserController {
    @Autowired  //自动注入
    private UserService userService;

    @ApiImplicitParam(required = true)
    @ApiOperation(value = "测试接口", notes = "测试接口")         //API注释
    @RequestMapping(value = "test", method = {RequestMethod.GET})  //限制只能通过 GET 才能访问该接口
    @ResponseBody
    public String testvoid() {
        System.out.println(222);
        return "{code:200}";
    }


    //    @ApiImplicitParam(required = true)
//    @ApiOperation(value = "登录接口", notes = "登录接口")
    @RequestMapping(value = "login", method = {RequestMethod.POST})  //限制只能通过 POST 才能访问该接口
    public String selectUserByAcountOrPhone(@RequestParam("id") String id, @RequestParam("password") String password,
                                    @RequestParam("checkcode") String checkcode  ,HttpServletRequest request,HttpSession session) {
        //验证码是否正确 ,session.getAttribute("code") 这一句中的code对应的是生成验证码的类CheckCodeUtil中的code，必须对应上生成验证码的session
        String code= (String) session.getAttribute("code");
        if(checkcode!=null&&!"".equalsIgnoreCase(checkcode)){  //使用equalsIgnoreCase不区分大小写
            if (checkcode.equalsIgnoreCase(code)){
                System.out.println("验证成功");
            }else{
                request.setAttribute("loginmsg","验证码有误");
                return null;
            }
        }

        User user = new User();
        user.setPhone(id);
        user.setPassword(password);
//        System.out.println(user);
        List<User> list = userService.login(user);
        if (list != null && list.size() > 0) {
//            HttpSession httpSession = request.getSession();
            user = list.get(0);
            //查询数据库中各个表数据数量
            Counts count=userService.selectCounts();
            System.out.println("各表数量："+count);
            session.setAttribute("counts",count);
            session.setAttribute("user", user);
            return "index";
        } else {
            //返回登录失败的数据给前端显示
            request.setAttribute("loginmsg", "登陆失败，请检查用户名或者密码");
            return "login";
        }
    }

    @RequestMapping("logout")
    public String logOut(HttpServletRequest httpServletRequest) {
        //退出登录的思路是将session中的对象删除
        HttpSession session = httpServletRequest.getSession();
        session.removeAttribute("user");

        return "login";
    }


    @ApiImplicitParam(required = true)
    @ApiOperation(value = "注册接口", notes = "注册接口")
    @RequestMapping(value = "register", method = {RequestMethod.POST} )
    //限制只能通过 POST 才能访问该接口
    @ResponseBody
    public String registUser(@RequestParam("username") String username, @RequestParam("password") String password , @RequestParam("phone") String phone,@RequestParam("pw") String pw, @RequestParam("checkcode")String checkcode,HttpServletRequest request,HttpSession session) throws InterruptedException {
        //验证码是否正确 ,session.getAttribute("code") 这一句中的code对应的是生成验证码的类CheckCodeUtil中的code，必须对应上生成验证码的session
        String code= (String) session.getAttribute("code");
        if(checkcode!=null&& ! ("".equals(checkcode))){  //使用equalsIgnoreCase不区分大小写
            if (checkcode.equalsIgnoreCase(code)){
                System.out.println("验证成功");
            }else{
                request.setAttribute("registmsg","验证码有误");
                return null;
            }
        }
        //判断两次密码是否一致
        if(!password.equals(pw)){
            request.setAttribute("registmsg","两次密码不一致");
            return null;
        }
        LoginUtils loginUtils=new LoginUtils();
        if(!loginUtils.isChinaPhoneLegal(phone)){
            request.setAttribute("registmsg","手机号码无效，请输入正确的手机号码");
            return null;
        }

        if (!loginUtils.isLetterDigit(password)){
            request.setAttribute("registmsg","密码须是6-12位由数字和字母组成");
            return null;
        }


        User user = new User();
        if (username == null) {
            request.setAttribute("registmsg","用户名为空");
        }else {
            user.setUsername(username);
        }
        user.setPassword(password);
        Integer roleId=null;
        if (roleId == null) {
            roleId = 1;
            user.setRoleId(roleId);
            //默认赋值为1，对应普通员工
        } else if (roleId != null) user.setRoleId(roleId);
        else if (roleId > 3) {
            request.setAttribute("registmsg","角色ID有误");
            return null;
        }

        if (phone.isEmpty()) {
            request.setAttribute("registmsg","手机号不能为空");
            return null;
        }
        user.setCreatedate(new Date());
        user.setPhone(phone);
//        user.setRemark(remark);

        if (userService.regist(user)) {
            request.setAttribute("registmsg","注册成功!");
            Thread.sleep(2000);
            return "register successful";
        } else {
            request.setAttribute("registmsg","注册失败，用户名已存在或手机号重复，请联系管理员");
            return  "register failed";
        }

    }


    @ApiImplicitParam(required = true)
    @ApiOperation(value = "修改密码接口", notes = "修改密码接口")
    @RequestMapping(value = "modify", method = {RequestMethod.PUT})  //限制只能通过 PUT 才能访问该接口
    @ResponseBody
    public List<User> modifyUserInformation(@RequestParam("id") String id, @RequestParam("originPassword") String originPassword, @RequestParam("newPassword") String newPassword) {
        if (id.equals("") || originPassword.equals("") || newPassword.equals("")) {
            System.out.println("请填入完整信息");
        }
        return userService.modifyPassword(id, originPassword, newPassword);
    }

    @ApiImplicitParam(required = true)
    @ApiOperation(value = "删除账号接口", notes = "删除账号接口")
    @RequestMapping(value = "delete", method = {RequestMethod.DELETE})  //限制只能通过 GET 才能访问该接口
    public String deleteUser(@RequestParam("phone") String phone) {

        if (phone.equals("")) {
            System.out.println("请输入ID");
        }
        userService.deleteUserInformation(phone);


        return null;
    }

    @RequestMapping("checkPhone")
    @ResponseBody
    public String checkPhone(String phoneString){
        int i=userService.checkPhone(phoneString);
        return i+"";
    }

    //查询分页以及展示 ,加入 produces = "text/html;charset=UTF-8") 解决中文乱码问题
    @RequestMapping(value = "selectUser",produces = "text/application;charset=UTF-8")
    @ResponseBody
    public String selectUser(int page,int limit){
        //使用mybatis的分页插件
        //(1-1 )*10
//        int start=(page-1)*limit  ;
//        System.out.println("page:"+page+"limit:"+limit+"start:"+start);
        //直接页数，然后每页限制的条数即可， 要去看一下mybatis分页的原理
        PageHelper.startPage(page,limit);
//        PageHelper.orderBy("id ASC");
        //查询数据库，调用service层
        List<User> list= userService.selectUsers();
        list.forEach(li-> System.out.println(li));
        PageInfo<User> pageInfo=new PageInfo<>(list);
        long total=pageInfo.getTotal(); //获得所有数量
        System.out.println("总数量:"+total);
        //开始构建json数据，提供给前端显示，
//        String totalStr=JSON.parse(total);
        /**
         * "code":res.code,解析接口状态
         * "msg":res.msg,解析提示文本
         * "count":res.count,解析数据长度
         * "data":res.data ,解析数据列表
         */
        Map<String,Object> map=new HashMap<>();
        map.put("code",0);
        map.put("msg","加载中");
        map.put("count",total);
        map.put("data",list);

        //这里用的是阿里爸爸的插件fastjson
        String json= JSON.toJSONString(map);
        System.out.println("构建的JSON数据:"+json);

        return json;
    }


//修改用户
    @RequestMapping(value = "updateUser",method = RequestMethod.POST,
            produces = "text/application;charset=UTF-8")
    @ResponseBody
    public String updateUser(String json){
        System.out.println("要修改的数据:"+json);
        User user=JSON.parseObject(json,User.class);

        //调用service
        int i=userService.updateUser(user);
        return i+"" ;
    }
//删除用户
@RequestMapping(value = "deleteById",method = RequestMethod.POST,
        produces = "text/application;charset=UTF-8")
@ResponseBody
public String deleteById(Integer id){
    System.out.println("要删除的id:"+id);

    //调用service
    int i=userService.deleteUserById(id);

    return i+"" ;
}


@RequestMapping(value = "selectByWhereUsers",produces = "text/application;charset=utf-8")
@ResponseBody
public String selectByWhereUsers(User user){
    System.out.println("条件查询的数据"+user);
        if(user!=null){
            //查数据
            PageHelper.startPage(1,10);
            List<User> list= userService.selectByWhereUserLike(user);
            PageInfo<User> pageInfo=new PageInfo<>(list);
            long total=pageInfo.getTotal();


            list.forEach(li-> System.out.println(li));
            Map<String,Object> map=new HashMap<>();
            map.put("code",0);
            map.put("msg","");
            map.put("data",list );
            map.put("total",total);
            String json=JSON.toJSONString(map);
            return json;
        }
return null ;

}


}
