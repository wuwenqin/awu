package com.ssm.controller;

import cn.hutool.core.io.FileUtil;
import com.alibaba.fastjson.JSON;
import com.ssm.entity.Uploadfile;
import com.ssm.entity.User;
import com.ssm.service.UploadService;
import com.ssm.utils.GetFilesUtil;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import io.swagger.models.Model;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
public class UploadController {
    @Autowired
    private UploadService uploadService;




    @ApiImplicitParam(required = true)
    @ApiOperation(value = "删除文件", notes = "删除文件接口")
    @RequestMapping(value = "deleteByFileName",method = RequestMethod.POST,produces = "text/application;charset=UTF-8")
    @ResponseBody
    public String deleteByFileName(String  filename){
        System.out.println("要删除的文件名："+filename);

        String path="D:\\upload";
        String newFileName=path+"\\"+filename;
        File file =  new  File( newFileName );

        if(file.exists()){
            file.delete();
            int i=uploadService.deleteFileByName(filename);
            return i+"" ;
        }else {
            return 0+"";
        }

    }



    @ApiImplicitParam(required = true)
    @ApiOperation(value = "上传文件接口", notes = "上传文件接口")
    @RequestMapping(value = "uploadFileLoad",method = RequestMethod.POST,produces = "text/application;charset=UTF-8")
    @ResponseBody
    public String uploadFile(MultipartFile file, HttpSession session) {
        System.out.println(file);
        String fileName=file.getOriginalFilename();
        System.out.println(fileName);
        Map<String,Object> map=new HashMap<>();
        //路径
        String path="D:\\upload";
        File file1=new File(path);
        if(!file1.exists()){
            file1.mkdirs();
        }
        User user=(User) session.getAttribute("user");
        String newFileName=System.currentTimeMillis()+"-"+user.getId()+"-"+fileName;

        if(file!=null&&!file.isEmpty()){
            try {
                file.transferTo(new File(path+"\\"+newFileName));

                if(user!=null){
                    Uploadfile uploadFile=new Uploadfile();

                    uploadFile.setFilename(newFileName);
                    uploadFile.setUserid(user.getId());
                    uploadFile.setUploaddate(new Date());
                    int i= uploadService.insertFile(uploadFile);
                    if(i>0){
                        map.put("code",200);

                    }else {
                        map.put("code",500);
                    }
                }
            }catch (IOException e){
                System.out.println("上传失败");
                map.put("code",500);
                e.printStackTrace();
            }
        }


        map.put("msg","");
        map.put("data",newFileName);
        String json= JSON.toJSONString(map);
        return json;
    }


    @RequestMapping(value = "selectDownload",produces = "text/application;charset=UTF-8")
    @ResponseBody
    public  String selectDownload(){
        Map<String,Object> map=new HashMap< >();
        List<Uploadfile> list= uploadService.selectFiles();
        list.forEach(li->System.out.println(li));

        map.put("code",0);
        map.put("msg","");
        map.put("data",list);
        map.put("count",list.size());
        String json=JSON.toJSONString(map);
        GetFilesUtil.uploadfiles.clear();
        return json;
    }

    @RequestMapping(value = "download",produces = "text/application;charset=UTF-8")
    @ResponseBody
    public ResponseEntity<byte[]> download(HttpServletRequest request,String filename){
        File file=new File("D://upload/"+filename);
        System.out.println(file);

        try{

            filename=this.getFileName(request,filename  );

        } catch (Exception e) {
            e.printStackTrace();
        }
        HttpHeaders headers=new HttpHeaders();
        headers.setContentDispositionFormData("attachment",filename);
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        try{
            return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file), headers,HttpStatus.OK);

        }catch (IOException e2){
            e2.printStackTrace();
        }
        return null;
    }

    //封装一个解决下载文件显示中文乱码的问题
    private String getFileName(HttpServletRequest request, String filename) throws UnsupportedEncodingException {
        System.out.println("filedname:"+filename);
        String[] IEBrowserKeyWord={"MSIE","Trident","Edge"};
        String userAgent=request.getHeader("User-Agent");
        for(String keyWord:IEBrowserKeyWord){
            if(userAgent.contains(keyWord)){
                return URLEncoder.encode(filename,"UTF-8");

            }
        }
    return new String (filename.getBytes("UTF-8"),"ISO-8859-1");
    }
}
