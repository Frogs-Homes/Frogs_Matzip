package com.frogs.matzip.rest.model;

import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;

@Alias("RestPARAM")
public class RestPARAM extends RestVO {
	private MultipartFile menu_pic_file;
	private double sw_lat;
	private double sw_lng;
	private double ne_lat;
	private double ne_lng;
	private String search_text;
	private String search_text_sql;

	
	public String getSearch_text_sql() {
		return search_text_sql;
	}

	public void setSearch_text_sql(String search_text_sql) {
		this.search_text_sql = search_text_sql;
	}

	public String getSearch_text() {
		return search_text;
	}

	public void setSearch_text(String search_text) {
		this.search_text = search_text;
	}

	public double getSw_lat() {
		return sw_lat;
	}

	public void setSw_lat(double sw_lat) {
		this.sw_lat = sw_lat;
	}

	public double getSw_lng() {
		return sw_lng;
	}

	public void setSw_lng(double sw_lng) {
		this.sw_lng = sw_lng;
	}

	public double getNe_lat() {
		return ne_lat;
	}

	public void setNe_lat(double ne_lat) {
		this.ne_lat = ne_lat;
	}

	public double getNe_lng() {
		return ne_lng;
	}

	public void setNe_lng(double ne_lng) {
		this.ne_lng = ne_lng;
	}

	public MultipartFile getMenu_pic_file() {
		return menu_pic_file;
	}

	public void setMenu_pic_file(MultipartFile menu_pic_file) {
		this.menu_pic_file = menu_pic_file;
	}
}
