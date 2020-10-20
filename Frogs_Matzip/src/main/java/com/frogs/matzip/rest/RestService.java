package com.frogs.matzip.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.frogs.matzip.rest.model.RestDMI;
import com.frogs.matzip.rest.model.RestVO;

@Service
public class RestService {
	@Autowired
	private RestMapper mapper;
	
	@Transactional
	public void insRestTran(RestVO param) {
		mapper.insRest(param);
		mapper.selRestMaxPk();
		
		// 파일 저장
		
		mapper.updRestMenu(param);
	}
	
	public List<RestDMI> selRecRestList() {
		return mapper.selRecRestList();
	}
	
	public List<RestDMI> selCategoryList() {
		return mapper.selCategoryList();
	}
}
