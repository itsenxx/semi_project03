package com.example.demo.mapper;

import com.example.demo.domain.CargoVO;
import com.example.demo.domain.ProductsVO;

import java.util.List;

public interface
CargoMapper {

    public void insertCargo(CargoVO cargoVO);

    public List<CargoVO> getAllCargo();
}
