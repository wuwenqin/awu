package com.ssm.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

@Getter
@Setter
@ToString
public class User {
    private Integer id;

    private String password;

    private Integer roleId;

    private String phone;

    private Date createdate;

    private String username;

    private String remark;

//    public Integer getId() {
//        return id;
//    }
//
//    public void setId(Integer id) {
//        this.id = id;
//    }
//
//    public String getPassword() {
//        return password;
//    }
//
//    public void setPassword(String password) {
//        this.password = password == null ? null : password.trim();
//    }
//
//    public Integer getRoleId() {
//        return roleId;
//    }
//
//    public void setRoleId(Integer roleId) {
//        this.roleId = roleId;
//    }
//
//    public String getPhone() {
//        return phone;
//    }
//
//    public void setPhone(String phone) {
//        this.phone = phone == null ? null : phone.trim();
//    }
//
//    public Date getCreatedate() {
//        return createdate;
//    }
//
//    public void setCreatedate(Date createdate) {
//        this.createdate = createdate;
//    }
//
//    public String getUsername() {
//        return username;
//    }
//
//    public void setUsername(String username) {
//        this.username = username == null ? null : username.trim();
//    }
//
//    public String getRemark() {
//        return remark;
//    }
//
//    public void setRemark(String remark) {
//        this.remark = remark == null ? null : remark.trim();
//    }
}