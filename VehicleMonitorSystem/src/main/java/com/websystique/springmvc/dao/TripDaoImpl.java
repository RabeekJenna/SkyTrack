package com.websystique.springmvc.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.websystique.springmvc.model.Trip;

@Repository("tripDao")

public class TripDaoImpl extends AbstractDao<Integer, Trip> implements TripDao {

	static final Logger logger = LoggerFactory.getLogger(TripDaoImpl.class);

	@Override
	public Trip findById(int id) {

		Trip trip = getByKey(id);
		return trip;
	}

	@Override
	public Trip findByTripid(String tripid) {

		logger.info("Trip Id : {}", tripid);
		Criteria crit = createEntityCriteria();
		crit.add(Restrictions.eq("tripid", tripid));
		Trip trip = (Trip) crit.uniqueResult();
		return trip;
	}

	@Override
	public void saveTrip(Trip trip) {
		persist(trip);

	}
	
	@Override
	public String findTripAmount(String tripid) {
		
		Query query = getSession().createSQLQuery("SELECT TOTALAMOUNT FROM TRIPS WHERE TRIPID ='"+tripid+"' AND STATUS !='Settled'");
		String result = (String) query.uniqueResult();
		return result;

	}
	
	

	@Override
	public void deleteTripByTripid(String tripid) {

		Criteria crit = createEntityCriteria();
		crit.add(Restrictions.eq("tripid", tripid));
		Trip trip = (Trip) crit.uniqueResult();
		delete(trip);

	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Trip> findAllTrips() {

		Criteria criteria = createEntityCriteria().addOrder(Order.asc("tripid"));
		criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);// To avoid duplicates.
		List<Trip> trips = (List<Trip>) criteria.list();
		return trips;
	}

	public Trip selectMaxOfTripid() {

		Criteria crit = createEntityCriteria();
		crit.addOrder(Order.desc("temptripid"));
		crit.setMaxResults(1);
		Trip trip = (Trip) crit.uniqueResult();
		return trip;
	}

}
