package com.example.demo.service;

import com.example.demo.domain.MemberVO;
import org.springframework.ui.Model;

public interface MemberService {

    public void signUp(MemberVO memberVO);

    public MemberVO loginMember(String emp_id, String emp_pw);
}
