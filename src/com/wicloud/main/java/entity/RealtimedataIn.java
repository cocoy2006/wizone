package com.wicloud.main.java.entity;

/**
 * RealtimedataIn entity. @author MyEclipse Persistence Tools
 */

public class RealtimedataIn extends com.wicloud.main.java.entity.BaseEntity
		implements java.io.Serializable {

	// Fields

	private RealtimedataInId id;
	private Groupindex groupindex;

	// Constructors

	/** default constructor */
	public RealtimedataIn() {
	}

	/** minimal constructor */
	public RealtimedataIn(RealtimedataInId id) {
		this.id = id;
	}

	/** full constructor */
	public RealtimedataIn(RealtimedataInId id, Groupindex groupindex) {
		this.id = id;
		this.groupindex = groupindex;
	}

	// Property accessors

	public RealtimedataInId getId() {
		return this.id;
	}

	public void setId(RealtimedataInId id) {
		this.id = id;
	}

	public Groupindex getGroupindex() {
		return this.groupindex;
	}

	public void setGroupindex(Groupindex groupindex) {
		this.groupindex = groupindex;
	}

}