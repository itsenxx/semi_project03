package com.example.demo.controller;

import com.example.demo.domain.CalendarVO;
import com.example.demo.domain.DateVO;
import com.example.demo.domain.ProductVO;
import com.example.demo.domain.ProductsVO;
import com.example.demo.domain.PutVO;
import com.example.demo.domain.ScheduleVO;
import com.example.demo.service.BoardService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.lang.ProcessBuilder.Redirect;
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
    public void main(Model model) {
        System.out.println("main");
        LocalDate now = LocalDate.now();
        Integer year = now.getYear();
        Integer month = now.getMonthValue();
        
        DateVO dateVO = new DateVO();

        int date = 1;       // 일
        int day;            // 요일
        LocalDate firstDate = LocalDate.of(year, month, date); // 해당월 1일 설정
        day = firstDate.getDayOfWeek().getValue();
        int lastdate = firstDate.lengthOfMonth();
        dateVO.setDay(day);
        dateVO.setYear(year);
        dateVO.setMonth(month);
        dateVO.setLastdate(lastdate);
        String dateS = String.valueOf(year) + "-" + String.valueOf(month);
        List<ProductVO> productVO = boardService.readProd();
        List<CalendarVO> calendarVO = boardService.cl_story(dateS);
        List<PutVO> putVO = boardService.cl_put();
        model.addAttribute("productList", productVO);
        model.addAttribute("date", dateVO);
        model.addAttribute("calendarList", calendarVO);
        model.addAttribute("putList", putVO);
    }

    @GetMapping("/calendar")
    public void calendar(Model model,
            @RequestParam(value = "year", required = false) Integer year,
            @RequestParam(value = "month", required = false) Integer month) {
        DateVO dateVO = new DateVO();

        // year와 month 파라미터가 없을 경우 현재 시스템 날짜를 사용
        if (year == null || month == null) {
            LocalDate now = LocalDate.now();
            year = now.getYear();
            month = now.getMonthValue();
        }

        int date = 1;       // 일
        int day;            // 요일
        LocalDate firstDate = LocalDate.of(year, month, date); // 해당월 1일 설정
        day = firstDate.getDayOfWeek().getValue();
        int lastdate = firstDate.lengthOfMonth();
        dateVO.setDay(day);
        dateVO.setYear(year);
        dateVO.setMonth(month);
        dateVO.setLastdate(lastdate);
        String dateS = String.valueOf(year) + "-" + String.valueOf(month);
        List<CalendarVO> calendarVO = boardService.cl_story(dateS);
        List<PutVO> putVO = boardService.cl_put();
        model.addAttribute("date", dateVO);
        model.addAttribute("calendarList", calendarVO);
        model.addAttribute("putList", putVO);
    }

    @PostMapping("/newSchedule")
    public String newSchedule(@RequestBody ScheduleVO scheduleVO) {
    	boardService.insertSchedule(scheduleVO);
    	return "redirect:calendar";
    }
    
    @PostMapping("/scheduleModify")
    public String scheduleModify(@RequestBody ScheduleVO scheduleVO) {
    	boardService.modifySchedule(scheduleVO);
    	return "redirect:calendar";
    }

    @GetMapping(value = "read/product/{product}")
    public ResponseEntity<List<ProductsVO>> readProduct(
            @PathVariable("product") String name
    ){
        return new ResponseEntity<>( boardService.readProduct(name), HttpStatus.OK);
    }
}
