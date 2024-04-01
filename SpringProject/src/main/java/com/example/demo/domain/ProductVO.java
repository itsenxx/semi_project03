package com.example.demo.domain;

import lombok.Data;

@Data
public class ProductVO {
    private String part;
    private String partName;
    private int partPrice;
    
    public ProductVO() {
    	
    }

    public ProductVO(String part, String partName, int partPrice) {
        this.part = part;
        this.partName = partName;
        this.partPrice = partPrice;
    }

    public int getPartPrice() {
        return partPrice;
    }
}
