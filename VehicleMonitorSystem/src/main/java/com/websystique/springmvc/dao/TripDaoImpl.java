package com.websystique.springmvc.dao;

import java.util.List;

import org.hibernate.Criteria;
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
	public void deleteTripByTripid(String tripid) {

		Criteria crit = createEntityCriteria();
		crit.add(Restrictions.eq("tripid", tripid));
		Trip trip = (Trip) crit.uniqueResult();
		delete(trip);

	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Trip> findAllTrips() {

		Criteria criteria = createEntityCriteria().addOrder(Order.asc("tripdate"));
		criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);// To avoid duplicates.
		List<Trip> trips = (List<Trip>) criteria.list();
		return trips;
	}

}
