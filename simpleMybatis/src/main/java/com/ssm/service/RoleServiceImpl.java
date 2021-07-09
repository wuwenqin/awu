package com.ssm.service;

import com.ssm.entity.Job;
import com.ssm.entity.Role;
import com.ssm.mapper.RoleMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoleServiceImpl implements RoleService {
    @Autowired
    RoleMapper roleMapper;

    @Override
    public List<Role> selectRoleAll() {
        List<Role> list=  roleMapper.selectAll();

        return list;       }

    @Override
    public int deleteRole(Integer id) {
        return  roleMapper.deleteByPrimaryKey(id);    }

    @Override
    public int insertRole(Role role) {
        int i= roleMapper.insert(role);
        if(i>0){
            return i;
        }else return 0;
    }

    @Override
    public int updateRoleInformation(Role role) {
        int i=roleMapper.updateByPrimaryKeySelective(role);
        return i;      }
}
