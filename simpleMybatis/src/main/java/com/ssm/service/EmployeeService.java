package com.ssm.service;


import com.ssm.entity.Employee;

import java.util.List;

public interface EmployeeService {

    List<Employee> selectEmployeeAll() ;


    int deleteEmployee(Integer id);

    int insertEmployee(Employee employee);

    int updateEmployeeInformation(Employee employee);

}
