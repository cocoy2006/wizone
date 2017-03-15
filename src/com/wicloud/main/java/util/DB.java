package com.wicloud.main.java.util;

import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.wicloud.main.java.entity.Monindex;

public class DB {
	
	private static final SessionFactory sessionFactory;
	private static final HibernateTemplate hibernateTemplate;

	static {
		try {
			sessionFactory = new AnnotationConfiguration().configure(
					"hibernate.cfg.xml").buildSessionFactory();
			hibernateTemplate = new HibernateTemplate(sessionFactory);
		} catch (Throwable ex) {
			throw new ExceptionInInitializerError(ex);
		}
	}

	public static Monindex getMonindex(String monid) {
		try {
			String queryString = "from Monindex where monid=?";
			List list = hibernateTemplate.find(queryString, monid);
			if(list != null && list.size() > 0) {
				return (Monindex) list.get(0);
			} else {
				return null;
			}
		} catch (RuntimeException re) {
			throw re;
		}
	}
	
	public static List<Monindex> getAllMonindex() {
		try {
			String queryString = "from Monindex";
			return hibernateTemplate.find(queryString);
		} catch (RuntimeException re) {
			throw re;
		}
	}
	
	public static List<Monindex> getAllMonindexByUsername(String username) {
		try {
			String queryString = "from Monindex where username=?";
			return hibernateTemplate.find(queryString, username);
		} catch (RuntimeException re) {
			throw re;
		}
	}
}
