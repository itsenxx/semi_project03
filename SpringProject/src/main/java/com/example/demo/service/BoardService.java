package com.example.demo.service;

import com.example.demo.domain.CalendarVO;
import com.example.demo.domain.DateVO;

import java.time.LocalDate;
import java.util.List;

public interface BoardService {
    public List<CalendarVO> cl_story(DateVO dateVO);
}
