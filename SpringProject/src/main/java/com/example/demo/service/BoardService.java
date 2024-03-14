package com.example.demo.service;

import com.example.demo.domain.CalendarVO;
import com.example.demo.domain.DateVO;
import com.example.demo.domain.PutVO;

import java.time.LocalDate;
import java.util.List;

public interface BoardService {
    public List<CalendarVO> cl_story(String dateS);
    public List<PutVO> cl_put();
}
