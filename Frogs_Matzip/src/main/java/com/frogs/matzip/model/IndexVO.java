package com.frogs.matzip.model;

import org.apache.ibatis.type.Alias;

@Alias("IndexVO")
public class IndexVO {
	private String search_place;

	public String getSearch_place() {
		return search_place;
	}

	public void setSearch_place(String search_place) {
		this.search_place = search_place;
	}
	
}
