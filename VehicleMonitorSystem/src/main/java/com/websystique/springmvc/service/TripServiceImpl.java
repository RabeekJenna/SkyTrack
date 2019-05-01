package com.websystique.springmvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.websystique.springmvc.dao.TripDao;
import com.websystique.springmvc.model.Trip;

@Service("tripService")
@Transactional
public class TripServiceImpl implements TripService {

	@Autowired
	private TripDao dao;

	@Override
	public Trip findById(int id) {
		return dao.findById(id);
	}

	@Override
	public Trip findByTripid(String tripid) {
		Trip trip = dao.findByTripid(tripid);
		return trip;

	}

	@Override
	public void saveTrip(Trip trip) {
		dao.saveTrip(trip);

	}

	@Override
	public void updateTrip(Trip trip) {

		Trip entity = dao.findById(trip.getId());
		if (entity != null) {
			entity.setTripid(trip.getTripid());
			/*
			 * entity.setFirstName(user.getFirstName());
			 * entity.setLastName(user.getLastName()); entity.setEmail(user.getEmail());
			 * entity.setUserProfiles(user.getUserProfiles());
			 */
		}

	}
	
	public String findMaxOfTripid() {
	
	Trip entity = dao.selectMaxOfTripid();
	String maxEmployeeId = "";
	if(entity != null)
	maxEmployeeId = entity.getTemptripid() != null ?entity.getTemptripid() :"" ;
	
	String newEmployeeId = "";
	int maxEmp = 0;
	if(maxEmployeeId.length() > 0) {
		
		String maxArr1 = maxEmployeeId;
		if(maxArr1.length() > 0) {
			maxEmp = Integer.parseInt(maxArr1);
			maxEmp +=1;
		}
	} else {
		maxEmp = 100;
	}
	
	if(maxEmp != 0) {
		newEmployeeId = String.valueOf(maxEmp);
	}
	
	return newEmployeeId;
	
	}

	@Override
	public void deleteTripByTripid(String tripid) {
		dao.deleteTripByTripid(tripid);

	}

	@Override
	public List<Trip> findAllTrips() {
		return dao.findAllTrips();
	}

}
