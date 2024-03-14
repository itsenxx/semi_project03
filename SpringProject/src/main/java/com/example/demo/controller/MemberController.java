package com.example.demo.controller;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@Log4j
@AllArgsConstructor
public class MemberController {

    @RequestMapping("/")
    public String memberHome() {
        return "/member/sign";
    }

    @GetMapping("/signUp")
    public void memberSignUp() {

    }

}
