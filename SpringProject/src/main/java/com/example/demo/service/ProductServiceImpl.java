package com.example.demo.service;

import com.example.demo.domain.CargoVO;
import com.example.demo.domain.ProductVO;
import com.example.demo.domain.ProductsVO;
import com.example.demo.mapper.ProductMapper;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Log4j
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductMapper productMapper;

    @Override
    public void insertProduct(ProductVO productVO) {
        productMapper.insertProduct(productVO);
    }

    @Autowired
    public ProductServiceImpl(ProductMapper productMapper) {
        this.productMapper = productMapper;
    }

    @Override
    public List<ProductVO> getAllProducts() {
        return productMapper.getAllProducts();
    }

    @Override
    public boolean isProductNameExists(String productName) {
        return productMapper.isProductNameExists(productName);
    }

    @Override
    public boolean isProductInStock(String part) {
        return productMapper.isProductInStock(part);
    }

    @Override
    public List<String> getPartNamesByType(String partType) {
        return productMapper.findPartNamesByType(partType);
    }


}
