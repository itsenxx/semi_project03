package com.example.demo.controller;

import com.example.demo.domain.CargoVO;
import com.example.demo.domain.ProductsVO;
import com.example.demo.service.CargoService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/cargo")
public class CargoController {

    @Autowired
    public CargoService cargoService;

    @GetMapping("/cgList")
    public String showProducts(Model model) {
        List<CargoVO> cargoList = cargoService.getAllCargo(); // ProductService를 통해 상품 목록 가져오기
        model.addAttribute("cargos", cargoList);

        return "/cargo/cgList";
    }



    @PostMapping("/insert")
    public String insertCargo(@RequestParam Map<String, String> formData, RedirectAttributes redirectAttributes)  {
        System.out.println("데이터 확인" + formData);

        List<String> parts = formData.entrySet().stream()
                .filter(entry -> entry.getKey().startsWith("part"))
                .map(Map.Entry::getValue)
                .collect(Collectors.toList());

        List<String> partNames = formData.entrySet().stream()
                .filter(entry -> entry.getKey().startsWith("part_name"))
                .map(Map.Entry::getValue)
                .collect(Collectors.toList());

        List<Integer> partBoxs = formData.entrySet().stream()
                .filter(entry -> entry.getKey().startsWith("part_box"))
                .map(entry -> {
                    String value = entry.getValue();
                    return value == null || value.isEmpty() ? null : Integer.parseInt(value);
                })
                .collect(Collectors.toList());

        // ProductVO에 저장
        for (int i = 0; i < parts.size(); i++) {
            String part = parts.get(i);
            String part_name = i < partNames.size() ? partNames.get(i) : "";
            Integer part_ea = i < partBoxs.size() ? partBoxs.get(i) : null;

            // part 또는 partName이 비어 있는 경우 처리
            if (part.isEmpty() || part_name.isEmpty()) {
                System.out.println("Skipping empty part or partName at index " + i);
                continue;
            }

            // 가격이 비어있는지 확인
            if (part_ea == null) {
                // 가격이 비어있을 경우 에러 메시지, 다시 페이지로 이동 - 자바스크립트로 처리할지 말지
                redirectAttributes.addFlashAttribute("error", "수량 입력하세요.");
                return "redirect:/product/partIn";
            }

           CargoVO cargoVO = new CargoVO(part, part_name, part_ea);
           cargoService.insertCargo(cargoVO);

            System.out.println("Part: " + part + ", Part Name: " + part_name + ", Part Box: " + part_ea);
        }

        redirectAttributes.addFlashAttribute("success", "입고 처리 완료");
        return "redirect:/product/partIn";
    }


}
