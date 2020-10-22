package com.frogs.matzip.rest.model;

import org.apache.ibatis.type.Alias;

@Alias("RestDMI")
public class RestDMI extends RestVO {
	private String val;

	
	public String getVal() {
		return val;
	}

	public void setVal(String val) {
		this.val = val;
	}
}
