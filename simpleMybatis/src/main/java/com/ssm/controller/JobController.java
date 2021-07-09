package com.ssm.controller;


import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ssm.entity.Job;
import com.ssm.entity.User;
import com.ssm.service.JobService;
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
public class JobController {

    @Autowired
    JobService jobService;

    @ApiImplicitParam(required = true)
    @ApiOperation(value = "查询部门", notes = "查询部门接口")
    @RequestMapping(value = "selectJob",produces = "text/application;charset=UTF-8")
    @ResponseBody
    public String selectJob(Integer page,Integer limit){
        PageHelper.startPage(page,limit);
        List<Job> list   = jobService.selectDeptAll();
        list.forEach(li-> System.out.println(li));
        PageInfo<Job> pageInfo=new PageInfo<>(list);
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
    @RequestMapping(value = "updateJob",method = RequestMethod.POST,
            produces = "text/application;charset=UTF-8")
    @ResponseBody
    public String updateJob(String json){
        System.out.println("要修改的数据:"+json);
        Job job=JSON.parseObject(json,Job.class);
        //调用service
        int i=jobService.updateJobInformation(job);
        return i+"" ;
    }


    @ApiImplicitParam(required = true)
    @ApiOperation(value = "添加职位", notes = "添加职位接口")
    @RequestMapping(value = "addNewJob",method = {RequestMethod.POST},produces = "text/application;charset=UTF-8")
    @ResponseBody
    public String addJob(String json, HttpSession session){
        //将json数据赋到notice实例中
        Job job=JSON.parseObject(json,Job.class);
        System.out.println(job);
        //获取用户
        User user= (User) session.getAttribute("user");
        if(user!=null){
            //调用service层完成添加
            int i=jobService.insertJob(job);
            if(i>0){
                return i+"";
            }else{
                return 0+"";
            }
        }

        return "";
    }

    @ApiImplicitParam(required = true)
    @ApiOperation(value = "删除职位", notes = "删除职位接口")
    @RequestMapping(value = "deleteByJob",method = RequestMethod.POST,produces = "text/application;charset=UTF-8")
    @ResponseBody
    public String deleteById(Integer id){
        System.out.println("要删除的职位ID："+id);
        int i=jobService.deleteJob(id);
        return i+"" ;
    }
}
