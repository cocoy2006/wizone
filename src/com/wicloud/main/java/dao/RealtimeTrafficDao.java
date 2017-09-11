package com.wicloud.main.java.dao;

import java.util.List;

import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.wicloud.main.java.entity.RealtimeTraffic;
import com.wicloud.main.java.entity.RealtimedataIn;

/**
 * A data access object (DAO) providing persistence and search support for
 * RealtimeTraffic entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see .RealtimeTraffic
 * @author MyEclipse Persistence Tools
 */

@Repository
public class RealtimeTrafficDao extends BaseHibernateDAO{
	
	private static final Logger log = LoggerFactory
	.getLogger(RealtimeTrafficDao.class);
	
	@Autowired
	private HibernateTemplate hibernateTemplate;

	protected void initDao() {
		// do nothing
	}

	public void save(RealtimeTraffic transientInstance) {
		log.debug("saving RealtimeTraffic instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(RealtimeTraffic persistentInstance) {
		log.debug("deleting RealtimeTraffic instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public RealtimeTraffic findById(java.lang.Integer id) {
		log.debug("getting RealtimeTraffic instance with id: " + id);
		try {
			RealtimeTraffic instance = (RealtimeTraffic) getHibernateTemplate().get(
					"com.wicloud.main.java.entity.RealtimeTraffic", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding RealtimeTraffic instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from realtime_traffic as model where model."
				+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}
	
	public List<RealtimeTraffic> findTraffic(int groupId,int start, int finish) {
		log.debug("finding traffic from realtime_traffic with" +", start: " + start + ", finish: " + finish);
		try {
			String queryString = "from RealtimeTraffic where groupid = ? and (monTime BETWEEN ? AND ?)";
			return hibernateTemplate.find(queryString, groupId, start, finish);
		} catch (RuntimeException re) {
			log.error("find traffic failed", re);
			throw re;
		}
	}
	
}
