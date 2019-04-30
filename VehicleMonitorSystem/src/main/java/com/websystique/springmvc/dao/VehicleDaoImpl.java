package com.websystique.springmvc.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.websystique.springmvc.model.Driver;
import com.websystique.springmvc.model.Vehicle;

@Repository("vehicleDao")
public class VehicleDaoImpl extends AbstractDao<Integer, Vehicle>  implements VehicleDao {

	static final Logger logger = LoggerFactory.getLogger(VehicleDaoImpl.class);
	@SuppressWarnings("unchecked")
	
	public List<Vehicle> findAllVehicles() {
		
		Criteria criteria = createEntityCriteria().addOrder(Order.asc("model"));
		criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
		List<Vehicle> vehicle = (List<Vehicle>) criteria.list();
		return vehicle;
	}
	
	@Override
	public Vehicle findVehicleById(int id) {
	
		Vehicle vehicle = getByKey(id);
		return vehicle;
	}

	@Override
	public void saveDriver(Vehicle vehicle) {
		persist(vehicle);
		
	}
	
	

}
