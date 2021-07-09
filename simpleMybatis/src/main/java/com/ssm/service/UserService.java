package com.ssm.service;

import com.ssm.entity.Counts;
import com.ssm.entity.User;
import com.ssm.entity.UserExample;
import com.ssm.mapper.CountsMapper;
import com.ssm.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Service
public class UserService {
    @Autowired
    private UserMapper userMapper;

    @Autowired
    private CountsMapper countsMapper;

    public List<User> login(User user) {
            UserExample userExample = new UserExample();
            int id=0;
        try {
             id = Integer.parseInt(user.getPhone());
        } catch (NumberFormatException e2) {
            //当用户输入的是手机号时，数据转型会有异常
        }
        userExample.or().andIdEqualTo(id); //账号
        userExample.or().andPhoneEqualTo(user.getPhone());   //手机号
        List<User> list=userMapper.selectByExample(userExample);
        //判断查询结果不为空
        if(list!=null&&list.size()>0){
            //判断密码是否正确,传入的密码和数据库调出的用户对应密码相匹配
            if(user.getPassword().equals(list.get(0).getPassword())){
                return list ;
            }
        }
        return null;
    }

    public List<User> modifyPassword(String ID,String originPassword,String newPassword){
        UserExample userExample = new UserExample();
        int id=0;
        try {
            id = Integer.parseInt(ID);
        } catch (NumberFormatException e2) {
            //当用户输入的是手机号时，数据转型会有异常
        }
        userExample.or().andIdEqualTo(id); //账号
        List<User> list=userMapper.selectByExample(userExample);
        //判断查询结果不为空
        if(list!=null&&list.size()>0){
            //判断密码是否正确,传入的密码和数据库调出的用户对应密码相匹配
            if(originPassword.equals(list.get(0).getPassword())){
                System.out.println(list.get(0));
            }
        }
        User user=new User();
        user.setPassword(newPassword);
        int i=userMapper.updateByExampleSelective(user,userExample);
        if (i>0){
            System.out.println("修改成功");
            return userMapper.selectByExample(userExample) ;
        }else{
            System.out.println("修改失败，请重试");
        }
        return null;
    }

    /**
     * 根据手机号phone 删除用户 ，这个有个弊端，可能同手机多个账号，需要后期调整
     * @param phone
     * @return
     */
    public String deleteUserInformation(String phone) {

        UserExample userExample= new UserExample();
        UserExample.Criteria criteria=userExample.createCriteria();
        criteria.andPhoneEqualTo(phone);
        int i=userMapper.deleteByExample(userExample);
        if (i>0 ){
            return "删除成功";
        }else{
            return "删除失败";
        }


    }


    //注册功能
    public Boolean regist(User user) {

        //先进行查找用户名或手机号是否存在
        UserExample userExample=new UserExample();
        userExample.or().andUsernameEqualTo(user.getUsername());
        userExample.or().andPhoneEqualTo(user.getPhone());
        List<User> list= userMapper.selectByExample(userExample);
        //判断查询结果不为空
        if(list!=null&&list.size()>0){
            return false;
        }

        int i=userMapper.insert(user);
        if (i>0 ){
            return true;
        }else{
            return false;
        }
    }

    //查询手机号是否重复注册
    public int checkPhone(String phoneString){
        UserExample example=new UserExample();
         UserExample.Criteria criteria=example.createCriteria();
         criteria.andPhoneEqualTo(phoneString);
         List<User> users=userMapper.selectByExample(example);
        if (users != null && users.size() > 0) {
            return 1;
        }
        return 0;
    }


    //查询各个表中数据的数量
    public Counts selectCounts(){

        return countsMapper.selectCounts();
    }


    public List<User> selectUsers() {
        //调用dao查询数据
        UserExample example=new UserExample();

        return  userMapper.selectByExample(example);
    }

    public int updateUser(User user) {

        int i=userMapper.updateByPrimaryKeySelective(user);
        return i;

    }

    public int deleteUserById(Integer id) {

     return    userMapper.deleteByPrimaryKey(id);

    }

    public List<User> selectByWhereUserLike(User user) {
        UserExample userExample = new UserExample();
        UserExample.Criteria criteria=userExample.createCriteria();
        if(user.getId()!=null &&user.getId()!=0  ){
            criteria.andIdEqualTo(user.getId());
        }

        if(!"".equals(user.getUsername()) && user.getUsername()!=null){
            criteria.andUsernameLike("%"+user.getUsername()+"%");
        }

        if (user.getPhone() != null && !"".equals(user.getPhone())) {
            criteria.andPhoneLike("%"+user.getPhone()+"%");

        }

        if (user.getRoleId() != null && user.getRoleId() != 0) {
            criteria.andRoleIdEqualTo(user.getRoleId());
        }



        return userMapper.selectByExample(userExample);
    }
}
