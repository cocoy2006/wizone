package com.wicloud.main.java.dao;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.wicloud.main.java.entity.RealtimedataIn;

/**
 * A data access object (DAO) providing persistence and search support for
 * RealtimedataIn entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.wicloud.main.java.entity.RealtimedataIn
 * @author MyEclipse Persistence Tools
 */

@Repository
public class RealtimedataInDAO extends BaseHibernateDAO {
	private static final Logger log = LoggerFactory
			.getLogger(RealtimedataInDAO.class);

	@Autowired
	private HibernateTemplate hibernateTemplate;
	
	// property constants

	public void save(RealtimedataIn transientInstance) {
		log.debug("saving RealtimedataIn instance");
		try {
			hibernateTemplate.save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(RealtimedataIn persistentInstance) {
		log.debug("deleting RealtimedataIn instance");
		try {
			hibernateTemplate.delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public RealtimedataIn findById(
			com.wicloud.main.java.entity.RealtimedataInId id) {
		log.debug("getting RealtimedataIn instance with id: " + id);
		try {
			RealtimedataIn instance = (RealtimedataIn) hibernateTemplate.get(
					"com.wicloud.main.java.entity.RealtimedataIn", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding RealtimedataIn instance with property: "
				+ propertyName + ", value: " + value);
		try {
			String queryString = "from RealtimedataIn as model where model." + propertyName + "= ?";
			return hibernateTemplate.find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findAll() {
		log.debug("finding all RealtimedataIn instances");
		try {
			String queryString = "from RealtimedataIn";
			return hibernateTemplate.loadAll(RealtimedataIn.class);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
	//将实时流量表中的数据按时间降序排列，取时间点最大的那个，即实时流量
	public List<RealtimedataIn> findTraffic(String place,int monTime) {
		log.debug("finding traffic from RealtimedataIn with " + " monTime: " + monTime);
		try {
			String queryString = "from RealtimedataIn where groupindex.groupname=? order by id.monTime desc limit 1";
			return hibernateTemplate.find(queryString,place);
		} catch (RuntimeException re) {
			log.error("find traffic failed", re);
			throw re;
		}
	}
	
	public List findAvgTrafficAndMaxTraffic(String place,int monTime) {
		log.debug("finding avg(traffic), max(traffic) from RealtimedataIn with" +  ", monTime: " + monTime);
		try {
			String queryString = "select avg(id.traffic), max(id.traffic) from RealtimedataIn where id.monTime>=? and groupindex.groupname=?";
			return hibernateTemplate.find(queryString,monTime,place);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
	public List<RealtimedataIn> findMontimeAndTraffic(String place,int start, int finish) {
		log.debug("finding monTime and traffic from RealtimedataIn with" +", start: " + start + ", finish: " + finish);
		try {
			String queryString = "from RealtimedataIn where groupindex.groupname=? and (id.monTime BETWEEN ? AND ?)";
			return hibernateTemplate.find(queryString,place,start, finish);
		} catch (RuntimeException re) {
			log.error("find monTime and traffic failed", re);
			throw re;
		}
	}

}