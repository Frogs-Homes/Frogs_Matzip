package com.frogs.matzip;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.frogs.matzip.model.IndexVO;

@Service
public class IndexService {
	@Autowired
	private IndexMapper mapper;
	
	public int ajaxJoin(IndexVO param) {
		return mapper.ajaxJoin(param);
	}
}
