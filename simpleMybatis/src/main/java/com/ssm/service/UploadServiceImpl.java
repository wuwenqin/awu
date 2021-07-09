package com.ssm.service;

import com.ssm.entity.Uploadfile;
import com.ssm.entity.UploadfileExample;
import com.ssm.mapper.UploadfileMapper;
import com.ssm.utils.GetFilesUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UploadServiceImpl implements UploadService{
    @Autowired
    private UploadfileMapper uploadfileMapper;
    @Override
    public int insertFile(Uploadfile uploadFile) {
        return uploadfileMapper.insertSelective(uploadFile);
    }

    @Override
    public List<Uploadfile> selectFiles() {
        List<Uploadfile> file=GetFilesUtil.getFile("D://upload");

        return file;
    }

    @Override
    public int deleteFileByName(String filename) {
        UploadfileExample example=new UploadfileExample();
        example.or().andFilenameEqualTo(filename);
      return   uploadfileMapper.deleteByExample(example);


    }
}
