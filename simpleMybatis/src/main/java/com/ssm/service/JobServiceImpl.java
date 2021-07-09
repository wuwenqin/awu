package com.ssm.service;

import com.ssm.entity.Dept;
import com.ssm.entity.Job;
import com.ssm.mapper.DeptMapper;
import com.ssm.mapper.JobMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class JobServiceImpl implements JobService {
    @Autowired
    JobMapper jobMapper;


    @Override
    public List<Job> selectDeptAll() {
        List<Job> list=  jobMapper.selectAll();

        return list;    }

    @Override
    public int deleteJob(Integer id) {
        return  jobMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insertJob(Job job) {
        int i= jobMapper.insert(job);
        if(i>0){
            return i;
        }else return 0;    }

    @Override
    public int updateJobInformation(Job job) {
        int i=jobMapper.updateByPrimaryKeySelective(job);
        return i;    }
}
