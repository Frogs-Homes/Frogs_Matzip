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
	private String sql_search_text;
	private int seq;
	private int i_user;
	private int s_idx;
	private int e_idx;
	private int review_cnt;
	
	
	
	public int getS_idx() {
		return s_idx;
	}
	public void setS_idx(int s_idx) {
		this.s_idx = s_idx;
	}
	public int getE_idx() {
		return e_idx;
	}
	public void setE_idx(int e_idx) {
		this.e_idx = e_idx;
	}
	public int getReview_cnt() {
		return review_cnt;
	}
	public void setReview_cnt(int reivew_cnt) {
		this.review_cnt = reivew_cnt;
	}

	public int getI_user() {
		return i_user;
	}

	public void setI_user(int i_user) {
		this.i_user = i_user;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getSql_search_text() {
		return sql_search_text;
	}

	public void setSql_search_text(String sql_search_text) {
		this.sql_search_text = sql_search_text;
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
