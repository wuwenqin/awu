package com.ssm.service;

import com.ssm.entity.Notice;
import com.ssm.entity.NoticeExample;
import com.ssm.mapper.NoticeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NoticeService {
    @Autowired
    NoticeMapper noticeMapper;


    public List<Notice> selectNotice() {
        return noticeMapper.selectNoticeBetweenOneAndFive();
    }

    public int insertNotice(Notice notice) {
        int i= noticeMapper.insert(notice);
        if(i>0){
            return i;
        }else return 0;
    }

    public List<Notice> selectnoticeFind() {
        List<Notice> list=  noticeMapper.selectNoticeAll();

        return list;

    }

    public int deleteNotice(Integer id) {
      return   noticeMapper.deleteByPrimaryKey(id);

    }
}
