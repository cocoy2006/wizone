package com.wicloud.main.java.entity;

/**
 * RealtimedataInId entity. @author MyEclipse Persistence Tools
 */

public class RealtimedataInId extends com.wicloud.main.java.entity.BaseEntity
		implements java.io.Serializable {

	// Fields

	private Integer monTime;
	private Integer traffic;
	private Groupindex groupindex;

	// Constructors

	/** default constructor */
	public RealtimedataInId() {
	}

	/** full constructor */
	public RealtimedataInId(Integer monTime, Integer traffic, Groupindex groupindex) {
		this.monTime = monTime;
		this.traffic = traffic;
		this.groupindex = groupindex;
	}

	// Property accessors

	public Integer getMonTime() {
		return this.monTime;
	}

	public void setMonTime(Integer monTime) {
		this.monTime = monTime;
	}

	public Integer getTraffic() {
		return this.traffic;
	}

	public void setTraffic(Integer traffic) {
		this.traffic = traffic;
	}

	public Groupindex getGroupindex() {
		return this.groupindex;
	}

	public void setGroupindex(Groupindex groupindex) {
		this.groupindex = groupindex;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof RealtimedataInId))
			return false;
		RealtimedataInId castOther = (RealtimedataInId) other;

		return ((this.getMonTime() == castOther.getMonTime()) || (this
				.getMonTime() != null
				&& castOther.getMonTime() != null && this.getMonTime().equals(
				castOther.getMonTime())))
				&& ((this.getTraffic() == castOther.getTraffic()) || (this
						.getTraffic() != null
						&& castOther.getTraffic() != null && this.getTraffic()
						.equals(castOther.getTraffic())))
				&& ((this.getGroupindex() == castOther.getGroupindex()) || (this
						.getGroupindex() != null
						&& castOther.getGroupindex() != null && this
						.getGroupindex().equals(castOther.getGroupindex())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result
				+ (getMonTime() == null ? 0 : this.getMonTime().hashCode());
		result = 37 * result
				+ (getTraffic() == null ? 0 : this.getTraffic().hashCode());
		result = 37 * result
				+ (getGroupindex() == null ? 0 : this.getGroupindex().hashCode());
		return result;
	}

}