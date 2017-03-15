package com.wicloud.main.java.entity;

/**
 * Activity entity. @author MyEclipse Persistence Tools
 */

public class Activity extends com.wicloud.main.java.entity.BaseEntity implements
java.io.Serializable {


    // Fields    
	 private String type;
	 private Integer monTime;
     private Double activity;

    // Constructors

    /** default constructor */
    public Activity() {
    }

	
    
    /** full constructor */
    public Activity(String type,Double activity, Integer monTime) {
    	this.type=type;
        this.activity = activity;
        this.monTime = monTime;
    }
    public String getType() {
        return this.type;
    }
    
    public void setType(String type) {
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
