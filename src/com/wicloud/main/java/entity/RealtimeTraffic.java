package com.wicloud.main.java.entity;

/**
 * RealtimeTraffic entity. @author zhaox
 */

public class RealtimeTraffic extends com.wicloud.main.java.entity.BaseEntity implements
java.io.Serializable {

    /**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 8805778240013855362L;
	
	// Fields    
	private Integer id;
	private Integer groupId;
    private Integer traffic;
    private Integer monTime;
    
	public RealtimeTraffic(Integer id) {
		super();
		this.id = id;
	}
	
	public RealtimeTraffic(Integer traffic, Integer monTime) {
		super();
		this.traffic = traffic;
		this.monTime = monTime;
	}

	public RealtimeTraffic(Integer id, Integer groupId, Integer traffic,
			Integer monTime) {
		super();
		this.id = id;
		this.groupId = groupId;
		this.traffic = traffic;
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
	public Integer getTraffic() {
		return traffic;
	}
	public void setTraffic(Integer traffic) {
		this.traffic = traffic;
	}
	public Integer getMonTime() {
		return monTime;
	}
	public void setMonTime(Integer monTime) {
		this.monTime = monTime;
	}
   
}


