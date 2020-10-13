package com.frogs.matzip;

import org.apache.ibatis.annotations.Mapper;

import com.frogs.matzip.model.IndexVO;

@Mapper
public interface IndexMapper {
	int insUser(IndexVO param);
}
