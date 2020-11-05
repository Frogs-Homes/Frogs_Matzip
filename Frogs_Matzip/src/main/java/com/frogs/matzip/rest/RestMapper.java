package com.frogs.matzip.rest;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.frogs.matzip.rest.model.RestDMI;
import com.frogs.matzip.rest.model.RestFoodVO;
import com.frogs.matzip.rest.model.RestPARAM;
import com.frogs.matzip.rest.model.RestReviewVO;
import com.frogs.matzip.rest.model.RestVO;

@Mapper
public interface RestMapper {
	int insRest(RestVO param);
	int insFoodMenu(RestFoodVO param);
	int insReview(RestReviewVO param);
	
	RestDMI selRest(RestPARAM param);
	List<RestDMI> selRecRestList();
	List<RestDMI> selCategoryList();
	List<RestDMI> selDistrictList();
	List<RestDMI> selRestList(RestPARAM param);
	List<RestFoodVO> selFoodPicList(RestPARAM param);
	List<RestDMI> selReviewList(RestPARAM param);
	RestDMI selReviewCount(RestReviewVO param);
	
	int updRestMenu(RestVO param);
	int updReview(RestReviewVO param);
	
	int delReview(RestReviewVO param);
}
