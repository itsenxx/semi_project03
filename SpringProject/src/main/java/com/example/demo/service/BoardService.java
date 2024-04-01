package com.example.demo.service;

import com.example.demo.domain.CalendarVO;
import com.example.demo.domain.DateVO;
import com.example.demo.domain.ProductVO;
import com.example.demo.domain.ProductsVO;
import com.example.demo.domain.PutVO;
import com.example.demo.domain.ScheduleVO;

import java.time.LocalDate;
import java.util.List;

public interface BoardService {
    public List<CalendarVO> cl_story(String dateS);
    public List<PutVO> cl_put();
    public List<ProductsVO> readProduct(String name);
    public void insertSchedule(ScheduleVO scheduleVO);
    public void modifySchedule(ScheduleVO scheduleVO);
    public List<ProductVO> readProd();
}
