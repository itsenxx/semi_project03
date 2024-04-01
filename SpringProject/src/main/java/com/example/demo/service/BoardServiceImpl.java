package com.example.demo.service;

import com.example.demo.domain.CalendarVO;
import com.example.demo.domain.DateVO;
import com.example.demo.domain.ProductVO;
import com.example.demo.domain.ProductsVO;
import com.example.demo.domain.PutVO;
import com.example.demo.domain.ScheduleVO;
import com.example.demo.mapper.BoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
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
        Date day;
        String dayOfMonth;
        
        for(int i =0; i< calendarList.size(); i++){
        	day = calendarList.get(i).getCreation_date();
        	dayOfMonth = date.format(day);
        	calendarList.get(i).setCl_date(dayOfMonth);
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

    @Override
    public List<ProductsVO> readProduct(String name) {

        return boardMapper.readProduct(name);
    }

	@Override
	public void insertSchedule(ScheduleVO scheduleVO) {
		System.out.println(scheduleVO.getCreation_date());
		String dateString = scheduleVO.getCreation_date();

        // 입력된 문자열 날짜를 Date 객체로 변환
        SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date date = null;
        try {
            date = inputFormat.parse(dateString);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        // Date 객체를 yyyy-MM-dd 형식의 문자열로 변환
        SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy-MM-dd");
        scheduleVO.setCreation_date(outputFormat.format(date));
        
		boardMapper.insertSchedule(scheduleVO);
		boardMapper.insertSchedulePart(scheduleVO);
		boardMapper.outPutPart(scheduleVO);
	}

	@Override
	public List<ProductVO> readProd() {
		return boardMapper.readProd();
		
	}

	@Override
	public void modifySchedule(ScheduleVO scheduleVO) {
		// TODO Auto-generated method stub
		boardMapper.ScheduleModify(scheduleVO);
		boardMapper.SchedulePartModify(scheduleVO);
		boardMapper.outPutPartModify(scheduleVO);
		
	}
    
    
}
