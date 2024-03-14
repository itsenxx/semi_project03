package com.example.demo.domain;

import lombok.Data;

import java.time.LocalDate;
import java.util.Date;

@Data
public class CalendarVO {
    private int cl_num;
    private int emp_num;
    private String emp_name;
    private Date insert_date;
    private Date creation_date;
    private String production_st;
    private String cl_subject;
    private String cl_content;
    private String year;
    private String month;
    private String date;
}
