package com.ssm.controller;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ssm.entity.Employee;
import com.ssm.entity.User;
import com.ssm.service.EmployeeService;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class EmployeeController {

    @Autowired
    EmployeeService employeeService;


    @ApiImplicitParam(required = true)
    @ApiOperation(value = "查询员工", notes = "查询员工")
    @RequestMapping(value = "selectEmployee",produces = "text/application;charset=UTF-8")
    @ResponseBody
    public String selectEmployee(Integer page,Integer limit){
        PageHelper.startPage(page,limit);
        List<Employee> list   = employeeService.selectEmployeeAll();
        list.forEach(li-> System.out.println(li));
        PageInfo<Employee> pageInfo=new PageInfo<>(list);
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
    @RequestMapping(value = "updateEmployee",method = RequestMethod.POST,
            produces = "text/application;charset=UTF-8")
    @ResponseBody
    public String updateEmployee(String json){
        System.out.println("要修改的数据:"+json);
        Employee employee=JSON.parseObject(json,Employee.class);
        //调用service
        int i=employeeService.updateEmployeeInformation(employee);
        return i+"" ;
    }


    @ApiImplicitParam(required = true)
    @ApiOperation(value = "添加员工", notes = "添加员工")
    @RequestMapping(value = "addNewEmployee",method = {RequestMethod.POST},produces = "text/application;charset=UTF-8")
    @ResponseBody
    public String addEmployee(String json, HttpSession session){
        //将json数据赋到notice实例中
        Employee employee=JSON.parseObject(json,Employee.class);
        System.out.println(employee);
        employee.setCreateDate(new Date());
        //获取用户
        User user= (User) session.getAttribute("user");
        if(user!=null){
            //调用service层完成添加
            int i=employeeService.insertEmployee(employee);
            if(i>0){
                return i+"";
            }else{
                return 0+"";
            }
        }

        return "";
    }

    @ApiImplicitParam(required = true)
    @ApiOperation(value = "删除员工", notes = "删除员工")
    @RequestMapping(value = "deleteByEmployee",method = RequestMethod.POST,produces = "text/application;charset=UTF-8")
    @ResponseBody
    public String deleteById(Integer id){
        System.out.println("要删除的部门ID："+id);
        int i=employeeService.deleteEmployee(id);
        return i+"" ;
    }

}
