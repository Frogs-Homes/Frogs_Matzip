package com.frogs.matzip.rest;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

import com.frogs.matzip.rest.model.RestDMI;
import com.frogs.matzip.rest.model.RestVO;
import com.frogs.matzip.rest.model.RestPARAM;

@Mapper
public interface RestMapper {
	int insRest(RestVO param);
	
	RestDMI selRest(RestPARAM param);
	RestDMI selRestMaxPk();
	List<RestDMI> selRecRestList();
	List<RestDMI> selCategoryList();
	
	int updRestMenu(RestVO param);
}
