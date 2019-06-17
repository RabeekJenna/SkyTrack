package com.websystique.springmvc.service;

import java.util.List;

import com.websystique.springmvc.model.Trip;


public interface TripService {
	
	Trip findById(int id);
	
	Trip findByTripid(String tripid);
	
	String findTripAmount(String tripid);
	
	void saveTrip(Trip trip);
	
	void updateTrip(Trip trip);
	
	void deleteTripByTripid(String tripid);

	List<Trip> findAllTrips(); 
	
	String findMaxOfTripid();
	

}