package com.frogs.matzip.rest.model;

import java.util.List;

import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;

@Alias("RestRecMenuVO")
public class RestRecMenuVO {
	private int i_rest;
	private int seq;
	private String food_pic;
	
	public int getI_rest() {
		return i_rest;
	}
	public void setI_rest(int i_rest) {
		this.i_rest = i_rest;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getFood_pic() {
		return food_pic;
	}
	public void setFood_pic(String food_pic) {
		this.food_pic = food_pic;
	}

	
	
	
	
	
}
