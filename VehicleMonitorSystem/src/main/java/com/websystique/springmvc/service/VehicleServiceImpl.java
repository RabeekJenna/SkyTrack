package com.websystique.springmvc.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.websystique.springmvc.dao.VehicleDao;
import com.websystique.springmvc.model.Vehicle;

@Service("vehicleService")
@Transactional
public class VehicleServiceImpl implements VehicleService {

@Autowired
private VehicleDao vehicleDAO;

@Override
public List<Vehicle> findAllVehicles() {
	return vehicleDAO.findAllVehicles();
}

@Override
public Vehicle findByVehicleID(int id) {
	// TODO Auto-generated method stub
	return vehicleDAO.findVehicleById(id);
}

@Override
public void updateVehicle(Vehicle vehicle) {
	// TODO Auto-generated method stub
	Vehicle vehicleIDValue = vehicleDAO.findVehicleById(vehicle.getId());
	if(vehicleIDValue!=null) {
		vehicleIDValue.setModel(vehicle.getModel());
		vehicleIDValue.setRegNo(vehicle.getRegNo());
		vehicleIDValue.setEngChaseNo(vehicle.getEngChaseNo());
		vehicleIDValue.setImeiNO(vehicle.getImeiNO());
		
	}
	
}

@Override
public void saveDriver(Vehicle vehicle) {
	// TODO Auto-generated method stub
	vehicleDAO.saveDriver (vehicle);
	
}

	
	

}
