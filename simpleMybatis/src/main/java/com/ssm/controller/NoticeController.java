package com.ssm.controller;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ssm.entity.Notice;
import com.ssm.entity.User;
import com.ssm.service.NoticeService;
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
public class NoticeController {
    @Autowired
    NoticeService noticeService;

    @ApiImplicitParam(required = true)
    @ApiOperation(value = "显示公告接口", notes = "显示公告接口")
    @RequestMapping(value = "noticeFind", method = {RequestMethod.GET} ,produces = "text/application;charset=UTF-8")
    @ResponseBody
    public String  selectFiveNotice(){
        List<Notice> list   = noticeService.selectNotice();
        Map<String,Object> map=new HashMap<>();
        map.put("code",0);
        map.put("msg","加载中");
        map.put("count",5);
        map.put("data",list);

        //这里用的是阿里爸爸的插件fastjson
        String json= JSON.toJSONString(map);
        return json;
    }

    @ApiImplicitParam(required = true)
    @ApiOperation(value = "查询公告接口", notes = "查询公告接口")
    @RequestMapping(value = "selectNotice", method = {RequestMethod.GET} ,produces = "text/application;charset=UTF-8")
    @ResponseBody
    public String  selectNotice(Integer page,Integer limit) {


        PageHelper.startPage(page,limit);
        List<Notice> list   = noticeService.selectnoticeFind();
        list.forEach(li-> System.out.println(li));
        PageInfo<Notice> pageInfo=new PageInfo<>(list);
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


    @ApiImplicitParam(required = true)
    @ApiOperation(value = "添加新闻公告接口", notes = "添加新闻公告接口")
    @RequestMapping(value = "addNotice", method = {RequestMethod.POST} ,produces = "text/application;charset=UTF-8")
    @ResponseBody
    public String addNotice(String json ,HttpSession session){
        //将json数据赋到notice实例中
            Notice notice=JSON.parseObject(json,Notice.class);

            //获取用户
        User user= (User) session.getAttribute("user");
        if(user!=null){
            notice.setUserid(user.getId());
            //调用service层完成添加
            int i=noticeService.insertNotice(notice);
            if(i>0){
                return i+"";
            }else{
                return 0+"";
            }
        }

        return "";
    }

    @ApiImplicitParam(required = true)
    @ApiOperation(value = "删除 ", notes = "删除 接口")
    @RequestMapping(value = "deleteByNotice",method = RequestMethod.POST,produces = "text/application;charset=UTF-8")
    @ResponseBody
    public String deleteById(Integer id){
        System.out.println("要删除的部门ID："+id);
        int i=noticeService.deleteNotice(id);
        return i+"" ;
    }
}
