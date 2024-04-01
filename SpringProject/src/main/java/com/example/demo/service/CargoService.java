package com.example.demo.service;

import com.example.demo.domain.CargoVO;
import com.example.demo.domain.ProductsVO;

import java.util.List;

public interface CargoService {

    public void insertCargo(CargoVO cargoVO);

    List<CargoVO> getAllCargo();
}
