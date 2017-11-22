package com.wicloud.main.java.entity;

import java.util.HashSet;
import java.util.Set;

/**
 * Groupindex entity. @author MyEclipse Persistence Tools
 */

public class Groupindex extends com.wicloud.main.java.entity.BaseEntity
		implements java.io.Serializable {

	// Fields

	private Integer groupid;
	private String groupname;
	
	private Set monindexes = new HashSet(0);
	private Set heatmaps = new HashSet(0);
	private Set realtimedatains = new HashSet(0);
	// Constructors

	/** default constructor */
	public Groupindex() {
	}

	/** minimal constructor */

	public Groupindex(Integer groupid, String groupname,Set monindexes,Set heatmaps) {
		
		this.groupid = groupid;
		this.groupname = groupname;
		this.monindexes = monindexes;
		this.heatmaps=heatmaps;
	}
	public Integer getGroupid() {
		return groupid;
	}
	
	public void setGroupid(Integer groupid) {
		this.groupid = groupid;
	}

	public String getGroupname() {
		return groupname;
	}

	public void setGroupname(String groupname) {
		this.groupname = groupname;
	}

	public Set getMonindexes() {
		return this.monindexes;
	}

	public void setMonindexes(Set monindexes) {
		this.monindexes = monindexes;
	}
	public Set getHeatmaps() {
		return this.heatmaps;
	}

	public void setHeatmaps(Set heatmaps) {
		this.heatmaps = heatmaps;
	}
	public Set getRealtimedatains() {
		return this.realtimedatains;
	}

	public void setRealtimedatains(Set realtimedatains) {
		this.realtimedatains = realtimedatains;
	}
}
