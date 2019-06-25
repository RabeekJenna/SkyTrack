package com.websystique.springmvc.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.websystique.springmvc.model.Driver;
import com.websystique.springmvc.model.Payment;

@Repository("paymentDao")

public class PaymentDaoImpl extends AbstractDao<Integer, Payment> implements PaymentDao {

	static final Logger logger = LoggerFactory.getLogger(PaymentDaoImpl.class);

	@SuppressWarnings("unchecked")
	@Override
	public List<Payment> findAllPayments() {

		Criteria criteria = createEntityCriteria().addOrder(Order.asc("paymentDate"));
		criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);// To avoid duplicates.
		List<Payment> payments = (List<Payment>) criteria.list();

		return payments;
	}

	@Override
	public void save(Payment payment) {
		persist(payment);
		
	}
	
	public Payment findById(int id) {
		Payment payment = getByKey(id);
		return payment;
	}

	@Override
	public Payment findByPaymentid(String paymentid) {
		
			logger.info("paymentid : {}", paymentid);
			int pmtid = Integer.parseInt(paymentid);					
			Criteria crit = createEntityCriteria();
			crit.add(Restrictions.eq("id", pmtid));
			Payment payment = (Payment) crit.uniqueResult();
			return payment;
	}

	@Override
	public int updateTrips(int id) {
		
		Query query = getSession().createSQLQuery("UPDATE TRIPS SET STATUS = :status WHERE ID= :id");
		 query.setParameter("status", "Settled");
		 query.setParameter("id", id);
		int result = query.executeUpdate();
		return result;
		
	}
		
		
	@Override
	public Payment findByTripid(String tripid, String triptableid) {
		
							
		Criteria crit = createEntityCriteria();
		crit.add(Restrictions.eq(triptableid, tripid));
		Payment payment = (Payment) crit.uniqueResult();
		return payment;
}
	
	

}
