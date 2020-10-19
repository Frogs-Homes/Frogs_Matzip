package com.frogs.matzip.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.frogs.matzip.rest.model.RestDMI;
import com.frogs.matzip.rest.model.RestPARAM;

@Service
public class RestService {
	@Autowired
	private RestMapper mapper;
	
	public List<RestDMI> selCategoryList() {
		return mapper.selCategoryList();
	}
	
	public int insRest(RestPARAM param) {
		return mapper.insRest(param);
	}
}
