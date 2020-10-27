package com.frogs.matzip.rest.model;

import org.apache.ibatis.type.Alias;

@Alias("RestReviewVO")
public class RestReviewVO {
	private int i_user;
	private int i_rest;
	private int grade;
	private String ctnt;
	
	public int getI_user() {
		return i_user;
	}
	public void setI_user(int i_user) {
		this.i_user = i_user;
	}
	public int getI_rest() {
		return i_rest;
	}
	public void setI_rest(int i_rest) {
		this.i_rest = i_rest;
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
