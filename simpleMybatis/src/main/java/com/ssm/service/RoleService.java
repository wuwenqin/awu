package com.ssm.service;

import com.ssm.entity.Role;

import java.util.List;

public interface RoleService {
    List<Role> selectRoleAll() ;


    int deleteRole(Integer id);

    int insertRole(Role role);

    int updateRoleInformation(Role role);

}
