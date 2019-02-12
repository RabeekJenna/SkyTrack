package com.websystique.springmvc.dao;

import java.util.List;

import com.websystique.springmvc.model.Driver;

public interface DriverDao {

	Driver findById(int id);

	Driver findByDriverid(String driverid);

	void save(Driver driver);

	void deleteByDriverid(String driverid);

	List<Driver> findAllDrivers();

}
