package com.wicloud.main.java.entity;

import java.util.Date;

// default package

/**
 * GoAndCome entity. @author MyEclipse Persistence Tools
 */

public class GoAndCome implements java.io.Serializable {

	// Fields

	private Integer id;
	private Date time;
	private Integer comeIn;
	private Integer goOut;
	private String gateId;

	// Constructors

	/** default constructor */
	public GoAndCome() {
	}

	/** minimal constructor */
	public GoAndCome(Integer id) {
		this.id = id;
	}

	/** full constructor */
	public GoAndCome(Integer id, Date time,Integer comeIn, Integer goOut, String gateId) {
		this.id = id;
		this.time=time;
		this.comeIn = comeIn;
		this.goOut = goOut;
		this.gateId = gateId;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	public Date getTime(){
		return this.time;
	}
	public void setTime(Date time){
		this.time=time;
	}
	public Integer getComeIn() {
		return this.comeIn;
	}

	public void setComeIn(Integer comeIn) {
		this.comeIn = comeIn;
	}

	public Integer getGoOut() {
		return this.goOut;
	}

	public void setGoOut(Integer goOut) {
		this.goOut = goOut;
	}

	public String getGateId() {
		return this.gateId;
	}

	public void setGateId(String gateId) {
		this.gateId = gateId;
	}

}