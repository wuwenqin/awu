package com.ssm.service;

import com.ssm.entity.Dept;
import com.ssm.entity.Job;

import java.util.List;

public interface JobService {

    List<Job> selectDeptAll() ;


    int deleteJob(Integer id);

    int insertJob(Job job);

    int updateJobInformation(Job job);
}
