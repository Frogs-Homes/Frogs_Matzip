package com.frogs.matzip.rest.model;

import org.apache.ibatis.type.Alias;

@Alias("RestDMI")
public class RestDMI extends RestVO {
	private String category_val;
	private String district_val;
	private int i_user;
	private int seq;
	private int grade;
	
	
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public int getI_user() {
		return i_user;
	}
	public void setI_user(int i_user) {
		this.i_user = i_user;
	}
	public String getCategory_val() {
		return category_val;
	}
	public void setCategory_val(String category_val) {
		this.category_val = category_val;
	}
	public String getDistrict_val() {
		return district_val;
	}
	public void setDistrict_val(String district_val) {
		this.district_val = district_val;
	}
}
