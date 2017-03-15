package com.wicloud.main.java.entity;

/**
 * Activity entity. @author MyEclipse Persistence Tools
 */

public class Activityinday extends com.wicloud.main.java.entity.BaseEntity implements
java.io.Serializable {


    // Fields    
	 private Integer type;
	 private Integer monTime;
     private Double activity;

    // Constructors

    /** default constructor */
    public Activityinday() {
    }

	
    
    /** full constructor */
    public Activityinday(Integer monTime,Integer type,Double activity) {
    	this.type=type;
        this.activity = activity;
        this.monTime = monTime;
    }
    public Integer getType() {
        return this.type;
    }
    
    public void setType(Integer type) {
        this.type=type;
    }
   
    public Double getActivity() {
        return this.activity;
    }
    
    public void setActivity(Double activity) {
        this.activity = activity;
    }

    public Integer getMonTime() {
        return this.monTime;
    }
    
    public void setMonTime(Integer monTime) {
        this.monTime = monTime;
    }
}
