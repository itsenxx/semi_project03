package com.example.demo.service;

import com.example.demo.domain.CargoVO;
import com.example.demo.mapper.CargoMapper;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Log4j
public class CargoServiceImpl implements CargoService {

    @Autowired
    private CargoMapper cargoMapper;
    @Override
    public void insertCargo(CargoVO cargoVO) {
        cargoMapper.insertCargo(cargoVO);

    }

    @Override
    public List<CargoVO> getAllCargo() {
        return cargoMapper.getAllCargo();
    }
}
