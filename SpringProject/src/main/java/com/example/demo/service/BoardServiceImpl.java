package com.example.demo.service;

import com.example.demo.domain.CalendarVO;
import com.example.demo.domain.DateVO;
import com.example.demo.domain.PutVO;
import com.example.demo.mapper.BoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.List;

@Service
public class BoardServiceImpl implements BoardService{

    @Autowired
    private BoardMapper boardMapper;

    @Override
    public List<CalendarVO> cl_story(String dateS) {
        List<CalendarVO> calendarList = boardMapper.cl_story(dateS);
        SimpleDateFormat year = new SimpleDateFormat("yyyy");
        SimpleDateFormat month = new SimpleDateFormat("MM");
        SimpleDateFormat date = new SimpleDateFormat("dd");
        for(int i =0; i< calendarList.size(); i++){
            calendarList.get(i).setYear(year.format(calendarList.get(i).getInsert_date()));
            calendarList.get(i).setMonth(month.format(calendarList.get(i).getInsert_date()));
            calendarList.get(i).setDate(date.format(calendarList.get(i).getInsert_date()));
        }
        return calendarList;
    }

    @Override
    public List<PutVO> cl_put() {

        return boardMapper.cl_put();
    }
}
