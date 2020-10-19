package com.frogs.matzip.user;

import org.apache.ibatis.annotations.Mapper;

import com.frogs.matzip.user.model.UserDMI;
import com.frogs.matzip.user.model.UserPARAM;
import com.frogs.matzip.user.model.UserVO;

@Mapper
public interface UserMapper {
int insUser(UserVO param);
	
UserDMI selUser(UserPARAM param);
}
