package com.example.demo.mapper;

import com.example.demo.domain.ProductVO;
import com.example.demo.domain.ProductsVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ProductMapper {

    public void insertProduct(ProductVO productVO);

    public List<ProductVO> getAllProducts();


    boolean isProductNameExists(String productName);

    boolean isProductInStock(String part);

    List<String> findPartNamesByType(String partType);


}
