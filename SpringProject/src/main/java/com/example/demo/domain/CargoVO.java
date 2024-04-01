package com.example.demo.domain;

import lombok.Data;

import java.util.Date;

@Data
public class CargoVO {

    private String emp_num;
    private String emp_name;
    private String part;
    private String part_name;
    private int part_ea;
    private Date insert_date;
    private String production_st;
    private String cg_subject;
    private String cg_content;

    public CargoVO(String part, String part_name, int part_ea) {
        this.part = part;
        this.part_name = part_name;
        this.part_ea = part_ea;
    }
}
