package com.ssm.service;

import com.ssm.mapper.UploadfileMapper;
import org.springframework.beans.factory.annotation.Autowired;

public class FileServiceImpl implements FileService {

    @Autowired
    UploadfileMapper uploadfileMapper;

}
