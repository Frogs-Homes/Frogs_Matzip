package com.frogs.matzip.rest;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

import com.frogs.matzip.rest.model.RestDMI;
import com.frogs.matzip.rest.model.RestVO;

@Mapper
public interface RestMapper {
	int insRest(RestVO param);
	
	List<RestDMI> selRecRestList();
	List<RestDMI> selCategoryList();
}
