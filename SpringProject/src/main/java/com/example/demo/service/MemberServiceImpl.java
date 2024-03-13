package com.example.demo.service;

import com.example.demo.domain.MemberVO;
import com.example.demo.mapper.MemberMapper;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Log4j
@Service
public class MemberServiceImpl implements MemberService {

    @Autowired
    private MemberMapper memberMapper;
    @Autowired
    private MemberVO memberVO;

    @Override
    public void signUp(MemberVO memberVO) {
        memberMapper.insertMember(memberVO);
    }

    @Override
    public MemberVO loginMember(String emp_id, String emp_pw) {
        return memberMapper.loginMember(emp_id, emp_pw);
    }
}
