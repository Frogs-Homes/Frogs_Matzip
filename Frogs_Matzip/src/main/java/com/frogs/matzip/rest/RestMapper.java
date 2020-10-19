package com.frogs.matzip.rest;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.frogs.matzip.rest.model.RestDMI;
import com.frogs.matzip.rest.model.RestPARAM;

@Mapper
public interface RestMapper {
	List<RestDMI> selCategoryList();
	int insRest(RestPARAM param);
}
