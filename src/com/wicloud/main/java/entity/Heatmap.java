package com.wicloud.main.java.entity;


// default package



/**
 * HeatMap entity. @author MyEclipse Persistence Tools
 */

public class Heatmap  implements java.io.Serializable, Comparable<Heatmap> {


    // Fields    

     private Integer id;
     private Integer groupid;
     private Integer cnt;
     private Integer monTime;
     private Groupindex groupindex;
    // Constructors

    /** default constructor */
    public Heatmap() {
    }

    
    /** full constructor */
    public Heatmap(Integer id,Integer groupid,Integer cnt,Integer monTime,Groupindex groupindex) {
    	this.id=id;
    	this.groupid=groupid;
        this.cnt = cnt;
        this.monTime=monTime;
        this.groupindex=groupindex;
    }

   
    // Property accessors

    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getCnt() {
        return this.cnt;
    }
    
    public void setCnt(Integer cnt) {
        this.cnt = cnt;
    }
    public Integer getMonTime() {
        return this.monTime;
    }
    
    public void setMonTime(Integer monTime) {
        this.monTime = monTime;
    }
    public Integer getGroupid(){
    	return this.groupid;
    }
    
    public void setGroupid(Integer groupid){
    	this.groupid=groupid;
    }

	public Groupindex getGroupindex(){
    	return this.groupindex;
    }
    public void setGroupindex(Groupindex groupindex){
    	 this.groupindex=groupindex;
    }


	@Override
	public int compareTo(Heatmap o) {
		// TODO Auto-generated method stub
		int result = 0;
		if (this.monTime > o.monTime) {
			result = -1;
		} else if (this.monTime < o.monTime) {
			result = 1;
		} 
		return result;
	}
    
   








}