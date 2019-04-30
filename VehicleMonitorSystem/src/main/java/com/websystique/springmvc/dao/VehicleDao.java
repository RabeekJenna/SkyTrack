package com.websystique.springmvc.dao;

import java.util.List;

import com.websystique.springmvc.model.Vehicle;

public interface VehicleDao {

 List<Vehicle> findAllVehicles();
 
 Vehicle findVehicleById(int id);
 
 void saveDriver (Vehicle vehicle);
}
