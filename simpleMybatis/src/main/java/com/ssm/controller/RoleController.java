package com.ssm.controller;


import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ssm.entity.Role;
import com.ssm.entity.User;
import com.ssm.service.RoleService;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class RoleController {

    @Autowired
    RoleService roleService;

    @ApiImplicitParam(required = true)
    @ApiOperation(value = "查询角色", notes = "查询角色接口")
    @RequestMapping(value = "selectRole",produces = "text/application;charset=UTF-8")
    @ResponseBody
    public String selectRole(Integer page,Integer limit){
        PageHelper.startPage(page,limit);
        List<Role> list   = roleService.selectRoleAll();
        list.forEach(li-> System.out.println(li));
        PageInfo<Role> pageInfo=new PageInfo<>(list);
        long total=pageInfo.getTotal();

        Map<String,Object> map=new HashMap<>();
        map.put("code",0);
        map.put("msg","加载中");
        map.put("count",total);
        map.put("data",list);

        //这里用的是阿里爸爸的插件fastjson
        String json= JSON.toJSONString(map);
        return json;
    }

    //修改部门
    @RequestMapping(value = "updateRole",method = RequestMethod.POST,
            produces = "text/application;charset=UTF-8")
    @ResponseBody
    public String updateRole(String json){
        System.out.println("要修改的数据:"+json);
        Role role=JSON.parseObject(json,Role.class);
        //调用service
        int i=roleService.updateRoleInformation(role);
        return i+"" ;
    }


    @ApiImplicitParam(required = true)
    @ApiOperation(value = "添加角色", notes = "添加角色接口")
    @RequestMapping(value = "addNewRole",method = {RequestMethod.POST},produces = "text/application;charset=UTF-8")
    @ResponseBody
    public String addRole(String json, HttpSession session){
        //将json数据赋到notice实例中
        Role role=JSON.parseObject(json,Role.class);
        System.out.println(role);
        //获取用户
        User user= (User) session.getAttribute("user");
        if(user!=null){
            //调用service层完成添加
            int i=roleService.insertRole(role);
            if(i>0){
                return i+"";
            }else{
                return 0+"";
            }
        }

        return "";
    }

    @ApiImplicitParam(required = true)
    @ApiOperation(value = "删除角色", notes = "删除角色接口")
    @RequestMapping(value = "deleteByRole",method = RequestMethod.POST,produces = "text/application;charset=UTF-8")
    @ResponseBody
    public String deleteById(Integer id){
        System.out.println("要删除的职位ID："+id);
        int i=roleService.deleteRole(id);
        return i+"" ;
    }
}
