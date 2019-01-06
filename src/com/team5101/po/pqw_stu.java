package com.team5101.po;

public class pqw_stu {
	private Integer id;
	private String sname;
	private String sno;
	private Integer sgrade;
	
	public Integer getId() {
	    return id;
	}



	public void setId(Integer id) {
	    this.id = id;
	}



	public String getSname() {
	    return sname;
	}



	public void setSname(String sname) {
	    this.sname = sname;
	}



	public String getSno() {
	    return sno;
	}



	public void setSno(String sno) {
	    this.sno = sno;
	}



	public Integer getSgrade() {
	    return sgrade;
	}



	public void setSgrade(Integer sgrade) {
	    this.sgrade = sgrade;
	}



	@Override
	public String toString() {
		return "pqw_stu[id = "+id+", name = "+sname+", sno = "
				+ ""+sno+", grade = "+sgrade+"]";
	}
}
