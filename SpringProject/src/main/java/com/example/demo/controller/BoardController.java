package com.example.demo.controller;

import com.example.demo.domain.CalendarVO;
import com.example.demo.domain.DateVO;
import com.example.demo.domain.PutVO;
import com.example.demo.service.BoardService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

@Controller
@RequestMapping("/board")
@AllArgsConstructor
public class BoardController {

    private BoardService boardService;

    @GetMapping("/main")
    public void main() {
        System.out.println("main");
    }

    @GetMapping("/calendar")
    public void calendar(Model model){
        DateVO dateVO = new DateVO();
        int year;
        int month;
        LocalDate now = LocalDate.now();

        year = now.getYear();
        month = now.getMonthValue();

        int date = 1;       // 일
        int day;            // 요일

        LocalDate firstDate = LocalDate.of(year, month, date); // 해당월 1일 설정
        day = firstDate.getDayOfWeek().getValue();
        int lastdate = firstDate.lengthOfMonth();
        dateVO.setDay(day);
        dateVO.setYear(year);
        dateVO.setMonth(month);
        dateVO.setLastdate(lastdate);
        String dateS = String.valueOf(year)+"-"+String.valueOf(month);
        List<CalendarVO> calendarVO = boardService.cl_story(dateS);
        List<PutVO> putVO = boardService.cl_put();
        model.addAttribute("date", dateVO);
        model.addAttribute("calendarList",calendarVO);
        model.addAttribute("putList",putVO);

    }

    @GetMapping("/calendarInsert")
    public void calendarInsert(){
        //회원정보 전달
    }
    @GetMapping(value = "calendar/year/{year}/month/{month}", produces = {MediaType.APPLICATION_JSON_VALUE})
    public void calendar2(){

    }
}
