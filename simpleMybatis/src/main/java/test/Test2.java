package test;

import com.ssm.entity.User;
import com.ssm.entity.UserExample;
import com.ssm.mapper.UserMapper;
import com.ssm.service.TestService;
import com.ssm.service.TestServiceImpl;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.List;
import java.util.Scanner;

/**
 * 使用逆向工程与数据库进行交互
 */
public class Test2 {
    public static void main(String[] args) throws IOException {
        SqlSession sqlSession = getSession();
        UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
        UserExample userExample = new UserExample();
//        User user=new User();
//        user.setId(100007);
////        user=userMapper.selectByPrimaryKey(user.getId());   //先提取原有数据，再将需要改的数据set进去即可。
//        user.setPassword("66666");
//        UserExample.Criteria criteria=userExample.createCriteria();
//        criteria.andIdEqualTo(user.getId());
//
//        int i=userMapper.updateByExampleSelective(user,userExample);
//        if (i>0){
//            System.out.println("修改成功");
//        }else{
//            System.out.println("修改失败，请重试");
//
//        }
    login();



        /**
         //主键查询
         selectByKeyId(userMapper);
         */

        //        多条件查询
//        selectByMultiple(userMapper);

        /** 添加数据
         * addUser(userMapper);
         */
        /** 查询条数
         * UserExample example =new UserExample();
         * int count=userMapper.countByExample(example);
         * System.out.println(count);
         */
//      特定查询  selectUserByRemark(userMapper);

//      查询用户所有信息  selectAllInformation(userMapper);

    }

    private static void login() {
        System.out.println("请输入账号/手机号和密码");
        Scanner sc=new Scanner(System.in);
        //接收用户名和密码
        String number=sc.next();
        String password=sc.next();
        //调用service层完成登录逻辑
        TestService testService=new TestServiceImpl();
        User user=testService.login(number,password);
        if(user!=null){
            System.out.println("恭喜登录成功");
        }else{
            System.out.println("登陆失败,重启操作!");
            login();
        }
    }

    public static void selectByKeyId(UserMapper userMapper) {
        /**
         * 主键查询
         */
        User user = userMapper.selectByPrimaryKey(100005);
        System.out.println(user);
    }

    public static void selectByMultiple(UserMapper userMapper) {
        UserExample userExample = new UserExample();
        /**
         * 添加条件查询
         * 可多条件查询
         */
        UserExample.Criteria criteria = userExample.createCriteria();
        String value = "123";
        criteria.andPasswordLike("%" + value + "%");
//        criteria.andIdEqualTo(100004);
        List<User> list = userMapper.selectByExample(userExample);
        list.forEach(li -> System.out.println(li));
    }

    public static void selectAllInformation(UserMapper userMapper) {
        UserExample userExample = new UserExample();
        userExample.setOrderByClause("id");
        List<User> list = userMapper.selectByExample(userExample);
        list.forEach(li -> System.out.println(li));
    }

    public static void selectUserByRemark(UserMapper userMapper) {
        //特定查询
        UserExample example = new UserExample();
        UserExample.Criteria criteria = example.createCriteria();
        criteria.andRemarkEqualTo("总裁");
        int count = userMapper.countByExample(example);
        System.out.println(count);

    }

    //添加用户数据
    public static void addUser(UserMapper userMapper) {
        User user = new User();
        user.setCreatedate(new Date());
        user.setPassword("123456");
        user.setUsername("王老五");
        user.setPhone("123456789");
        user.setRoleId(2);

        int i = userMapper.insert(user);

        if (i > 0) {
            System.out.println("添加成功");
        } else {
            System.out.println("添加失败");
        }
    }


    //封装Session方法
    public static SqlSession getSession() throws IOException {
        String resource = "simple-mybatis-config.xml";
        InputStream inputStream = Resources.getResourceAsStream(resource);
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
        SqlSession sqlSession = sqlSessionFactory.openSession(true);
        return sqlSession;
    }


}
