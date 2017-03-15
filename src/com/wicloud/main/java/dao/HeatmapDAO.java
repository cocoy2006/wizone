package com.wicloud.main.java.dao;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.wicloud.main.java.entity.Heatmap;

@Repository
public class HeatmapDAO extends BaseHibernateDAO {
	private static final Logger log = LoggerFactory
			.getLogger(HeatmapDAO.class);
	
	// property constants
	public static final String ID = "id";
	public static final String CNT = "cnt";
	public static final String MONTIME = "monTime";
	public static final String GROUPID = "groupid";
	@Autowired
	private HibernateTemplate hibernateTemplate;
	
	public void save(Heatmap transientInstance) {
		log.debug("saving Heatmap instance");
		try {
			hibernateTemplate.save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Heatmap persistentInstance) {
		log.debug("deleting Heatmap instance");
		try {
			hibernateTemplate.delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Heatmap findById(java.lang.Integer id) {
		log.debug("getting Heatmap instance with id: " + id);
		try {
			Heatmap instance = (Heatmap) hibernateTemplate.get(
					"com.wicloud.main.java.entity.Heatmap", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding Heatmap instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Heatmap as model where model."
					+ propertyName + "= ?";
			return hibernateTemplate.find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	
	public List findByTotalCi(Object cnt) {
		return findByProperty(CNT, cnt);
	}

	public List<Heatmap> getAll(String finish){
		log.debug("finding all Heatmap instances");
		try {
			int finish1=Integer.parseInt(finish);
			String queryString = "from Heatmap where monTime=? order by cnt desc";
			return hibernateTemplate.find(queryString,finish1);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
		
	}
	
	/**
	 * 获取最后的diff个记录
	 * @param diff
	 * @return
	 */
	public List<Heatmap> getLast(int diff){
		List<Heatmap> heatmapList = new ArrayList<Heatmap>();
		int step = 0;
		int maxId = maxId().get(0);
		while (step < diff) {
			Heatmap heatmap = findById(maxId - step);
			heatmapList.add(heatmap);
			step++;
		}
		// 需要对heatmapList做monTime变量的排序，逆序
		Collections.sort(heatmapList);
		return heatmapList;
	}
	
	public List findAll() {
		log.debug("finding all Heatmap instances");
		try {
			String queryString = "from Heatmap";
			return hibernateTemplate.loadAll(Heatmap.class);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	public List<Object> findAllHeat() {
		log.debug("finding traffic from RealtimedataIn with monid: " + 
				", monTime: ");
		try {
			String queryString = "from Heatmap order by cnt desc";
			return hibernateTemplate.find(queryString);
		} catch (RuntimeException re) {
			log.error("find traffic failed", re);
			throw re;
		}
	}
	public List maxTime() {
		log.debug("finding max(comein),avg(comein),min(comein) from Totalinfo with "+ " start: ");
		try {
			DetachedCriteria criteria = DetachedCriteria.forClass(Heatmap.class);
			ProjectionList projection = Projections.projectionList();
			projection.add(Projections.max("monTime"));
			criteria.setProjection(projection);
			return hibernateTemplate.findByCriteria(criteria);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
	public List<Integer> maxId() {
		log.debug("finding max(comein),avg(comein),min(comein) from Totalinfo with "+ " start: ");
		try {
			DetachedCriteria criteria = DetachedCriteria.forClass(Heatmap.class);
			ProjectionList projection = Projections.projectionList();
			projection.add(Projections.max("id"));
			criteria.setProjection(projection);
			return hibernateTemplate.findByCriteria(criteria);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
}
