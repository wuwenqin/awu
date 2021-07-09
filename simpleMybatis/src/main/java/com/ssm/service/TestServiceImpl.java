package com.ssm.service;

import com.ssm.entity.User;
import com.ssm.entity.UserExample;
import com.ssm.mapper.UserMapper;
import com.ssm.utils.MybatisUtils;
import org.apache.ibatis.session.SqlSession;

import java.io.IOException;
import java.util.List;

public class TestServiceImpl implements TestService {


    @Override
    public User login(String number, String password) {
        //调用dao层完成数据查询，逆向工程就是dao层。
        UserMapper mapper = null;
        UserExample example = null;
        int id = 0;
        try {
            SqlSession sqlSession = MybatisUtils.getSession();
            mapper = sqlSession.getMapper(UserMapper.class);
            example = new UserExample();
            id = Integer.parseInt(number);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (NumberFormatException e2) {
            //当用户输入的是手机号时，数据转型会有异常
        }
        example.or().andIdEqualTo(id);
        example.or().andPhoneEqualTo(number);
        List<User> list = mapper.selectByExample(example);

        //判断查询结果不为null
        if (list != null && list.size() > 0) {
            //判断密码是否正确
            if(password.equals(list.get(0).getPassword())){
                System.out.println(list.get(0));
                return list.get(0);
            }
        }
        return null;
    }
}
