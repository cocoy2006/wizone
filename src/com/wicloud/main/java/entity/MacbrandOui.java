package com.wicloud.main.java.entity;

/**
 * MacbrandOui entity. @author MyEclipse Persistence Tools
 */

public class MacbrandOui extends com.wicloud.main.java.entity.BaseEntity
		implements java.io.Serializable {

	// Fields

	private MacbrandOuiId id;

	// Constructors

	/** default constructor */
	public MacbrandOui() {
	}

	/** full constructor */
	public MacbrandOui(MacbrandOuiId id) {
		this.id = id;
	}

	// Property accessors

	public MacbrandOuiId getId() {
		return this.id;
	}

	public void setId(MacbrandOuiId id) {
		this.id = id;
	}

}