package com.websystique.springmvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.websystique.springmvc.dao.DriverDao;
import com.websystique.springmvc.model.Driver;


@Service("driverService")
@Transactional
public class DriverServiceImpl implements DriverService{

	@Autowired
	private DriverDao dao;

	@Autowired
    private PasswordEncoder passwordEncoder;
	
	public Driver findById(int id) {
		return dao.findById(id);
	}

	public Driver findByDriverid(String driverid) {
		Driver Driver = dao.findByDriverid(driverid);
		return Driver;
	}

	public void saveDriver(Driver Driver) {
			dao.save(Driver);
	}

	/*
	 * Since the method is running with Transaction, No need to call hibernate update explicitly.
	 * Just fetch the entity from db and update it with proper values within transaction.
	 * It will be updated in db once transaction ends. 
	 */
	public void updateDriver(Driver Driver) {
		Driver entity = dao.findById(Driver.getId());
		
	}

	
	public void deleteDriverByDriver(String driverid) {
		dao.deleteByDriverid(driverid);
	}

	public List<Driver> findAllDrivers() {
		return dao.findAllDrivers();
	}

	@Override
	public void deleteDriverByDriverid(String driverid) {
		// TODO Auto-generated method stub
		
	}

	
}
