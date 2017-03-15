package com.wicloud.main.java.entity;

/**
 * Branddis entity. @author MyEclipse Persistence Tools
 */

public class Branddis extends com.wicloud.main.java.entity.BaseEntity implements
		java.io.Serializable {

	// Fields

	private BranddisId id;
	private Double counter;
	private Double cKnown;
	private Double cUnknown;
	private Double apple;
	private Double samsung;
	private Double xiaomi;
	private Double htc;
	private Double huawei;
	private Double murata;
	private Double intel;
	private Double honhai;
	private Double nokia;
	private Double lenovo;
	private Double liteon;
	private Double sony;
	private Double meizu;
	private Double inpro;
	private Double lg;
	private Double AzureWave;
	private Double oppo;
	private Double zte;
	private Double bbk;
	private Double arris;
	private Double coolpad;
	private Double asus;
	private Double gionee;
	private Double tp_link;
	private Double K_Touch;
	private Double AcSiP;
	private Double AsiaPacific;
	private Double ChiMei;
	private Double Foxconn;
	private Double Garmin;
	private Double Gemtek;
	private Double MediaTek;
	private Double Qualcomm;
	private Double Hisense;
	private Double Roving;
	private Double Simcom;
	private Double SHARP;
	private Double Wisol;
	private Double Wistron;
	private Double Amoi;
	private Double BIRD;
	private Double Philips;
	private Double TCL;
	private Double other;

	// Constructors

	/** default constructor */
	public Branddis() {
	}

	/** minimal constructor */
	public Branddis(BranddisId id) {
		this.id = id;
	}

	/** full constructor */
	public Branddis(BranddisId id, Double counter, Double cknown,
			Double cunknown, Double apple, Double samsung, Double xiaomi,
			Double htc, Double huawei, Double murata, Double intel,
			Double honhai, Double nokia, Double lenovo, Double liteon,
			Double sony, Double meizu, Double inpro, Double lg,
			Double azureWave, Double oppo, Double zte, Double bbk,
			Double arris, Double coolpad, Double asus, Double gionee,
			Double tpLink, Double KTouch, Double acSiP, Double asiaPacific,
			Double chiMei, Double foxconn, Double garmin, Double gemtek,
			Double mediaTek, Double qualcomm, Double hisense, Double roving,
			Double simcom, Double sharp, Double wisol, Double wistron,
			Double amoi, Double bird, Double philips, Double tcl, Double other) {
		this.id = id;
		this.counter = counter;
		this.cKnown = cknown;
		this.cUnknown = cunknown;
		this.apple = apple;
		this.samsung = samsung;
		this.xiaomi = xiaomi;
		this.htc = htc;
		this.huawei = huawei;
		this.murata = murata;
		this.intel = intel;
		this.honhai = honhai;
		this.nokia = nokia;
		this.lenovo = lenovo;
		this.liteon = liteon;
		this.sony = sony;
		this.meizu = meizu;
		this.inpro = inpro;
		this.lg = lg;
		this.AzureWave = azureWave;
		this.oppo = oppo;
		this.zte = zte;
		this.bbk = bbk;
		this.arris = arris;
		this.coolpad = coolpad;
		this.asus = asus;
		this.gionee = gionee;
		this.tp_link = tpLink;
		this.K_Touch = KTouch;
		this.AcSiP = acSiP;
		this.AsiaPacific = asiaPacific;
		this.ChiMei = chiMei;
		this.Foxconn = foxconn;
		this.Garmin = garmin;
		this.Gemtek = gemtek;
		this.MediaTek = mediaTek;
		this.Qualcomm = qualcomm;
		this.Hisense = hisense;
		this.Roving = roving;
		this.Simcom = simcom;
		this.SHARP = sharp;
		this.Wisol = wisol;
		this.Wistron = wistron;
		this.Amoi = amoi;
		this.BIRD = bird;
		this.Philips = philips;
		this.TCL = tcl;
		this.other = other;
	}

	// Property accessors

	public BranddisId getId() {
		return this.id;
	}

	public void setId(BranddisId id) {
		this.id = id;
	}

	public Double getCounter() {
		return this.counter;
	}

	public void setCounter(Double counter) {
		this.counter = counter;
	}

	/**
	 * @return the cKnown
	 */
	public Double getcKnown() {
		return cKnown;
	}

	/**
	 * @param cKnown the cKnown to set
	 */
	public void setcKnown(Double cKnown) {
		this.cKnown = cKnown;
	}

	/**
	 * @return the cUnknown
	 */
	public Double getcUnknown() {
		return cUnknown;
	}

	/**
	 * @param cUnknown the cUnknown to set
	 */
	public void setcUnknown(Double cUnknown) {
		this.cUnknown = cUnknown;
	}

	/**
	 * @return the apple
	 */
	public Double getApple() {
		return apple;
	}

	/**
	 * @param apple the apple to set
	 */
	public void setApple(Double apple) {
		this.apple = apple;
	}

	/**
	 * @return the samsung
	 */
	public Double getSamsung() {
		return samsung;
	}

	/**
	 * @param samsung the samsung to set
	 */
	public void setSamsung(Double samsung) {
		this.samsung = samsung;
	}

	/**
	 * @return the xiaomi
	 */
	public Double getXiaomi() {
		return xiaomi;
	}

	/**
	 * @param xiaomi the xiaomi to set
	 */
	public void setXiaomi(Double xiaomi) {
		this.xiaomi = xiaomi;
	}

	/**
	 * @return the htc
	 */
	public Double getHtc() {
		return htc;
	}

	/**
	 * @param htc the htc to set
	 */
	public void setHtc(Double htc) {
		this.htc = htc;
	}

	/**
	 * @return the huawei
	 */
	public Double getHuawei() {
		return huawei;
	}

	/**
	 * @param huawei the huawei to set
	 */
	public void setHuawei(Double huawei) {
		this.huawei = huawei;
	}

	/**
	 * @return the murata
	 */
	public Double getMurata() {
		return murata;
	}

	/**
	 * @param murata the murata to set
	 */
	public void setMurata(Double murata) {
		this.murata = murata;
	}

	/**
	 * @return the intel
	 */
	public Double getIntel() {
		return intel;
	}

	/**
	 * @param intel the intel to set
	 */
	public void setIntel(Double intel) {
		this.intel = intel;
	}

	/**
	 * @return the honhai
	 */
	public Double getHonhai() {
		return honhai;
	}

	/**
	 * @param honhai the honhai to set
	 */
	public void setHonhai(Double honhai) {
		this.honhai = honhai;
	}

	/**
	 * @return the nokia
	 */
	public Double getNokia() {
		return nokia;
	}

	/**
	 * @param nokia the nokia to set
	 */
	public void setNokia(Double nokia) {
		this.nokia = nokia;
	}

	/**
	 * @return the lenovo
	 */
	public Double getLenovo() {
		return lenovo;
	}

	/**
	 * @param lenovo the lenovo to set
	 */
	public void setLenovo(Double lenovo) {
		this.lenovo = lenovo;
	}

	/**
	 * @return the liteon
	 */
	public Double getLiteon() {
		return liteon;
	}

	/**
	 * @param liteon the liteon to set
	 */
	public void setLiteon(Double liteon) {
		this.liteon = liteon;
	}

	/**
	 * @return the sony
	 */
	public Double getSony() {
		return sony;
	}

	/**
	 * @param sony the sony to set
	 */
	public void setSony(Double sony) {
		this.sony = sony;
	}

	/**
	 * @return the meizu
	 */
	public Double getMeizu() {
		return meizu;
	}

	/**
	 * @param meizu the meizu to set
	 */
	public void setMeizu(Double meizu) {
		this.meizu = meizu;
	}

	/**
	 * @return the inpro
	 */
	public Double getInpro() {
		return inpro;
	}

	/**
	 * @param inpro the inpro to set
	 */
	public void setInpro(Double inpro) {
		this.inpro = inpro;
	}

	/**
	 * @return the lg
	 */
	public Double getLg() {
		return lg;
	}

	/**
	 * @param lg the lg to set
	 */
	public void setLg(Double lg) {
		this.lg = lg;
	}

	/**
	 * @return the azureWave
	 */
	public Double getAzureWave() {
		return AzureWave;
	}

	/**
	 * @param azureWave the azureWave to set
	 */
	public void setAzureWave(Double azureWave) {
		AzureWave = azureWave;
	}

	/**
	 * @return the oppo
	 */
	public Double getOppo() {
		return oppo;
	}

	/**
	 * @param oppo the oppo to set
	 */
	public void setOppo(Double oppo) {
		this.oppo = oppo;
	}

	/**
	 * @return the zte
	 */
	public Double getZte() {
		return zte;
	}

	/**
	 * @param zte the zte to set
	 */
	public void setZte(Double zte) {
		this.zte = zte;
	}

	/**
	 * @return the bbk
	 */
	public Double getBbk() {
		return bbk;
	}

	/**
	 * @param bbk the bbk to set
	 */
	public void setBbk(Double bbk) {
		this.bbk = bbk;
	}

	/**
	 * @return the arris
	 */
	public Double getArris() {
		return arris;
	}

	/**
	 * @param arris the arris to set
	 */
	public void setArris(Double arris) {
		this.arris = arris;
	}

	/**
	 * @return the coolpad
	 */
	public Double getCoolpad() {
		return coolpad;
	}

	/**
	 * @param coolpad the coolpad to set
	 */
	public void setCoolpad(Double coolpad) {
		this.coolpad = coolpad;
	}

	/**
	 * @return the asus
	 */
	public Double getAsus() {
		return asus;
	}

	/**
	 * @param asus the asus to set
	 */
	public void setAsus(Double asus) {
		this.asus = asus;
	}

	/**
	 * @return the gionee
	 */
	public Double getGionee() {
		return gionee;
	}

	/**
	 * @param gionee the gionee to set
	 */
	public void setGionee(Double gionee) {
		this.gionee = gionee;
	}

	/**
	 * @return the tp_link
	 */
	public Double getTp_link() {
		return tp_link;
	}

	/**
	 * @param tpLink the tp_link to set
	 */
	public void setTp_link(Double tpLink) {
		tp_link = tpLink;
	}

	/**
	 * @return the k_Touch
	 */
	public Double getK_Touch() {
		return K_Touch;
	}

	/**
	 * @param kTouch the k_Touch to set
	 */
	public void setK_Touch(Double kTouch) {
		K_Touch = kTouch;
	}

	/**
	 * @return the acSiP
	 */
	public Double getAcSiP() {
		return AcSiP;
	}

	/**
	 * @param acSiP the acSiP to set
	 */
	public void setAcSiP(Double acSiP) {
		AcSiP = acSiP;
	}

	/**
	 * @return the asiaPacific
	 */
	public Double getAsiaPacific() {
		return AsiaPacific;
	}

	/**
	 * @param asiaPacific the asiaPacific to set
	 */
	public void setAsiaPacific(Double asiaPacific) {
		AsiaPacific = asiaPacific;
	}

	/**
	 * @return the chiMei
	 */
	public Double getChiMei() {
		return ChiMei;
	}

	/**
	 * @param chiMei the chiMei to set
	 */
	public void setChiMei(Double chiMei) {
		ChiMei = chiMei;
	}

	/**
	 * @return the foxconn
	 */
	public Double getFoxconn() {
		return Foxconn;
	}

	/**
	 * @param foxconn the foxconn to set
	 */
	public void setFoxconn(Double foxconn) {
		Foxconn = foxconn;
	}

	/**
	 * @return the garmin
	 */
	public Double getGarmin() {
		return Garmin;
	}

	/**
	 * @param garmin the garmin to set
	 */
	public void setGarmin(Double garmin) {
		Garmin = garmin;
	}

	/**
	 * @return the gemtek
	 */
	public Double getGemtek() {
		return Gemtek;
	}

	/**
	 * @param gemtek the gemtek to set
	 */
	public void setGemtek(Double gemtek) {
		Gemtek = gemtek;
	}

	/**
	 * @return the mediaTek
	 */
	public Double getMediaTek() {
		return MediaTek;
	}

	/**
	 * @param mediaTek the mediaTek to set
	 */
	public void setMediaTek(Double mediaTek) {
		MediaTek = mediaTek;
	}

	/**
	 * @return the qualcomm
	 */
	public Double getQualcomm() {
		return Qualcomm;
	}

	/**
	 * @param qualcomm the qualcomm to set
	 */
	public void setQualcomm(Double qualcomm) {
		Qualcomm = qualcomm;
	}

	/**
	 * @return the hisense
	 */
	public Double getHisense() {
		return Hisense;
	}

	/**
	 * @param hisense the hisense to set
	 */
	public void setHisense(Double hisense) {
		Hisense = hisense;
	}

	/**
	 * @return the roving
	 */
	public Double getRoving() {
		return Roving;
	}

	/**
	 * @param roving the roving to set
	 */
	public void setRoving(Double roving) {
		Roving = roving;
	}

	/**
	 * @return the simcom
	 */
	public Double getSimcom() {
		return Simcom;
	}

	/**
	 * @param simcom the simcom to set
	 */
	public void setSimcom(Double simcom) {
		Simcom = simcom;
	}

	/**
	 * @return the sHARP
	 */
	public Double getSHARP() {
		return SHARP;
	}

	/**
	 * @param sHARP the sHARP to set
	 */
	public void setSHARP(Double sHARP) {
		SHARP = sHARP;
	}

	/**
	 * @return the wisol
	 */
	public Double getWisol() {
		return Wisol;
	}

	/**
	 * @param wisol the wisol to set
	 */
	public void setWisol(Double wisol) {
		Wisol = wisol;
	}

	/**
	 * @return the wistron
	 */
	public Double getWistron() {
		return Wistron;
	}

	/**
	 * @param wistron the wistron to set
	 */
	public void setWistron(Double wistron) {
		Wistron = wistron;
	}

	/**
	 * @return the amoi
	 */
	public Double getAmoi() {
		return Amoi;
	}

	/**
	 * @param amoi the amoi to set
	 */
	public void setAmoi(Double amoi) {
		Amoi = amoi;
	}

	/**
	 * @return the bIRD
	 */
	public Double getBIRD() {
		return BIRD;
	}

	/**
	 * @param bIRD the bIRD to set
	 */
	public void setBIRD(Double bIRD) {
		BIRD = bIRD;
	}

	/**
	 * @return the philips
	 */
	public Double getPhilips() {
		return Philips;
	}

	/**
	 * @param philips the philips to set
	 */
	public void setPhilips(Double philips) {
		Philips = philips;
	}

	/**
	 * @return the tCL
	 */
	public Double getTCL() {
		return TCL;
	}

	/**
	 * @param tCL the tCL to set
	 */
	public void setTCL(Double tCL) {
		TCL = tCL;
	}

	/**
	 * @return the other
	 */
	public Double getOther() {
		return other;
	}

	/**
	 * @param other the other to set
	 */
	public void setOther(Double other) {
		this.other = other;
	}

}