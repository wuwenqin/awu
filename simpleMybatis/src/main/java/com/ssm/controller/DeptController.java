package com.ssm.controller;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ssm.entity.Dept;
import com.ssm.entity.Notice;
import com.ssm.entity.User;
import com.ssm.service.DeptService;
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
public class DeptController {

    @Autowired
    DeptService deptService;


    @ApiImplicitParam(required = true)
    @ApiOperation(value = "查询部门", notes = "查询部门接口")
    @RequestMapping(value = "selectDept",produces = "text/application;charset=UTF-8")
    @ResponseBody
    public String selectDept(Integer page,Integer limit){
        PageHelper.startPage(page,limit);
        List<Dept> list   = deptService.selectDeptAll();
        list.forEach(li-> System.out.println(li));
        PageInfo<Dept> pageInfo=new PageInfo<>(list);
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
    @RequestMapping(value = "updateDept",method = RequestMethod.POST,
            produces = "text/application;charset=UTF-8")
    @ResponseBody
    public String updateDept(String json){
        System.out.println("要修改的数据:"+json);
        Dept dept=JSON.parseObject(json,Dept.class);
        //调用service
        int i=deptService.updateDeptInformation(dept);
        return i+"" ;
    }


    @ApiImplicitParam(required = true)
    @ApiOperation(value = "添加部门", notes = "添加部门接口")
    @RequestMapping(value = "addNewDept",method = {RequestMethod.POST},produces = "text/application;charset=UTF-8")
    @ResponseBody
    public String addDept(String json, HttpSession session){
        //将json数据赋到notice实例中
        Dept dept=JSON.parseObject(json,Dept.class);
        System.out.println(dept);
        //获取用户
        User user= (User) session.getAttribute("user");
        if(user!=null){
            //调用service层完成添加
            int i=deptService.insertDept(dept);
            if(i>0){
                return i+"";
            }else{
                return 0+"";
            }
        }

        return "";
    }

    @ApiImplicitParam(required = true)
    @ApiOperation(value = "删除部门", notes = "删除部门接口")
    @RequestMapping(value = "deleteByDept",method = RequestMethod.POST,produces = "text/application;charset=UTF-8")
    @ResponseBody
    public String deleteById(Integer id){
        System.out.println("要删除的部门ID："+id);
        int i=deptService.deleteDept(id);
        return i+"" ;
    }

}
