package com.example.demo.mapper;

import com.example.demo.domain.CalendarVO;
import com.example.demo.domain.DateVO;
import com.example.demo.domain.ProductVO;
import com.example.demo.domain.ProductsVO;
import com.example.demo.domain.PutVO;
import com.example.demo.domain.ScheduleVO;

import java.util.List;

public interface BoardMapper {
    public List<CalendarVO> cl_story(String dateS);
    public List<PutVO> cl_put();
    public List<ProductsVO> readProduct(String name);
    public void insertSchedule(ScheduleVO scheduleVO);
    public void insertSchedulePart(ScheduleVO scheduleVO);
    public void outPutPart(ScheduleVO scheduleVO);
    public void outPutPartModify(ScheduleVO scheduleVO);
    public void ScheduleModify(ScheduleVO scheduleVO);
    public void SchedulePartModify(ScheduleVO scheduleVO);
    public List<ProductVO> readProd();
}
