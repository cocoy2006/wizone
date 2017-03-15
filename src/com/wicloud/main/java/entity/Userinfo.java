package com.wicloud.main.java.entity;

import java.util.HashSet;
import java.util.Set;

/**
 * Userinfo entity. @author MyEclipse Persistence Tools
 */

public class Userinfo extends com.wicloud.main.java.entity.BaseEntity implements
		java.io.Serializable {

	// Fields

	private String userName;
	private Integer id;
	private String passwd;
	private String userType;
	private String contract;
	// Constructors

	/** default constructor */
	public Userinfo() {
	}

	/** minimal constructor */
	public Userinfo(String userName, String passwd, String userType) {
		this.userName = userName;
		this.passwd = passwd;
		this.userType = userType;
	}

	/** full constructor */
	public Userinfo(String userName, Integer id, String passwd,String userType, String contract) {
		this.userName = userName;
		this.id = id;
		this.passwd = passwd;
		this.userType = userType;
		this.contract = contract;
	}

	// Property accessors

	public String getUserName() {
		return this.userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getPasswd() {
		return this.passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getUserType() {
		return this.userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public String getContract() {
		return this.contract;
	}

	public void setContract(String contract) {
		this.contract = contract;
	}
}