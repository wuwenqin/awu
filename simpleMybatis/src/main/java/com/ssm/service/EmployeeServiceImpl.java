package com.ssm.service;

import com.ssm.entity.Dept;
import com.ssm.entity.Employee;
import com.ssm.mapper.EmployeeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmployeeServiceImpl implements EmployeeService {

    @Autowired
    EmployeeMapper employeeMapper;


    @Override
    public List<Employee> selectEmployeeAll() {

        List<Employee> list=  employeeMapper.selectAll();
        return list;
    }

    @Override
    public int deleteEmployee(Integer id) {
        return  employeeMapper.deleteByPrimaryKey(id);

    }

    @Override
    public int insertEmployee(Employee employee) {
        int i= employeeMapper.insert(employee);
        if(i>0){
            return i;
        }else return 0;    }


    @Override
    public int updateEmployeeInformation(Employee employee) {
        int i=employeeMapper.updateByPrimaryKeySelective(employee);
        return i;

    }
}
