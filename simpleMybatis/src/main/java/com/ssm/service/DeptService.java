package com.ssm.service;

import com.ssm.entity.Dept;

import java.util.List;

public interface DeptService {
      List<Dept> selectDeptAll() ;


    int deleteDept(Integer id);

    int insertDept(Dept dept);

    int updateDeptInformation(Dept dept);
}
