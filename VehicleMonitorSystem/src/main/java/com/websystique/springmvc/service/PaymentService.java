package com.websystique.springmvc.service;

import java.util.List;

import com.websystique.springmvc.model.Payment;

public interface PaymentService {
	
    List<Payment> findAllPayments(); 
    
    Payment findByPaymentid(String paymentid);
    
    Payment findById(int id);
    
    void savePayment(Payment payment);
    
    void updatePayment(Payment payment);
		
}
