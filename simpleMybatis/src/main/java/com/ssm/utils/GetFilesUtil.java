package com.ssm.utils;

import com.ssm.entity.Uploadfile;
import javafx.beans.binding.NumberExpression;

import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class GetFilesUtil {
    public   static List<Uploadfile> uploadfiles=new ArrayList<>();
    public  static  List<Uploadfile> getFile(String path){

        File file=new File(path);
        File[] array=file.listFiles();
        for(int i=0;i<array.length;i++){
            if(array[i].isFile()){
                Uploadfile uploadfile=new Uploadfile();
                String[] split=array[i].getName().split("-");
                try{
                    Long time = Long.parseLong(split[0]);
                    SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                    String d=format.format(time);
                    Date createdate=format.parse(d);
                    uploadfile.setUploaddate(createdate);
                    uploadfile.setUserid(Integer.parseInt(split[1]));
                    uploadfile.setFilename(array[i].getName());
                    uploadfiles.add(uploadfile);

                }catch (ParseException e){
                    e.printStackTrace();
                }catch (NumberFormatException e){
                }
            }else if(array[i].isDirectory()){
                getFile(array[i].getPath());
            }
        }
        return uploadfiles;
    }
}
