package com.wicloud.main.java.dao;
// default package

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.wicloud.main.java.entity.GoAndCome;

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
public class GoAndComeDAO extends BaseHibernateDAO {
	private static final Logger log = LoggerFactory
			.getLogger(GoAndComeDAO.class);
	// property constants
	public static final String COME_IN = "comeIn";
	public static final String GO_OUT = "goOut";
	public static final String GATE_ID = "gateId";

	@Autowired
	private HibernateTemplate hibernateTemplate;
	
	protected void initDao() {
		// do nothing
	}

	public void save(GoAndCome transientInstance) {
		log.debug("saving GoAndCome instance");
		try {
			getHibernateTemplate().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(GoAndCome persistentInstance) {
		log.debug("deleting GoAndCome instance");
		try {
			getHibernateTemplate().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public GoAndCome findById(java.lang.Integer id) {
		log.debug("getting GoAndCome instance with id: " + id);
		try {
			GoAndCome instance = (GoAndCome) getHibernateTemplate().get(
					"GoAndCome", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(GoAndCome instance) {
		log.debug("finding GoAndCome instance by example");
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
		log.debug("finding GoAndCome instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from GoAndCome as model where model."
					+ propertyName + "= ?";
			return getHibernateTemplate().find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByComeIn(Object comeIn) {
		return findByProperty(COME_IN, comeIn);
	}

	public List findByGoOut(Object goOut) {
		return findByProperty(GO_OUT, goOut);
	}

	public List findByGateId(Object gateId) {
		return findByProperty(GATE_ID, gateId);
	}

	public List findAll() {
		log.debug("finding all GoAndCome instances");
		try {
			String queryString = "from GoAndCome";
			return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	public List<GoAndCome> getAll(String gateId,String start,String finish) {
		log.debug("finding all GoAndCome instances");
		try {
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd"); 
			String queryString = "from GoAndCome where gateId=? and time>=? and time<=?";
			return getHibernateTemplate().find(queryString,gateId,Date.valueOf(start),Date.valueOf(finish));
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	public List<GoAndCome> getWeek(String start,String finish) {
		log.debug("finding all GoAndCome instances");
		try {
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd"); 
			String queryString = "from GoAndCome where time>=? and time<=?";
			return getHibernateTemplate().find(queryString,Date.valueOf(start),Date.valueOf(finish));
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	public List<GoAndCome> getAll1(String start,String finish) {
		log.debug("finding all GoAndCome instances");
		try {
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd"); 
			String queryString = "from GoAndCome where time>=? and time<=?";
			return getHibernateTemplate().find(queryString,Date.valueOf(start),Date.valueOf(finish));
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	public GoAndCome merge(GoAndCome detachedInstance) {
		log.debug("merging GoAndCome instance");
		try {
			GoAndCome result = (GoAndCome) getHibernateTemplate().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(GoAndCome instance) {
		log.debug("attaching dirty GoAndCome instance");
		try {
			getHibernateTemplate().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(GoAndCome instance) {
		log.debug("attaching clean GoAndCome instance");
		try {
			getHibernateTemplate().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static GoAndComeDAO getFromApplicationContext(ApplicationContext ctx) {
		return (GoAndComeDAO) ctx.getBean("GoAndComeDAO");
	}
}