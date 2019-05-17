package com.websystique.springmvc.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.websystique.springmvc.model.Payment;

@Repository("paymentDao")

public class PaymentDaoImpl extends AbstractDao<Integer, Payment> implements PaymentDao {

	static final Logger logger = LoggerFactory.getLogger(PaymentDaoImpl.class);

	@Override
	public List<Payment> findAllPayments() {

		Criteria criteria = createEntityCriteria().addOrder(Order.asc("paymentsid"));
		criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);// To avoid duplicates.
		List<Payment> payments = (List<Payment>) criteria.list();

		return payments;
	}

}
