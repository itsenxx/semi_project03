package com.example.demo.service;

import com.example.demo.domain.CargoVO;
import com.example.demo.domain.ProductVO;
import com.example.demo.domain.ProductsVO;

import java.util.List;

public interface ProductService {

    public void insertProduct(ProductVO productVO);

    List<ProductVO> getAllProducts();

    boolean isProductNameExists(String productName);

    boolean isProductInStock(String part);

    public List<String> getPartNamesByType(String partType);

}
