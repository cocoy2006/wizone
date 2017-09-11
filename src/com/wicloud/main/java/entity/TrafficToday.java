package com.wicloud.main.java.entity;

/**
 * TrafficToday entity. @author zhaox
 */

public class TrafficToday extends com.wicloud.main.java.entity.BaseEntity implements
java.io.Serializable {

    /**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 7365289858006426658L;
	
	// Fields    
	private Integer id;
	private Integer groupid;
	private Integer daytraffic;
	private Integer monTime;
	
	public TrafficToday() {
		super();
	}

	public TrafficToday(Integer daytraffic, Integer monTime) {
		super();
		this.daytraffic = daytraffic;
		this.monTime = monTime;
	}

	public TrafficToday(Integer id, Integer groupid, Integer daytraffic,
			Integer monTime) {
		super();
		this.id = id;
		this.groupid = groupid;
		this.daytraffic = daytraffic;
		this.monTime = monTime;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getGroupid() {
		return groupid;
	}

	public void setGroupid(Integer groupid) {
		this.groupid = groupid;
	}

	public Integer getDaytraffic() {
		return daytraffic;
	}

	public void setDaytraffic(Integer daytraffic) {
		this.daytraffic = daytraffic;
	}

	public Integer getMonTime() {
		return monTime;
	}

	public void setMonTime(Integer monTime) {
		this.monTime = monTime;
	}
	
	
	
	
	
}

