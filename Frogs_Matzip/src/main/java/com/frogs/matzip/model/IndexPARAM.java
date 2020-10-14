package com.frogs.matzip.model;

import org.apache.ibatis.type.Alias;

@Alias("IndexPARAM")
public class IndexPARAM extends IndexVO {
	private String msg;

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}
	
}
