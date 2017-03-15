package com.wicloud.main.java.dao;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.wicloud.main.java.entity.Monindex;

/**
 * A data access object (DAO) providing persistence and search support for
 * Monindex entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.wicloud.main.java.entity.Monindex
 * @author MyEclipse Persistence Tools
 */

@Repository
public class MonindexDAO extends BaseHibernateDAO {
	private static final Logger log = LoggerFactory
			.getLogger(MonindexDAO.class);
	// property constants
	public static final String MON_ID = "monid";
	public static final String MON_MODLE = "monModle";
	public static final String MON_ADD = "monAdd";
	public static final String WALL_TYPE = "wallType";
	public static final String WALL_EXP = "wallExp";
	public static final String WALL_DIS = "wallDis";
	public static final String MONNAME = "monname";
	public static final String TOTAL = "total";
	public static final String GROUPID = "groupid";
	public static final String LNG="lng";
	public static final String LAT="lat";
	public static final String RSSIN="rssin";
	public static final String RSSOUT="rssout";
	@Autowired
	private HibernateTemplate hibernateTemplate;

	public void save(Monindex transientInstance) {
		log.debug("saving Monindex instance");
		try {
			hibernateTemplate.save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}
	
	public void saveOrUpdate(Monindex transientInstance) {
		log.debug("saving Monindex instance");
		try {
			hibernateTemplate.saveOrUpdate(transientInstance);
			log.debug("saveOrUpdate successful");
		} catch (RuntimeException re) {
			log.error("saveOrUpdate failed", re);
			throw re;
		}
	}

	public void delete(Monindex persistentInstance) {
		log.debug("deleting Monindex instance");
		try {
			hibernateTemplate.delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Monindex findById(java.lang.String id) {
		log.debug("getting Monindex instance with id: " + id);
		try {
			Monindex instance = (Monindex) hibernateTemplate.get(
					"com.wicloud.main.java.entity.Monindex", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding Monindex instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Monindex as model where model."
					+ propertyName + "= ?";
			return hibernateTemplate.find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByMonModle(Object monModle) {
		return findByProperty(MON_MODLE, monModle);
	}

	public List findByMonAdd(Object monAdd) {
		return findByProperty(MON_ADD, monAdd);
	}

	public List findByWallType(Object wallType) {
		return findByProperty(WALL_TYPE, wallType);
	}

	public List findByWallExp(Object wallExp) {
		return findByProperty(WALL_EXP, wallExp);
	}

	public List findByWallDis(Object wallDis) {
		return findByProperty(WALL_DIS, wallDis);
	}

	public List findByMonname(Object monname) {
		return findByProperty(MONNAME, monname);
	}
	
	public List findByTotal(Object total) {
		return findByProperty(TOTAL, total);
	}
	public List findByLng(Object lng) {
		return findByProperty(LNG, lng);
	}
	public List findByLat(Object lat) {
		return findByProperty(LAT, lat);
	}
	public List findByRssin(Object rssin) {
		return findByProperty(RSSIN, rssin);
	}
	public List findByRssout(Object rssout) {
		return findByProperty(RSSOUT, rssout);
	}
	public List<Monindex> findByGroupid(Integer groupid) {
		return findByProperty(GROUPID, groupid);
	}
	public List<Monindex> findByMonid(String monid) {
		return findByProperty(MON_ID, monid);
	}
	
	public List findByGroup(Object value) {
		log.debug("finding all Monindex instances with username: " + value);
		try {
			String queryString = "from Monindex where groupid=?";
			return hibernateTemplate.find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public List findAll() {
		log.debug("finding all Monindex instances");
		try {
			return hibernateTemplate.loadAll(Monindex.class);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	

	
	public long findCount() {
		log.debug("finding Monindex count(*)");
		try {
			String queryString = "select count(*) from Monindex";
			List list = hibernateTemplate.find(queryString);
			if(list != null && list.size() > 0) {
				Object obj = list.get(0);
				if(obj != null) {
					return (Long) obj;
				}
			}
			return 0;
		} catch (RuntimeException re) {
			log.error("find count failed", re);
			throw re;
		}
	}
	
	public long findCount(String username) {
		log.debug("finding Monindex count(*)");
		try {
			String queryString = "select count(*) from Monindex where userName=?";
			List list = hibernateTemplate.find(queryString, username);
			if(list != null && list.size() > 0) {
				Object obj = list.get(0);
				if(obj != null) {
					return (Long) obj;
				}
			}
			return 0;
		} catch (RuntimeException re) {
			log.error("find count failed", re);
			throw re;
		}
	}
}