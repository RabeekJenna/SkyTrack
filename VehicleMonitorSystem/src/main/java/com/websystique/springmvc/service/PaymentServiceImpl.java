package com.websystique.springmvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.websystique.springmvc.dao.PaymentDao;
import com.websystique.springmvc.model.Payment;

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
	
	@Override
	public Payment findByTripid(String tripid, String triptableid) {
		return dao.findByTripid(tripid,triptableid);

	}

	@Override
	public void updatePayment(Payment payment) {
		
			Payment entity = dao.findById(payment.getPaymentsid());
			if(entity!=null){
				entity.setAdvanceAmount(payment.getAdvanceAmount());
				entity.setPaymentDate(payment.getPaymentDate());
				entity.setTripid1(payment.getTripid1());
				entity.setTripid2(payment.getTripid2());
				entity.setTripid3(payment.getTripid3());
				entity.setTripid4(payment.getTripid4());
				entity.setTripid5(payment.getTripid5());
				entity.setTripid6(payment.getTripid6());
				entity.setTripid7(payment.getTripid7());
				entity.setTripid8(payment.getTripid8());
				entity.setTripid9(payment.getTripid9());
				entity.setTripid10(payment.getTripid10());
				entity.setTripamount1(payment.getTripamount1());
				entity.setTripamount2(payment.getTripamount2());
				entity.setTripamount3(payment.getTripamount3());
				entity.setTripamount4(payment.getTripamount4());
				entity.setTripamount5(payment.getTripamount5());
				entity.setTripamount6(payment.getTripamount6());
				entity.setTripamount7(payment.getTripamount7());
				entity.setTripamount8(payment.getTripamount8());
				entity.setTripamount9(payment.getTripamount9());
				entity.setTripamount10(payment.getTripamount10());
				entity.setDriverBata(payment.getDriverBata());
				entity.setFood(payment.getFood());
				entity.setDiesel(payment.getDiesel());
				entity.setOther(payment.getOther());
				entity.setIncome(payment.getIncome());
				entity.setTotalAmount(payment.getTotalAmount());
				entity.setTotalExpense(payment.getTotalExpense());
				entity.setTollExpense(payment.getTollExpense());
				entity.setComments(payment.getComments());
				entity.setUpdateuser(payment.getUpdateuser());
				entity.setUpdatedate(payment.getUpdatedate());
				
			}		
	}

	@Override
	public Payment findById(int id) {
		return dao.findById(id);
	}

	@Override
	public void updateTrips(Payment payment) {
		if(payment.getTripid1() != null && payment.getTripid1().length()>0) {
			dao.updateTrips(payment.getTripid1());
		}
		if(payment.getTripid2() != null && payment.getTripid2().length()>0) {
			dao.updateTrips(payment.getTripid2());
		}
		if(payment.getTripid3() != null && payment.getTripid3().length()>0) {
			dao.updateTrips(payment.getTripid3());
		}
		if(payment.getTripid4() != null && payment.getTripid4().length()>0) {
			dao.updateTrips(payment.getTripid4());
		}
		if(payment.getTripid5() != null && payment.getTripid5().length()>0) {
			dao.updateTrips(payment.getTripid5());
		}
		if(payment.getTripid6() != null && payment.getTripid6().length()>0) {
			dao.updateTrips(payment.getTripid6());
		}
		if(payment.getTripid7() != null && payment.getTripid7().length()>0) {
			dao.updateTrips(payment.getTripid7());
		}
		if(payment.getTripid8() != null && payment.getTripid8().length()>0) {
			dao.updateTrips(payment.getTripid8());
		}
		if(payment.getTripid9() != null && payment.getTripid9().length()>0) {
			dao.updateTrips(payment.getTripid9());
		}
		if(payment.getTripid10() != null && payment.getTripid10().length()>0) {
			dao.updateTrips(payment.getTripid10());
		}
						
	}
	
		
	}
	
	


