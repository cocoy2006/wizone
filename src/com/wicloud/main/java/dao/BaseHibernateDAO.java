package com.wicloud.main.java.dao;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.criterion.Property;
import org.hibernate.jdbc.Work;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;

/**
 * Data access object (DAO) for domain model
 * 
 * @author MyEclipse Persistence Tools
 */
public class BaseHibernateDAO<T> {

	private Class<T> entityClass;

	@Autowired
	private HibernateTemplate hibernateTemplate;

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public T load(Serializable id) {
		return (T) getHibernateTemplate().load(entityClass, id);
	}

	public T get(Serializable id) {
		return (T) getHibernateTemplate().get(entityClass, id);
	}

	public List<T> loadAll() {
		return getHibernateTemplate().loadAll(entityClass);
	}

	public Serializable save(T entity) {
		return getHibernateTemplate().save(entity);
	}

	public void remove(T entity) {
		getHibernateTemplate().delete(entity);
	}

	public void update(T entity) {
		getHibernateTemplate().update(entity);
	}

	public T merge(T entity) {
		return getHibernateTemplate().merge(entity);
	}

	public void saveOrUpdate(T entity) {
		getHibernateTemplate().saveOrUpdate(entity);
	}

	@SuppressWarnings("unchecked")
	public List<T> find(String hql) {
		return getHibernateTemplate().find(hql);
	}

	@SuppressWarnings("unchecked")
	public List<T> find(String hql, Object... params) {
		return getHibernateTemplate().find(hql, params);
	}

	public void initialize(Object entity) {
		getHibernateTemplate().initialize(entity);
	}

	/**
	 * 分页
	 * 
	 * @param entityClass
	 *            类名
	 * @param params
     *            属性列表
	 * @param index
	 *            当前页数
	 * @param size
	 *            每页显示的大小
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<T> paging(final Class<T> entityClass,
			final Map<String, Object> params, final int index, final int size) {
		return hibernateTemplate.executeFind(new HibernateCallback() {
			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				Criteria criteria = session.createCriteria(entityClass);
				for (String f : params.keySet()) {
					criteria.add(Property.forName(f).eq(params.get(f)));
				}
				criteria.setFirstResult((index - 1) * size);
				criteria.setMaxResults(size);
				return criteria.list();
			}
		});
	}
	
	/**
	 * 执行原生SQL语句
	 * 
	 * @param sql SQL语句
	 * @return ResultSet
	 * 
	 */
	@SuppressWarnings("unchecked")
	public ResultSet querySQL(final String queryString) {
		return (ResultSet) hibernateTemplate.execute(new HibernateCallback() {

			private ResultSet rs = null;

			public ResultSet doInHibernate(Session session) 
					throws HibernateException, SQLException {
				session.doWork(new Work() {

					public void execute(Connection conn) 
							throws SQLException {
						PreparedStatement pStmt = conn.prepareStatement(queryString);
						rs = pStmt.executeQuery();
					}

				});
				return rs;
			}

		});
	}

}