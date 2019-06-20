package com.websystique.springmvc.dao;

import java.util.List;

import com.websystique.springmvc.model.Payment;

public interface PaymentDao {
	
	List<Payment> findAllPayments(); 
	
	void save(Payment payment);
	
	Payment findByPaymentid(String paymentid);

}
