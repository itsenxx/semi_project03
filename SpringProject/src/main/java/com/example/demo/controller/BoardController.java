package com.example.demo.controller;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@Log4j
@RequestMapping("/board")
@AllArgsConstructor
public class BoardController {
    @GetMapping("/main")
    public void main() {
//        log.info("main");
    }
}
