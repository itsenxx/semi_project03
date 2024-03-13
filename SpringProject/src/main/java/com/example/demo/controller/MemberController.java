package com.example.demo.controller;

import com.example.demo.domain.MemberVO;
import com.example.demo.service.MemberService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


@Controller
@Log4j
@AllArgsConstructor
public class MemberController {

    private MemberService memberService;

    @RequestMapping("/")
    public String memberHome() {
        return "/member/home";
    }

    @GetMapping("/member/signUp")
    public String memberSignUp() {
        return "/member/signUp";
    }

    @PostMapping("/member/signUp")
    public String registerMember(@ModelAttribute MemberVO memberVO) {
        log.info("register: " + memberVO);

        memberService.signUp(memberVO);
        return "redirect:/";
    }

    @PostMapping("/member/login")
    public String memberLogin(@RequestParam("emp_id") String empId,
                              @RequestParam("emp_pw") String empPw,
                              Model model){

        MemberVO member  = memberService.loginMember(empId, empPw);

//        log.info("login info........" + member);
//
//        log.info("login POS........" + member.getEmp_pos());
//        log.info("login Name........" + member.getEmp_name());

        if (member != null && member.getEmp_pw().equals(empPw)){
            String name = member.getEmp_name();
            String pos = member.getEmp_pos();

            model.addAttribute("member", member);
            model.addAttribute("memberP", pos);
            return "redirect:/board/main";
        } else {
            model.addAttribute("error", "error");
            return "redirect:/";
        }
    }
}
