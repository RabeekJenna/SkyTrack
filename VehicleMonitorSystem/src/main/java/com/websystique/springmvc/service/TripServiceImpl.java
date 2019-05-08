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
			entity.setTriptime(trip.getTriptime());
			entity.setFollowup(trip.getFollowup());
			entity.setTripfrom(trip.getTripfrom());
			entity.setTripdate(trip.getTripdate());
			entity.setTripto(trip.getTripto());
			entity.setBookings(trip.getBookings());
			entity.setTriptype(trip.getTriptype());
			entity.setCustomername(trip.getCustomername());
			entity.setCustomerphone(trip.getCustomerphone());
			entity.setPickup(trip.getPickup());
			entity.setDrop(trip.getDrop());
			entity.setTripdriver(trip.getTripdriver());
			entity.setTripvehicle(trip.getTripvehicle());
			entity.setDriverphone(trip.getDriverphone());
			entity.setOpenkm(trip.getOpenkm());
			entity.setClosekm(trip.getClosekm());
			entity.setTripamount(trip.getTripamount());
			entity.setLimitkm(trip.getLimitkm());
			entity.setRunningkm(trip.getRunningkm());
			entity.setExtrakm(trip.getExtrakm());
			entity.setNightcharge(trip.getNightcharge());
			entity.setStartingotp(trip.getStartingotp());
			entity.setComments(trip.getComments());
			entity.setCreatedate(trip.getCreatedate());
			entity.setCreateuser(trip.getCreateuser());
			entity.setUpdatedate(trip.getUpdatedate());
			entity.setTemptripid(trip.getTemptripid());
			entity.setStatus(trip.getStatus());
			entity.setVehicletype(trip.getVehicletype());
			entity.setOsamount(trip.getOsamount());
			entity.setExtracharge(trip.getExtracharge());
			entity.setTotalamount(trip.getTotalamount());
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
