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
	private Integer groupId;
	private Integer dayTraffic;
	private Integer monTime;
	
	public TrafficToday(Integer id) {
		super();
		this.id = id;
	}

	public TrafficToday(Integer dayTraffic, Integer monTime) {
		super();
		this.dayTraffic = dayTraffic;
		this.monTime = monTime;
	}

	public TrafficToday(Integer id, Integer groupId, Integer dayTraffic,
			Integer monTime) {
		super();
		this.id = id;
		this.groupId = groupId;
		this.dayTraffic = dayTraffic;
		this.monTime = monTime;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getGroupId() {
		return groupId;
	}

	public void setGroupId(Integer groupId) {
		this.groupId = groupId;
	}

	public Integer getDayTraffic() {
		return dayTraffic;
	}

	public void setDayTraffic(Integer dayTraffic) {
		this.dayTraffic = dayTraffic;
	}

	public Integer getMonTime() {
		return monTime;
	}

	public void setMonTime(Integer monTime) {
		this.monTime = monTime;
	}
   
}

