package com.wicloud.test.java.dao.tester;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.HibernateTemplate;

public class Tester {

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

	public static Session getSession() throws HibernateException {
		return sessionFactory.openSession();
	}

	@SuppressWarnings("unchecked")
	public static void main(String[] args) {
		final Session session = getSession();
		final String queryString = "select avg(id.traffic), max(id.traffic) from Realtimedata where monindex.monid=? AND id.monTime>=?";
		try {
//			Criteria crit = session.createCriteria(Realtimedata.class);
//			crit.add(Restrictions.eq("monindex.monid", "1")).add(Restrictions.gt("id.monTime", 1407254100));
//			ProjectionList proj = Projections.projectionList();
//			proj.add(Projections.avg("id.traffic"));
//			proj.add(Projections.max("id.traffic"));
//			crit.setProjection(proj);
//			List results = crit.list();
//			System.out.println(results);
			
//			Integer maxDuration = (Integer) criteria.uniqueResult();
//			System.out.println("Max Track Duration = " + maxDuration);
//			String queryString = "SELECT avg(f), max(f) FROM ( SELECT COUNT(mac) AS f FROM Visitrecord where monid='1' GROUP BY mac ) as hh";
			
//			DetachedCriteria criteria = DetachedCriteria.forClass(Visitrecord.class);
//			criteria.add(Restrictions.eq("monid", "1")).setProjection(Projections.groupProperty("mac"));
//			String queryString = "SELECT avg(counter),avg(apple),avg(samsung),avg(nokia),avg(sony),avg(zte),avg(huawei),avg(asus),avg(intel),avg(honhai),avg(htc),avg(xiaomi),avg(oppo),avg(lg), avg(lenovo),avg(meizu),avg(coolpad),avg(bbk),avg(tpLink),avg(gionee),avg(murata),avg(inpro),avg(azureWave),avg(liteon),avg(arris),avg(KTouch),avg(acSiP),avg(asiaPacific),avg(chiMei),avg(foxconn),avg(garmin),avg(gemtek),avg(mediaTek),avg(qualcomm),avg(hisense),avg(roving),avg(simcom),avg(sharp),avg(wisol),avg(wistron),avg(amoi),avg(bird),avg(philips),avg(tcl) FROM Branddis  WHERE  monid=?";
//			String finish = "2014-07-28";
//			String queryString = "from Totalinfo where monid=? and time>=? and time<=? order by time asc";
			List list = hibernateTemplate.find(queryString, "1", 1396368300);
			System.out.println(list);
			
//			ResultSet rs1 = (ResultSet) hibernateTemplate.execute(new HibernateCallback() {
//
//				private ResultSet rs = null;
//
//				public ResultSet doInHibernate(Session session) throws HibernateException, SQLException {
//					session.doWork(new Work() {
//
//						public void execute(Connection conn) throws SQLException {
//							PreparedStatement pStmt = conn
//									.prepareStatement(queryString);
//							rs = pStmt.executeQuery();
//							while (rs.next()) {
//								System.out.println(rs.getDouble(1));
//								System.out.println(rs.getDouble(2));
//							}
//						}
//
//					});
//					return rs;
//				}
//
//			});
//			System.out.println(rs1);
			System.out.println("DONE");
			
		} finally {
			session.close();
		}
	}

}
