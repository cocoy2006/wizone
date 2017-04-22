package com.wicloud.main.java.dao;

import java.util.List;

import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.wicloud.main.java.entity.TrafficToday;

/**
 * A data access object (DAO) providing persistence and search support for
 * TrafficToday entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see .TrafficToday
 * @author MyEclipse Persistence Tools
 */

@Repository
public class TrafficTodayDao extends BaseHibernateDAO{
	
	private static final Logger log = LoggerFactory
	.getLogger(TrafficTodayDao.class);
	
	@Autowired
	private HibernateTemplate hibernateTemplate;

	protected void initDao() {
		// do nothing
	}

	public void save(TrafficToday transientInstance) {
		log.debug("saving TrafficToday instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(TrafficToday persistentInstance) {
		log.debug("deleting TrafficToday instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public TrafficToday findById(java.lang.Integer id) {
		log.debug("getting TrafficToday instance with id: " + id);
		try {
			TrafficToday instance = (TrafficToday) getHibernateTemplate().get(
					"com.wicloud.main.java.entity.TrafficToday", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get TrafficToday failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding TrafficToday instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from traffic_today as model where model."
				+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}
	
	public List<TrafficToday> findTraffic(int groupId,int start, int finish) {
		log.debug("finding traffic from traffic_today with" +", start: " + start + ", finish: " + finish);
		try {
			String queryString = "from TrafficToday where groupid = ? and monTime >= ? and monTime <= ?";
			return hibernateTemplate.find(queryString, groupId, start, finish);
		} catch (RuntimeException re) {
			log.error("find traffic failed", re);
			throw re;
		}
	}
	
}
