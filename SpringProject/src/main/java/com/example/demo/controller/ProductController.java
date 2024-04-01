package com.example.demo.controller;

import com.example.demo.domain.ProductVO;
import com.example.demo.domain.ProductsVO;
import com.example.demo.service.ProductService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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
@RequestMapping("/product")
public class ProductController {

    @Autowired
    public ProductService productService;

    @GetMapping("/partList")
    public String move() {
        return "/product/partList";
    }

    @GetMapping("/list")
    public String showProducts(Model model) {
        List<ProductVO> productList = productService.getAllProducts(); // ProductService를 통해 상품 목록 가져오기
        model.addAttribute("products", productList);

        return "/product/list";
    }


    @GetMapping("/regist")
    public String registration() {
        return "/product/regist";
    }

    @PostMapping("/checkName")
    @ResponseBody
    public ResponseEntity<String> checkProductName(@RequestParam("productName") String productName) {
        boolean isExists = productService.isProductNameExists(productName);
        if (isExists) {
            return new ResponseEntity<>("true", HttpStatus.OK);
        } else {
            return new ResponseEntity<>("false", HttpStatus.OK);
        }
    }


    //*********아 모르겠다...
    @PostMapping("/submitParts")
    public String submitParts(@RequestParam Map<String, String> formData, RedirectAttributes redirectAttributes) {

        System.out.println("데이터 확인" + formData);

        List<String> parts = formData.entrySet().stream()
                .filter(entry -> entry.getKey().startsWith("part"))
                .map(Map.Entry::getValue)
                .collect(Collectors.toList());

        List<String> partNames = formData.entrySet().stream()
                .filter(entry -> entry.getKey().startsWith("part_name"))
                .map(Map.Entry::getValue)
                .collect(Collectors.toList());

        List<Integer> partPrices = formData.entrySet().stream()
                .filter(entry -> entry.getKey().startsWith("part_price"))
                .map(entry -> {
                    String value = entry.getValue();
                    return value == null || value.isEmpty() ? null : Integer.parseInt(value);
                })
                .collect(Collectors.toList());

        // ProductVO에 저장
        for (int i = 0; i < parts.size(); i++) {
            String part = parts.get(i);
            String partName = i < partNames.size() ? partNames.get(i) : "";
            Integer partPrice = i < partPrices.size() ? partPrices.get(i) : null;

            // part 또는 partName이 비어 있는 경우 처리
            if (part.isEmpty() || partName.isEmpty()) {
                System.out.println("Skipping empty part or partName at index " + i);
                continue;
            }

            // 가격이 비어있는지 확인
            if (partPrice == null) {
                // 가격이 비어있을 경우 에러 메시지, 다시 페이지로 이동 - 자바스크립트로 처리할지 말지
                redirectAttributes.addFlashAttribute("error", "가격을 입력하세요.");
                return "redirect:/product/regist";
            }

            System.out.println("Part" + part);

            ProductVO productVO = new ProductVO(part, partName, partPrice);
            productService.insertProduct(productVO);

            System.out.println("Part: " + part + ", Part Name: " + partName + ", Price: " + partPrice);
        }

        redirectAttributes.addFlashAttribute("success", "제품 등록이 완료되었습니다.");
        return "redirect:/product/regist";
    }

    @GetMapping("/partIn")
    public String partIn(Model model) {
        List<ProductVO> productList = productService.getAllProducts(); // ProductService를 통해 상품 목록 가져오기
        model.addAttribute("products", productList);

        return "/product/partIn";
    }

    @PostMapping("/getPartNames")
    @ResponseBody
    public List<String> getPartNames(@RequestParam("partType") String partType) {
        List<String> partNames = productService.getPartNamesByType(partType);
        return partNames;
    }


    @PostMapping("/instock")
    public String instock(@RequestParam Map<String, String> formData) {
        System.out.println("데이터 확인" + formData);
        return null;
    }

}