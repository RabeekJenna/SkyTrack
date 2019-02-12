package com.websystique.springmvc.service;

import java.util.List;

import com.websystique.springmvc.model.Driver;


public interface DriverService {
	
	Driver findById(int id);
	
	Driver findByDriverid(String driverid);
	
	void saveDriver(Driver Driver);
	
	void updateDriver(Driver Driver);
	
	void deleteDriverByDriverid(String driverid);

	List<Driver> findAllDrivers(); 
	

}