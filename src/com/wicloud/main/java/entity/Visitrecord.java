package com.wicloud.main.java.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * Visitrecord entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="visitrecord")
public class Visitrecord extends com.wicloud.main.java.entity.BaseEntity
		implements java.io.Serializable {

	// Fields

	private Integer id;
	private String mac;
	private Integer inTime;
	private Integer offTime;
	private Integer dwellTime;
	private String monid;

	// Constructors

	/** default constructor */
	public Visitrecord() {
	}

	/** full constructor */
	public Visitrecord(String mac, Integer inTime, Integer offTime,
			Integer dwellTime, String monid) {
		this.mac = mac;
		this.inTime = inTime;
		this.offTime = offTime;
		this.dwellTime = dwellTime;
		this.monid = monid;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getMac() {
		return this.mac;
	}

	public void setMac(String mac) {
		this.mac = mac;
	}

	public Integer getInTime() {
		return this.inTime;
	}

	public void setInTime(Integer inTime) {
		this.inTime = inTime;
	}

	public Integer getOffTime() {
		return this.offTime;
	}

	public void setOffTime(Integer offTime) {
		this.offTime = offTime;
	}

	public Integer getDwellTime() {
		return this.dwellTime;
	}

	public void setDwellTime(Integer dwellTime) {
		this.dwellTime = dwellTime;
	}

	public String getMonid() {
		return this.monid;
	}

	public void setMonid(String monid) {
		this.monid = monid;
	}

}