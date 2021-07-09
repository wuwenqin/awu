package com.ssm.swagger;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

/**
 * Swagger2文档构建配置类
 * 通过@EnableSwagger2注解来启用Swagger2
 * @author
 */
@EnableWebMvc
@EnableSwagger2
@ComponentScan(basePackages = "com.ssm.controller")
public class Swagger2Config {

    //接口文档构建配置
    @Bean
    public Docket api() {
        return new Docket(DocumentationType.SWAGGER_2)
                //通过select()函数返回一个ApiSelectorBuilder实例,用来控制哪些接口暴露给Swagger来展现
                .select()
                //所有的接口
                //.apis(RequestHandlerSelectors.any())
                //指定扫描的路径
                .apis(RequestHandlerSelectors.basePackage("com.ssm.controller"))
                .build()
                .apiInfo(apiInfo());
    }

    //接口文档信息
    private ApiInfo apiInfo() {
        return new ApiInfoBuilder()
                .title("API接口  列表")
                .description("学习Java是没有前途的")
                .termsOfServiceUrl("http://baidu.com")
                .version("1.0")
                .build();
    }
}