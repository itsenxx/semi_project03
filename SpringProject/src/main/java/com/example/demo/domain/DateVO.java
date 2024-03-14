package com.example.demo.domain;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDate;

@Data
public class DateVO {
    private LocalDate nowdate;
    private int day;
    private int year;
    private int month;
    private int fastdate = 1;
    private int lastdate;
}
