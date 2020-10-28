package com.frogs.matzip.rest.model;

import org.apache.ibatis.type.Alias;

@Alias("RestReviewVO")
public class RestReviewVO extends RestVO{
	private int grade;
	private String ctnt;
	private int i_user;
	
	
	public int getI_user() {
		return i_user;
	}
	public void setI_user(int i_user) {
		this.i_user = i_user;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public String getCtnt() {
		return ctnt;
	}
	public void setCtnt(String ctnt) {
		this.ctnt = ctnt;
	}
	
}
