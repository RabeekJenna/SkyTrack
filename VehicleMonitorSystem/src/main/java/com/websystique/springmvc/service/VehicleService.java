package com.websystique.springmvc.service;

import java.util.List;

import com.websystique.springmvc.model.Vehicle;

public interface VehicleService {

    List<Vehicle> findAllVehicles();
    
    Vehicle findByVehicleID(int id); 
    
    void updateVehicle (Vehicle vehicles);
    
    void saveDriver (Vehicle vehicle);

}
