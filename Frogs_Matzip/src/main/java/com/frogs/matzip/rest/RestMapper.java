package com.frogs.matzip.rest;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.frogs.matzip.rest.model.RestDMI;

@Mapper
public interface RestMapper {
	List<RestDMI> selCategoryList();
}
