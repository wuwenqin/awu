package com.ssm.entity;

public class Counts {
    private int userCount;
    private int deptCount;
    private int employeeCount;
    private int jobCount;
    private int uploadCount;
    private int roleCount;
    private int noticeCount;

    @Override
    public String toString() {
        return "Counts{" +
                "userCount=" + userCount +
                ", deptCount=" + deptCount +
                ", employeeCount=" + employeeCount +
                ", jobCount=" + jobCount +
                ", uploadCount=" + uploadCount +
                ", roleCount=" + roleCount +
                ", noticeCount=" + noticeCount +
                '}';
    }

    public int getUserCount() {
        return userCount;
    }

    public void setUserCount(int userCount) {
        this.userCount = userCount;
    }

    public int getDeptCount() {
        return deptCount;
    }

    public void setDeptCount(int deptCount) {
        this.deptCount = deptCount;
    }

    public int getEmployeeCount() {
        return employeeCount;
    }

    public void setEmployeeCount(int employeeCount) {
        this.employeeCount = employeeCount;
    }

    public int getJobCount() {
        return jobCount;
    }

    public void setJobCount(int jobCount) {
        this.jobCount = jobCount;
    }

    public int getUploadCount() {
        return uploadCount;
    }

    public void setUploadCount(int uploadCount) {
        this.uploadCount = uploadCount;
    }

    public int getRoleCount() {
        return roleCount;
    }

    public void setRoleCount(int roleCount) {
        this.roleCount = roleCount;
    }

    public int getNoticeCount() {
        return noticeCount;
    }

    public void setNoticeCount(int noticeCount) {
        this.noticeCount = noticeCount;
    }
}
