package com.wicloud.main.java.entity;

import java.util.HashSet;
import java.util.Set;

/**
 * Monindex entity. @author MyEclipse Persistence Tools
 */

public class Monindex extends com.wicloud.main.java.entity.BaseEntity implements
		java.io.Serializable {

	// Fields

	private String monid;
	private Groupindex groupindex;
	private String monModle;
	private String monAdd;
	private String wallType;
	private Integer wallExp;
	private Integer wallDis;
	private String monname;
	private Integer groupid;
	private Integer total;
	private Double lng;
	private Double lat;
	private Double rssin;
	private Double rssout;
	
	private Set realtimedataIns = new HashSet(0);

	// Constructors

	/** default constructor */
	public Monindex() {
	}
	public Monindex(String monid, String monname) {
		this.monid = monid;
		this.monname = monname;
	}
	/** minimal constructor */
	public Monindex(String monid, Groupindex groupindex,String monname) {
		this.monid = monid;
		this.groupindex=groupindex;
		this.monname = monname;
	}

	/** full constructor */
	public Monindex(String monid, String monModle, String monAdd, String wallType, Integer wallExp, Integer wallDis,
			String monname, Groupindex groupindex, Integer total,Double lng,Double lat,Double rssin,Double rssout,Set realtimedataIns) {
		this.monid = monid;
		this.monModle = monModle;
		this.monAdd = monAdd;
		this.wallType = wallType;
		this.wallExp = wallExp;
		this.wallDis = wallDis;
		this.monname = monname;
		this.groupindex = groupindex;
		this.total = total;
		this.lng = lng;
		this.lat = lat;
		this.rssin = rssin;
		this.rssout = rssout;
		this.realtimedataIns = realtimedataIns;
	}

	// Property accessors

	public String getMonid() {
		return this.monid;
	}

	public void setMonid(String monid) {
		this.monid = monid;
	}

	public String getMonModle() {
		return this.monModle;
	}

	public void setMonModle(String monModle) {
		this.monModle = monModle;
	}

	public String getMonAdd() {
		return this.monAdd;
	}

	public void setMonAdd(String monAdd) {
		this.monAdd = monAdd;
	}

	public String getWallType() {
		return this.wallType;
	}

	public void setWallType(String wallType) {
		this.wallType = wallType;
	}

	public Integer getWallExp() {
		return this.wallExp;
	}

	public void setWallExp(Integer wallExp) {
		this.wallExp = wallExp;
	}

	public Integer getWallDis() {
		return this.wallDis;
	}

	public void setWallDis(Integer wallDis) {
		this.wallDis = wallDis;
	}
	

	public String getMonname() {
		return this.monname;
	}

	public void setMonname(String monname) {
		this.monname = monname;
	}
	public Groupindex getGroupindex() {
		return this.groupindex;
	}
	public void setGroupindex(Groupindex groupindex) {
		this.groupindex = groupindex;
	}
	public Integer  getGroupid() {
		return this.groupid;
	}
	public void setGroupid(Integer groupid) {
		this.groupid = groupid;
	}

	public Integer getTotal() {
		return this.total;
	}

	public void setTotal(Integer total) {
		this.total = total;
	}
	
	public Double getLng() {
		return this.lng;
	}
	public void setLng(Double lng) {
		this.lng = lng;
	}
	public Double getLat() {
		return this.lat;
	}
	public void setLat(Double lat) {
		this.lat = lat;
	}
	public Double getRssin() {
		return this.rssin;
	}

	public void setRssin(Double rssin) {
		this.rssin = rssin;
	}
	public Double getRssout() {
		return this.rssout;
	}

	public void setRssout(Double rssout) {
		this.rssout = rssout;
	}
	
	public Set getRealtimedataIns() {
		return this.realtimedataIns;
	}

	public void setRealtimedataIns(Set realtimedataIns) {
		this.realtimedataIns = realtimedataIns;
	}

}