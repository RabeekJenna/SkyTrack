package com.websystique.springmvc.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.websystique.springmvc.model.Driver;

@Repository("driverDao")
public class DriverDaoImpl extends AbstractDao<Integer, Driver> implements DriverDao {

	static final Logger logger = LoggerFactory.getLogger(DriverDaoImpl.class);

	public Driver findById(int id) {
		Driver driver = getByKey(id);
		return driver;
	}

	public Driver findByDriverid(String driverid) {
		logger.info("driverid : {}", driverid);
		Criteria crit = createEntityCriteria();
		crit.add(Restrictions.eq("driverid", driverid));
		Driver driver = (Driver) crit.uniqueResult();
		return driver;
	}

	@SuppressWarnings("unchecked")
	public List<Driver> findAllDrivers() {
		Criteria criteria = createEntityCriteria().addOrder(Order.asc("firstName"));
		criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);// To avoid duplicates.
		List<Driver> drivers = (List<Driver>) criteria.list();

		// No need to fetch userProfiles since we are not showing them on list page. Let
		// them lazy load.
		// Uncomment below lines for eagerly fetching of userProfiles if you want.
		return drivers;
	}

	public void save(Driver driver) {
		persist(driver);
	}

	public void deleteByDriverid(String driverid) {
		Criteria crit = createEntityCriteria();
		crit.add(Restrictions.eq("driverid", driverid));
		Driver driver = (Driver) crit.uniqueResult();
		delete(driver);
	}

}
