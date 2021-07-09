package com.ssm.mapper;


import com.ssm.entity.Counts;

public interface CountsMapper {

    //查询各表的数量
    Counts selectCounts();
}
