package com.example.demo.mapper;

import com.example.demo.domain.CalendarVO;
import com.example.demo.domain.DateVO;
import com.example.demo.domain.PutVO;

import java.util.List;

public interface BoardMapper {
    public List<CalendarVO> cl_story(String dateS);
    public List<PutVO> cl_put();
}
