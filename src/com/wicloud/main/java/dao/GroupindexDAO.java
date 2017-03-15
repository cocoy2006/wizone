package com.wicloud.main.java.dao;

import java.util.List;

import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.wicloud.main.java.entity.Groupindex;

/**
 * A data access object (DAO) providing persistence and search support for
 * Rssinfo entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.wicloud.main.java.entity.Rssinfo
 * @author MyEclipse Persistence Tools
 */

@Repository
public class GroupindexDAO extends BaseHibernateDAO {
	private static final Logger log = LoggerFactory.getLogger(GroupindexDAO.class);

	// property constants
	public static final String GROUPNAME = "groupname";
	
	@Autowired
	private HibernateTemplate hibernateTemplate;
	public void save(Groupindex transientInstance) {
		log.debug("saving Groupindex instance");
		try {
			hibernateTemplate.save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}
	
	public void saveOrUpdate(Groupindex transientInstance) {
		log.debug("saving Groupindex instance");
		try {
			
			hibernateTemplate.saveOrUpdate(transientInstance);
			log.debug("saveOrUpdate successful");
			//return Status.SUCCESS;
		} catch (RuntimeException re) {
			log.error("saveOrUpdate failed", re);
			throw re;
			//return Status.ERROR;
		}
	}
	
	public void delete(Groupindex persistentInstance) {
		log.debug("deleting Groupindex instance");
		try {
			hibernateTemplate.delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}
	public List findByGroupname(Object groupname) {
		return findByProperty(GROUPNAME, groupname);
	}
	public Groupindex findById(java.lang.Integer groupid) {
		log.debug("getting Monindex instance with id: " + groupid);
		try {
			Groupindex instance = (Groupindex) hibernateTemplate.get(
					"com.wicloud.main.java.entity.Groupindex", groupid);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
	
	public List<Groupindex> findByGroupId(java.lang.Integer groupid) {
		log.debug("getting Monindex instance with id: " + groupid);
		try {
			String queryString = "from Groupindex where groupid=?";
			return hibernateTemplate.find(queryString, groupid);
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
	public List findByProperty(String propertyName, Object value) {
		log.debug("finding Groupindex instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Groupindex as model where model."
					+ propertyName + "= ?";
			return hibernateTemplate.find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}
	public List findByUsername(Object value) {
		log.debug("finding all Groupindex instances with username: " + value);
		try {
			String queryString = "from Groupindex where username=?";
			return hibernateTemplate.find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
	public List findAll() {
		log.debug("finding all Groupindex instances");
		try {
			String queryString = "from Groupindex";
			return hibernateTemplate.loadAll(Groupindex.class);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	
	public void saveorUpdate(Groupindex transientInstance) {
		log.debug("saving Groupindex instance");
		try {
			
			hibernateTemplate.saveOrUpdate(transientInstance);
			log.debug("saveOrUpdate successful");
			//return Status.SUCCESS;
		} catch (RuntimeException re) {
			log.error("saveOrUpdate failed", re);
			throw re;
			//return Status.ERROR;
		}
	}

}