package com.wicloud.main.java.dao;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.wicloud.main.java.entity.GoAndCome;
import com.wicloud.main.java.entity.RealGate;

/**
 * A data access object (DAO) providing persistence and search support for
 * GoAndCome entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see .GoAndCome
 * @author MyEclipse Persistence Tools
 */

@Repository
public class RealGateDAO extends BaseHibernateDAO{
	private static final Logger log = LoggerFactory
	.getLogger(RealGateDAO.class);
	// property constants
	public static final String TIME = "time";
	public static final String GATE_ID = "gateid";
	public static final String ALLDATA= "alldata";
	
	@Autowired
	private HibernateTemplate hibernateTemplate;

	protected void initDao() {
		// do nothing
	}

	public void save(RealGate transientInstance) {
		log.debug("saving RealGate instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(RealGate persistentInstance) {
		log.debug("deleting RealGate instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public RealGate findById(java.lang.Integer id) {
		log.debug("getting GoAndCome instance with id: " + id);
		try {
			RealGate instance = (RealGate) getHibernateTemplate().get(
					"RealGate", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(RealGate instance) {
		log.debug("finding RealGate instance by example");
		try {
			List results = getHibernateTemplate().findByExample(instance);
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding RealGate instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from RealGate as model where model."
				+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByGateId(Object gateId) {
		return findByProperty(GATE_ID, gateId);
	}


	public List<RealGate> getAll(int finish) {
		log.debug("finding all RealGate instances");
		finish=finish-5*60;
		try {
			String queryString = "from RealGate where time>=?";
			return getHibernateTemplate().find(queryString,finish);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
	public List<RealGate> findFour() {
		return getHibernateTemplate().find("from RealGate order by id desc");
	}


	public RealGate merge(RealGate detachedInstance) {
		log.debug("merging RealGate instance");
		try {
			RealGate result = (RealGate) getHibernateTemplate().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
}

	public void attachDirty(RealGate instance) {
		log.debug("attaching dirty RealGate instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(RealGate instance) {
		log.debug("attaching clean RealGate instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static RealGateDAO getFromApplicationContext(ApplicationContext ctx) {
		return (RealGateDAO) ctx.getBean("RealGateDAO");
	}
}
