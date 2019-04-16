package com.websystique.springmvc.dao;

import java.util.List;

import com.websystique.springmvc.model.Trip;

public interface TripDao {

    Trip findById(int id);
	
	Trip findByTripid(String tripid);
	
	void saveTrip(Trip trip);
	
	void deleteTripByTripid(String tripid);

	List<Trip> findAllTrips(); 
	
	Trip selectMaxOfTripid();
	

}
