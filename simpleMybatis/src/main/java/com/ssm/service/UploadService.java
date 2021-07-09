package com.ssm.service;

import com.ssm.entity.Uploadfile;

import java.util.List;

public interface UploadService {
    int insertFile(Uploadfile uploadFile);

    List<Uploadfile> selectFiles();

    int deleteFileByName(String filename);
}
