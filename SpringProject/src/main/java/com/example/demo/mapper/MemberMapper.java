package com.example.demo.mapper;

import com.example.demo.domain.MemberVO;

public interface MemberMapper {

    public void insertMember(MemberVO memberVO);

    public MemberVO loginMember(String emp_id, String emp_pw);
}
