package com.frogs.matzip.rest;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

import com.frogs.matzip.rest.model.RestDMI;
import com.frogs.matzip.rest.model.RestVO;

@Mapper
public interface RestMapper {
	List<RestDMI> selCategoryList();
	int insRest(RestVO param);
}
