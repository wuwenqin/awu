//package test;
//
//import org.junit.Test;
//import org.mybatis.generator.api.MyBatisGenerator;
//import org.mybatis.generator.config.Configuration;
//import org.mybatis.generator.config.xml.ConfigurationParser;
//import org.mybatis.generator.internal.DefaultShellCallback;
//
//import java.io.File;
//import java.util.ArrayList;
//import java.util.List;
//
///**
// * 这是生成mybatis逆向工程的文件
// */
//
//public class Test1 {
//    @Test
//    public void generator() throws Exception {
//        List<String> warnings = new ArrayList<String>();
//        boolean overwrite = true;
// File configFile = new File("C:\\Users\\吴文钦\\Desktop\\simpleMybatis\\src\\main\\resources\\generator.xml");
//        ConfigurationParser cp = new ConfigurationParser(warnings);
//        Configuration config = cp.parseConfiguration(configFile);
//        DefaultShellCallback callback = new DefaultShellCallback(overwrite);
//        MyBatisGenerator myBatisGenerator = new MyBatisGenerator(config,
//                callback, warnings);
//        myBatisGenerator.generate(null);
//    }
//
//    public static void main(String[] args) throws Exception {
//        try {
//            Test1 demo = new Test1();
//            demo.generator();
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//    }
//}