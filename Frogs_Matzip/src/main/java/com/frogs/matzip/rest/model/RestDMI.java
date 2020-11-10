package com.frogs.matzip.rest.model;

import org.apache.ibatis.type.Alias;

@Alias("RestDMI")
public class RestDMI extends RestVO {
	private String category_val;
	private String district_val;
	private int i_user;
	private int seq;
	private int grade;
	private int review_cnt;
	private int is_favorite;
	private int fav_cnt;
	private double avg_grade;
	private String open_time;
	private String close_time;
	private String food_pic;
	private int sIdx;
	private int reivew_cnt;
	
	
	
	public int getsIdx() {
		return sIdx;
	}
	public void setsIdx(int sIdx) {
		this.sIdx = sIdx;
	}
	public int getReivew_cnt() {
		return reivew_cnt;
	}
	public void setReivew_cnt(int reivew_cnt) {
		this.reivew_cnt = reivew_cnt;
	}
	public String getFood_pic() {
		return food_pic;
	}
	public void setFood_pic(String food_pic) {
		this.food_pic = food_pic;
	}
	public String getOpen_time() {
		return open_time;
	}
	public void setOpen_time(String open_time) {
		this.open_time = open_time;
	}
	public String getClose_time() {
		return close_time;
	}
	public void setClose_time(String close_time) {
		this.close_time = close_time;
	}
	public double getAvg_grade() {
		return avg_grade;
	}
	public void setAvg_grade(double avg_grade) {
		this.avg_grade = avg_grade;
	}
	public int getFav_cnt() {
		return fav_cnt;
	}
	public void setFav_cnt(int fav_cnt) {
		this.fav_cnt = fav_cnt;
	}
	public int getIs_favorite() {
		return is_favorite;
	}
	public void setIs_favorite(int is_favorite) {
		this.is_favorite = is_favorite;
	}
	public int getReview_cnt() {
		return review_cnt;
	}
	public void setReview_cnt(int review_cnt) {
		this.review_cnt = review_cnt;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public int getI_user() {
		return i_user;
	}
	public void setI_user(int i_user) {
		this.i_user = i_user;
	}
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
