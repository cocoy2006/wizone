package com.wicloud.main.java.entity;

/**
 * Activity entity. @author MyEclipse Persistence Tools
 */

public class RealGate extends com.wicloud.main.java.entity.BaseEntity implements
java.io.Serializable {


    // Fields    
	private Integer id;
	private Integer time;
    private String gateid;
    private Integer alldata;
    // Constructors

    /** default constructor */
    public RealGate() {
    }

    /** minimal constructor */
	public RealGate(Integer id) {
		this.id = id;
	}
    
	/** full constructor */
	public RealGate(Integer id,Integer time,String gateid,Integer alldata) {
		this.id = id;
		this.time=time;
		this.gateid=gateid;
		this.alldata=alldata;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getTime(){
		return this.time;
	}
	public void setTime(Integer time){
		this.time=time;
	}
	public String getGateid() {
		return this.gateid;
	}

	public void setGateid(String gateid) {
		this.gateid = gateid;
	}

	public Integer getAlldata() {
		return this.alldata;
	}

	public void setAlldata(Integer alldata) {
		this.alldata = alldata;
	}
}

