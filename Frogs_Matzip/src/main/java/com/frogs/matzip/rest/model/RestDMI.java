package com.frogs.matzip.rest.model;

import org.apache.ibatis.type.Alias;

@Alias("RestDMI")
public class RestDMI extends RestVO {
	private String category_val;
	private String district_val;
	
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
