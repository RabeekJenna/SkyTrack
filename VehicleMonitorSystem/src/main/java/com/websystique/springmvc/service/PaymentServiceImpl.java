package com.websystique.springmvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.websystique.springmvc.dao.PaymentDao;
import com.websystique.springmvc.model.Payment;
import com.websystique.springmvc.model.Trip;

@Service("paymentService")
@Transactional
public class PaymentServiceImpl implements PaymentService {
	
	@Autowired
	private PaymentDao dao;

	@Override
	public List<Payment> findAllPayments() {
		
		return dao.findAllPayments();
	}

	@Override
	public void savePayment(Payment payment) {
		dao.save(payment);
		
	}

	@Override
	public Payment findByPaymentid(String paymentid) {
		return dao.findByPaymentid(paymentid);

	}
	
	

}
