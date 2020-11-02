package com.frogs.matzip.user.model;

import org.apache.ibatis.type.Alias;

@Alias("UserPARAM")
public class UserPARAM extends UserVO {
	private String msg;
	private String fav_type;
	private int i_rest;

	
	public int getI_rest() {
		return i_rest;
	}

	public void setI_rest(int i_rest) {
		this.i_rest = i_rest;
	}

	public String getFav_type() {
		return fav_type;
	}

	public void setFav_type(String fav_type) {
		this.fav_type = fav_type;
	}

	public String getMsg() {
		return msg;
	}
	
	public void setMsg(String msg) {
		this.msg = msg;
	}
}
