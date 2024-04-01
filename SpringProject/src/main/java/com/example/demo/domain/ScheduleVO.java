package com.example.demo.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ScheduleVO {
	
	private int sch_num;
	private int emp_num;
	private String emp_name;
	private String creation_date;
	private String cl_subject;
	private String cl_content;
	private String part;
	private String name;
	private int ea;
	private int eaModify;
}
