package com.wicloud.main.java.entity;

/**
 * MacbrandOuiId entity. @author MyEclipse Persistence Tools
 */

public class MacbrandOuiId extends com.wicloud.main.java.entity.BaseEntity
		implements java.io.Serializable {

	// Fields

	private String mac;
	private String brand;

	// Constructors

	/** default constructor */
	public MacbrandOuiId() {
	}

	/** full constructor */
	public MacbrandOuiId(String mac, String brand) {
		this.mac = mac;
		this.brand = brand;
	}

	// Property accessors

	public String getMac() {
		return this.mac;
	}

	public void setMac(String mac) {
		this.mac = mac;
	}

	public String getBrand() {
		return this.brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof MacbrandOuiId))
			return false;
		MacbrandOuiId castOther = (MacbrandOuiId) other;

		return ((this.getMac() == castOther.getMac()) || (this.getMac() != null
				&& castOther.getMac() != null && this.getMac().equals(
				castOther.getMac())))
				&& ((this.getBrand() == castOther.getBrand()) || (this
						.getBrand() != null
						&& castOther.getBrand() != null && this.getBrand()
						.equals(castOther.getBrand())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result
				+ (getMac() == null ? 0 : this.getMac().hashCode());
		result = 37 * result
				+ (getBrand() == null ? 0 : this.getBrand().hashCode());
		return result;
	}

}