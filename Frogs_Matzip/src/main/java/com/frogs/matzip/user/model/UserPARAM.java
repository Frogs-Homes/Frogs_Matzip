package com.frogs.matzip.user.model;

import org.apache.ibatis.type.Alias;

@Alias("UserPARAM")
public class UserPARAM extends UserVO {
	private String msg;

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}
}
