package com.frogs.matzip.rest.model;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class RestFoodFile {
	private int i_rest;
	private List<MultipartFile> food_list;
	
	public int getI_rest() {
		return i_rest;
	}
	public void setI_rest(int i_rest) {
		this.i_rest = i_rest;
	}
	public List<MultipartFile> getFood_list() {
		return food_list;
	}
	public void setFood_list(List<MultipartFile> food_list) {
		this.food_list = food_list;
	}
}
