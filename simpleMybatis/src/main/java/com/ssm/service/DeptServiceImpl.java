package com.ssm.service;

import com.ssm.entity.Dept;
import com.ssm.entity.DeptExample;
import com.ssm.entity.Notice;
import com.ssm.mapper.DeptMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DeptServiceImpl implements DeptService{
    @Autowired
    DeptMapper deptMapper;

    @Override
    public List<Dept> selectDeptAll() {
            List<Dept> list=  deptMapper.selectAll();

            return list;

    }

    @Override
    public int deleteDept(Integer id) {

        return  deptMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insertDept(Dept dept) {
        int i= deptMapper.insert(dept);
        if(i>0){
            return i;
        }else return 0;
    }

    @Override
    public int updateDeptInformation(Dept dept) {
        int i=deptMapper.updateByPrimaryKeySelective(dept);
        return i;

    }


}
