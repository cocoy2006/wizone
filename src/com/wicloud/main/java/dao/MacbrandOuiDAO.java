package com.wicloud.main.java.dao;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.wicloud.main.java.entity.MacbrandOui;

/**
 * A data access object (DAO) providing persistence and search support for
 * MacbrandOui entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.wicloud.main.java.entity.MacbrandOui
 * @author MyEclipse Persistence Tools
 */

@Repository
public class MacbrandOuiDAO extends BaseHibernateDAO {
	private static final Logger log = LoggerFactory
			.getLogger(MacbrandOuiDAO.class);

	@Autowired
	private HibernateTemplate hibernateTemplate;
	
	// property constants

	public void save(MacbrandOui transientInstance) {
		log.debug("saving MacbrandOui instance");
		try {
			hibernateTemplate.save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(MacbrandOui persistentInstance) {
		log.debug("deleting MacbrandOui instance");
		try {
			hibernateTemplate.delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public MacbrandOui findById(com.wicloud.main.java.entity.MacbrandOuiId id) {
		log.debug("getting MacbrandOui instance with id: " + id);
		try {
			MacbrandOui instance = (MacbrandOui) hibernateTemplate.get(
					"com.wicloud.main.java.entity.MacbrandOui", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding MacbrandOui instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from MacbrandOui as model where model."
					+ propertyName + "= ?";
			return hibernateTemplate.find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findAll() {
		log.debug("finding all MacbrandOui instances");
		try {
			String queryString = "from MacbrandOui";
			return hibernateTemplate.loadAll(MacbrandOui.class);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

}