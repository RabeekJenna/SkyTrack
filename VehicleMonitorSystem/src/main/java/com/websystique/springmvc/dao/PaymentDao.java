package com.websystique.springmvc.dao;

import java.util.List;


import com.websystique.springmvc.model.Payment;

public interface PaymentDao {
	
	List<Payment> findAllPayments();
	
	Payment findById(int id);
	
	void save(Payment payment);
	
	void update(Payment payment);
	
	Payment findByPaymentid(String paymentid);
	
	Payment findByTripid(String tripid, String triptableid);
	
	int updateTrips(int tripid);

	

}
