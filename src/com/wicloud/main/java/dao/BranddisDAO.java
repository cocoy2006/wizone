package com.wicloud.main.java.dao;

import java.sql.Date;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.wicloud.main.java.entity.Branddis;

/**
 * A data access object (DAO) providing persistence and search support for
 * Branddis entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.wicloud.main.java.entity.Branddis
 * @author MyEclipse Persistence Tools
 */

@Repository
public class BranddisDAO extends BaseHibernateDAO {
	private static final Logger log = LoggerFactory
			.getLogger(BranddisDAO.class);
	// property constants
	public static final String COUNTER = "counter";
	public static final String CKNOWN = "cknown";
	public static final String CUNKNOWN = "cunknown";
	public static final String APPLE = "apple";
	public static final String SAMSUNG = "samsung";
	public static final String XIAOMI = "xiaomi";
	public static final String HTC = "htc";
	public static final String HUAWEI = "huawei";
	public static final String MURATA = "murata";
	public static final String INTEL = "intel";
	public static final String HONHAI = "honhai";
	public static final String NOKIA = "nokia";
	public static final String LENOVO = "lenovo";
	public static final String LITEON = "liteon";
	public static final String SONY = "sony";
	public static final String MEIZU = "meizu";
	public static final String INPRO = "inpro";
	public static final String LG = "lg";
	public static final String AZURE_WAVE = "azureWave";
	public static final String OPPO = "oppo";
	public static final String ZTE = "zte";
	public static final String BBK = "bbk";
	public static final String ARRIS = "arris";
	public static final String COOLPAD = "coolpad";
	public static final String ASUS = "asus";
	public static final String GIONEE = "gionee";
	public static final String TP_LINK = "tpLink";
	public static final String _KTOUCH = "KTouch";
	public static final String AC_SI_P = "acSiP";
	public static final String ASIA_PACIFIC = "asiaPacific";
	public static final String CHI_MEI = "chiMei";
	public static final String FOXCONN = "foxconn";
	public static final String GARMIN = "garmin";
	public static final String GEMTEK = "gemtek";
	public static final String MEDIA_TEK = "mediaTek";
	public static final String QUALCOMM = "qualcomm";
	public static final String HISENSE = "hisense";
	public static final String ROVING = "roving";
	public static final String SIMCOM = "simcom";
	public static final String SHARP = "sharp";
	public static final String WISOL = "wisol";
	public static final String WISTRON = "wistron";
	public static final String AMOI = "amoi";
	public static final String BIRD = "bird";
	public static final String PHILIPS = "philips";
	public static final String TCL = "tcl";
	public static final String OTHER = "other";
	public static final String VIVO = "vivo";
	public static final String LETV = "leTv";

	@Autowired
	private HibernateTemplate hibernateTemplate;

	public void save(Branddis transientInstance) {
		log.debug("saving Branddis instance");
		try {
			hibernateTemplate.save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Branddis persistentInstance) {
		log.debug("deleting Branddis instance");
		try {
			hibernateTemplate.delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Branddis findById(com.wicloud.main.java.entity.BranddisId id) {
		log.debug("getting Branddis instance with id: " + id);
		try {
			Branddis instance = (Branddis) hibernateTemplate.get(
					"com.wicloud.main.java.entity.Branddis", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding Branddis instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Branddis as model where model."
					+ propertyName + "= ?";
			return hibernateTemplate.find(queryString, value);
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByCounter(Object counter) {
		return findByProperty(COUNTER, counter);
	}

	public List findByCknown(Object cknown) {
		return findByProperty(CKNOWN, cknown);
	}

	public List findByCunknown(Object cunknown) {
		return findByProperty(CUNKNOWN, cunknown);
	}

	public List findByApple(Object apple) {
		return findByProperty(APPLE, apple);
	}

	public List findBySamsung(Object samsung) {
		return findByProperty(SAMSUNG, samsung);
	}

	public List findByXiaomi(Object xiaomi) {
		return findByProperty(XIAOMI, xiaomi);
	}

	public List findByHtc(Object htc) {
		return findByProperty(HTC, htc);
	}

	public List findByHuawei(Object huawei) {
		return findByProperty(HUAWEI, huawei);
	}

	public List findByMurata(Object murata) {
		return findByProperty(MURATA, murata);
	}

	public List findByIntel(Object intel) {
		return findByProperty(INTEL, intel);
	}

	public List findByHonhai(Object honhai) {
		return findByProperty(HONHAI, honhai);
	}

	public List findByNokia(Object nokia) {
		return findByProperty(NOKIA, nokia);
	}

	public List findByLenovo(Object lenovo) {
		return findByProperty(LENOVO, lenovo);
	}

	public List findByLiteon(Object liteon) {
		return findByProperty(LITEON, liteon);
	}

	public List findBySony(Object sony) {
		return findByProperty(SONY, sony);
	}

	public List findByMeizu(Object meizu) {
		return findByProperty(MEIZU, meizu);
	}

	public List findByInpro(Object inpro) {
		return findByProperty(INPRO, inpro);
	}

	public List findByLg(Object lg) {
		return findByProperty(LG, lg);
	}

	public List findByAzureWave(Object azureWave) {
		return findByProperty(AZURE_WAVE, azureWave);
	}

	public List findByOppo(Object oppo) {
		return findByProperty(OPPO, oppo);
	}

	public List findByZte(Object zte) {
		return findByProperty(ZTE, zte);
	}

	public List findByBbk(Object bbk) {
		return findByProperty(BBK, bbk);
	}

	public List findByArris(Object arris) {
		return findByProperty(ARRIS, arris);
	}

	public List findByCoolpad(Object coolpad) {
		return findByProperty(COOLPAD, coolpad);
	}

	public List findByAsus(Object asus) {
		return findByProperty(ASUS, asus);
	}

	public List findByGionee(Object gionee) {
		return findByProperty(GIONEE, gionee);
	}

	public List findByTpLink(Object tpLink) {
		return findByProperty(TP_LINK, tpLink);
	}

	public List findByKTouch(Object KTouch) {
		return findByProperty(_KTOUCH, KTouch);
	}

	public List findByAcSiP(Object acSiP) {
		return findByProperty(AC_SI_P, acSiP);
	}

	public List findByAsiaPacific(Object asiaPacific) {
		return findByProperty(ASIA_PACIFIC, asiaPacific);
	}

	public List findByChiMei(Object chiMei) {
		return findByProperty(CHI_MEI, chiMei);
	}

	public List findByFoxconn(Object foxconn) {
		return findByProperty(FOXCONN, foxconn);
	}

	public List findByGarmin(Object garmin) {
		return findByProperty(GARMIN, garmin);
	}

	public List findByGemtek(Object gemtek) {
		return findByProperty(GEMTEK, gemtek);
	}

	public List findByMediaTek(Object mediaTek) {
		return findByProperty(MEDIA_TEK, mediaTek);
	}

	public List findByQualcomm(Object qualcomm) {
		return findByProperty(QUALCOMM, qualcomm);
	}

	public List findByHisense(Object hisense) {
		return findByProperty(HISENSE, hisense);
	}

	public List findByRoving(Object roving) {
		return findByProperty(ROVING, roving);
	}

	public List findBySimcom(Object simcom) {
		return findByProperty(SIMCOM, simcom);
	}

	public List findBySharp(Object sharp) {
		return findByProperty(SHARP, sharp);
	}

	public List findByWisol(Object wisol) {
		return findByProperty(WISOL, wisol);
	}

	public List findByWistron(Object wistron) {
		return findByProperty(WISTRON, wistron);
	}

	public List findByAmoi(Object amoi) {
		return findByProperty(AMOI, amoi);
	}

	public List findByBird(Object bird) {
		return findByProperty(BIRD, bird);
	}

	public List findByPhilips(Object philips) {
		return findByProperty(PHILIPS, philips);
	}

	public List findByTcl(Object tcl) {
		return findByProperty(TCL, tcl);
	}

	public List findByOther(Object other) {
		return findByProperty(OTHER, other);
	}
	
	public List findByVovo(Object vivo) {
		return findByProperty(VIVO, vivo);
	}
	
	public List findByLeTv(Object leTv) {
		return findByProperty(LETV, leTv);
	}

	public List findAll() {
		log.debug("finding all Branddis instances");
		try {
			return hibernateTemplate.loadAll(Branddis.class);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public List<Object[]> findAvgBranddis(String start, String finish) {
		log.debug("finding avg all brand from Branddis with" 
				+ " start: " + start + ", finish: " + finish);
		
		try {
			DetachedCriteria criteria = DetachedCriteria.forClass(Branddis.class);
			criteria.add(Restrictions.between("id.time", Date.valueOf(start), Date.valueOf(finish)));
			ProjectionList projection = Projections.projectionList();
			projection.add(Projections.avg("counter")).add(Projections.avg("apple"))
				.add(Projections.avg("samsung")).add(Projections.avg("nokia"))
				.add(Projections.avg("sony")).add(Projections.avg("zte"))
				.add(Projections.avg("huawei")).add(Projections.avg("asus"))
				.add(Projections.avg("intel")).add(Projections.avg("honhai"))
				.add(Projections.avg("htc")).add(Projections.avg("xiaomi"))
				.add(Projections.avg("oppo")).add(Projections.avg("lg"))
				.add(Projections.avg("lenovo")).add(Projections.avg("meizu"))
				.add(Projections.avg("coolpad")).add(Projections.avg("bbk"))
				.add(Projections.avg("tp_link")).add(Projections.avg("gionee"))
				.add(Projections.avg("murata")).add(Projections.avg("inpro"))
				.add(Projections.avg("AzureWave")).add(Projections.avg("liteon"))
				.add(Projections.avg("arris")).add(Projections.avg("K_Touch"))
				.add(Projections.avg("AcSiP")).add(Projections.avg("AsiaPacific"))
				.add(Projections.avg("ChiMei")).add(Projections.avg("Foxconn"))
				.add(Projections.avg("Garmin")).add(Projections.avg("Gemtek"))
				.add(Projections.avg("MediaTek")).add(Projections.avg("Qualcomm"))
				.add(Projections.avg("Hisense")).add(Projections.avg("Roving"))
				.add(Projections.avg("Simcom")).add(Projections.avg("SHARP"))
				.add(Projections.avg("Wisol")).add(Projections.avg("Wistron"))
				.add(Projections.avg("Amoi")).add(Projections.avg("BIRD"))
				.add(Projections.avg("Philips")).add(Projections.avg("TCL"))
				.add(Projections.avg("vivo")).add(Projections.avg("leTv"));
			criteria.setProjection(projection);
			return hibernateTemplate.findByCriteria(criteria);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
	public List<Object[]> findSumBranddis(String start, String finish) {
		log.debug("finding avg all brand from Branddis with"
				+ " start: " + start + ", finish: " + finish);
		try {
			DetachedCriteria criteria = DetachedCriteria.forClass(Branddis.class);
			criteria.add(Restrictions.between("id.time", Date.valueOf(start), Date.valueOf(finish)));
			ProjectionList projection = Projections.projectionList();
			projection.add(Projections.sum("counter")).add(Projections.sum("apple"))
				.add(Projections.sum("samsung")).add(Projections.sum("nokia"))
				.add(Projections.sum("sony")).add(Projections.sum("zte"))
				.add(Projections.sum("huawei")).add(Projections.sum("asus"))
				.add(Projections.sum("intel")).add(Projections.sum("honhai"))
				.add(Projections.sum("htc")).add(Projections.sum("xiaomi"))
				.add(Projections.sum("oppo")).add(Projections.sum("lg"))
				.add(Projections.sum("lenovo")).add(Projections.sum("meizu"))
				.add(Projections.sum("coolpad")).add(Projections.sum("bbk"))
				.add(Projections.sum("tp_link")).add(Projections.sum("gionee"))
				.add(Projections.sum("murata")).add(Projections.sum("inpro"))
				.add(Projections.sum("AzureWave")).add(Projections.sum("liteon"))
				.add(Projections.sum("arris")).add(Projections.sum("K_Touch"))
				.add(Projections.sum("AcSiP")).add(Projections.sum("AsiaPacific"))
				.add(Projections.sum("ChiMei")).add(Projections.sum("Foxconn"))
				.add(Projections.sum("Garmin")).add(Projections.sum("Gemtek"))
				.add(Projections.sum("MediaTek")).add(Projections.sum("Qualcomm"))
				.add(Projections.sum("Hisense")).add(Projections.sum("Roving"))
				.add(Projections.sum("Simcom")).add(Projections.sum("SHARP"))
				.add(Projections.sum("Wisol")).add(Projections.sum("Wistron"))
				.add(Projections.sum("Amoi")).add(Projections.sum("BIRD"))
				.add(Projections.sum("Philips")).add(Projections.sum("TCL"))
				.add(Projections.sum("vivo")).add(Projections.sum("leTv"));
			criteria.setProjection(projection);
			return hibernateTemplate.findByCriteria(criteria);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
}