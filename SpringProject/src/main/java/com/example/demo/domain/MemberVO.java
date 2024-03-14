package com.example.demo.domain;

import lombok.Data;
import org.springframework.stereotype.Component;

@Data
@Component
public class MemberVO {

    private Long emp_num;
    private String emp_name;
    private String emp_id;
    private String emp_pw;
    private String emp_pos;

}
