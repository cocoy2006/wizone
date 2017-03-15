package com.wicloud.main.java.dao;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Repository;
import com.wicloud.main.java.entity.Visitrecord;

/**
 * A data access object (DAO) providing persistence and search support for
 * Visitrecord entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.wicloud.main.java.entity.Visitrecord
 * @author MyEclipse Persistence Tools
 */

@Repository
public class VisitrecordDAO extends BaseHibernateDAO {
	private static final Logger log = LoggerFactory
			.getLogger(VisitrecordDAO.class);
	// property constants
	public static final String MAC = "mac";
	public static final String IN_TIME = "inTime";
	public static final String OFF_TIME = "offTime";
	public static final String DWELL_TIME = "dwellTime";
	public static final String MONID = "monid";
	
	@Autowired
	private HibernateTemplate hibernateTemplate;

	public void save(Visitrecord transientInstance) {
		log.debug("saving Visitrecord instance");
		try {
			hibernateTemplate.save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Visitrecord persistentInstance) {
		log.debug("deleting Visitrecord instance");
		try {
			hibernateTemplate.delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Visitrecord findById(java.lang.Integer id) {
		log.debug("getting Visitrecord instance with id: " + id);
		try {
			Visitrecord instance = (Visitrecord) hibernateTemplate.get(
					"com.wicloud.main.java.entity.Visitrecord", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding Visitrecord instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Visitrecord as model where model."
					+ propertyName + "= ?";
			return hibernateTemplate.find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByMac(Object mac) {
		return findByProperty(MAC, mac);
	}

	public List findByInTime(Object inTime) {
		return findByProperty(IN_TIME, inTime);
	}

	public List findByOffTime(Object offTime) {
		return findByProperty(OFF_TIME, offTime);
	}

	public List findByDwellTime(Object dwellTime) {
		return findByProperty(DWELL_TIME, dwellTime);
	}

	public List findByMonid(Object monid) {
		return findByProperty(MONID, monid);
	}

	public List findAll() {
		log.debug("finding all Visitrecord instances");
		try {
			String queryString = "from Visitrecord";
			return hibernateTemplate.loadAll(Visitrecord.class);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
	public List findCountMac(String monid, int inTime) {
		log.debug("finding count(mac) from Visitrecord with monid: " + 
				monid + ", inTime: " + inTime);
		try {
			String queryString = "select count(mac) from Visitrecord where monid=? AND inTime>=?";
			return hibernateTemplate.find(queryString, monid, inTime);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
	public List findCountMacAndAvgDwelltime(String monid, int inTime, int dwellTime) {
		log.debug("finding count(mac), avg(dwellTime) from Visitrecord with monid: " + 
				monid + ", inTime: " + inTime + ", dwellTime: " + dwellTime);
		try {
			String queryString = "select count(mac), avg(dwellTime) from Visitrecord where monid=? AND inTime>? AND dwellTime>?";
			return hibernateTemplate.find(queryString, monid, inTime, dwellTime);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
	public List findDistinctMac(String monid, int start, int finish) {
		log.debug("finding distinct(mac) from Visitrecord with monid: " + 
				monid + ", start inTime: " + start + ", finish inTime: " + finish);
		try {
			String queryString = "SELECT DISTINCT(mac) FROM Visitrecord where monid=? and inTime>=? and inTime<=?";
			return hibernateTemplate.find(queryString, monid, start, finish);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
	public List findCount(String monid, int start, int finish) {
		log.debug("finding avg(f), max(f) from Visitrecord with monid: " + 
				monid + ", start inTime: " + start + ", finish inTime: " + finish);
		try {
//			String queryString = "SELECT avg(f),max(f) FROM (SELECT COUNT(*) AS f,mac FROM Visitrecord where monid=? and inTime>=? and inTime<=? GROUP BY mac ORDER BY f DESC) as hh;";
			// rewrite it after
			String queryString = "SELECT COUNT(*) FROM Visitrecord where monid=? and inTime>=? and inTime<=? GROUP BY mac";
			return hibernateTemplate.find(queryString, monid, start, finish);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
	public List findMacAndIntime(String macs) {
		log.debug("finding mac,inTime from Visitrecord with macs: " + macs);
		try {
			String queryString = "SELECT mac,inTime FROM Visitrecord WHERE  mac in (?);";
			return hibernateTemplate.find(queryString, macs);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
	public List<Object[]> findFreAndMac(String monid, int start, int finish) {
		log.debug("finding fre, mac from Visitrecord with monid: " + 
				monid + ", start inTime: " + start + ", finish inTime: " + finish);
		try {
			DetachedCriteria criteria = DetachedCriteria.forClass(Visitrecord.class);
			criteria.add(Restrictions.eq("monid", monid))
				.add(Restrictions.between("inTime", start, finish))
//				.addOrder(Order.desc("fre"))
				.setProjection(Projections.projectionList()
						.add(Projections.groupProperty("mac"))
						.add(Projections.rowCount(), "fre")
//						.add(Projections.property("mac"), "mac")
				);
			return hibernateTemplate.findByCriteria(criteria);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	//修改的
	
	public int[] findDtimeAndMac(String monid, int start, int finish) {	
		log.debug("finding count(*), from Visitrecord with monid: " + 
				monid + ", start inTime: " + start + ", finish inTime: " + finish);
		int[] temp=new int[6];
		try {
			DetachedCriteria criteria = DetachedCriteria.forClass(Visitrecord.class);
			criteria.add(Restrictions.eq("monid", monid))
				.add(Restrictions.between("inTime", start, finish))
				.add(Restrictions.between("dwellTime", 0, 60))
				.setProjection(Projections.projectionList()
						.add(Projections.rowCount()));
			
			temp[0]= (Integer) hibernateTemplate.findByCriteria(criteria).get(0);
			criteria = DetachedCriteria.forClass(Visitrecord.class);
			criteria.add(Restrictions.eq("monid", monid))
				.add(Restrictions.between("inTime", start, finish))
				.add(Restrictions.between("dwellTime", 60, 300))
				.setProjection(Projections.projectionList()
						.add(Projections.rowCount()));
			temp[1]= (Integer) hibernateTemplate.findByCriteria(criteria).get(0);
			criteria = DetachedCriteria.forClass(Visitrecord.class);
			criteria.add(Restrictions.eq("monid", monid))
				.add(Restrictions.between("inTime", start, finish))
				.add(Restrictions.between("dwellTime", 300, 600))
				.setProjection(Projections.projectionList()
						.add(Projections.rowCount()));
			temp[2]= (Integer) hibernateTemplate.findByCriteria(criteria).get(0);
			criteria = DetachedCriteria.forClass(Visitrecord.class);
			criteria.add(Restrictions.eq("monid", monid))
				.add(Restrictions.between("inTime", start, finish))
				.add(Restrictions.between("dwellTime", 600, 1200))
				.setProjection(Projections.projectionList()
						.add(Projections.rowCount()));
			temp[3]= (Integer) hibernateTemplate.findByCriteria(criteria).get(0);
			criteria = DetachedCriteria.forClass(Visitrecord.class);
			criteria.add(Restrictions.eq("monid", monid))
				.add(Restrictions.between("inTime", start, finish))
				.add(Restrictions.between("dwellTime", 1200, 1800))
				.setProjection(Projections.projectionList()
						.add(Projections.rowCount()));
			temp[4]= (Integer) hibernateTemplate.findByCriteria(criteria).get(0);
			criteria = DetachedCriteria.forClass(Visitrecord.class);
			criteria.add(Restrictions.eq("monid", monid))
				.add(Restrictions.between("inTime", start, finish))
				.add(Restrictions.between("dwellTime", 1800, 86400))
				.setProjection(Projections.projectionList()
						.add(Projections.rowCount()));
			temp[5]= (Integer) hibernateTemplate.findByCriteria(criteria).get(0);
			
			return temp;
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
//	public List<Object[]> findFreAndCountDistinctMac(String monid, int start, int finish) {
//		log.debug("finding fre,COUNT(DISTINCT(mac)) from Visitrecord with monid: " + 
//				monid + ", start inTime: " + start + ", finish inTime: " + finish);
//		try {
//			DetachedCriteria subCriteria = DetachedCriteria.forClass(Visitrecord.class);
//			subCriteria.add(Restrictions.eq("monid", monid))
//				.add(Restrictions.between("inTime", start, finish))
//				.addOrder(Order.desc("fre"))
//				.setProjection(Projections.projectionList()
//						.add(Projections.groupProperty("mac"))
//						.add(Projections.rowCount(), "fre")
//						.add(Projections.property("mac"), "mac")
//				)
//				
//				;
//			DetachedCriteria criteria = DetachedCriteria.forClass(Visitrecord.class);
//			criteria.add(Subqueries.exists(subCriteria))
//				.setProjection(Projections.projectionList()
//					.add(Projections.groupProperty("fre"))
//					.add(Projections.property("fre"))
//					.add(Projections.countDistinct("mac"))
//			);
//			return hibernateTemplate.findByCriteria(criteria);
//		} catch (RuntimeException re) {
//			log.error("find all failed", re);
//			throw re;
//		}
//	}
//	public ResultSet findFreAndCountDistinctMac(String monid, int start, int finish) {
//		log.debug("finding fre,COUNT(DISTINCT(mac)) from Visitrecord with monid: " + 
//				monid + ", start inTime: " + start + ", finish inTime: " + finish);
//		try {
//			String queryString = "SELECT fre,COUNT(DISTINCT(mac)) FROM (SELECT COUNT(*) AS fre,mac FROM Visitrecord " +
//					"WHERE monid='" + monid +
//					"' and inTime>='" + start +
//					"' and inTime<='" + finish +
//					"' GROUP BY mac ORDER BY fre DESC) AS t GROUP BY fre";
//			return this.querySQL(queryString);
//		} catch (RuntimeException re) {
//			log.error("find all failed", re);
//			throw re;
//		}
//	}

}