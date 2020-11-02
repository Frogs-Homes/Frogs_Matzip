package com.frogs.matzip.user;

import org.apache.ibatis.annotations.Mapper;

import com.frogs.matzip.user.model.UserDMI;
import com.frogs.matzip.user.model.UserPARAM;
import com.frogs.matzip.user.model.UserVO;

@Mapper
public interface UserMapper {
	public int insUser(UserVO param);
	public int insFavorite(UserPARAM param);
	
	public UserDMI selUser(UserPARAM param);
	
	public int delFavorite(UserPARAM param);
}
