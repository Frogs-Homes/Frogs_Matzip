package com.frogs.matzip.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.frogs.matzip.Const;
import com.frogs.matzip.SecurityUtils;
import com.frogs.matzip.user.model.UserDMI;
import com.frogs.matzip.user.model.UserPARAM;
import com.frogs.matzip.user.model.UserVO;

@Service
public class UserService {
	@Autowired
	private UserMapper mapper;
	
	public int ajaxJoin(UserVO param) {
		String pw = param.getUser_pw();
		String salt = SecurityUtils.generateSalt();
		String cryptPw = SecurityUtils.getEncrypt(pw, salt);
		
		param.setSalt(salt);
		param.setUser_pw(cryptPw);
		
		return mapper.insUser(param);
	}
	
	//1: 로그인 성공 2: 아이디없음 3: 비밀번호틀림 
	public int login(UserPARAM param) {
		if(param.getUser_id().equals("")) { return Const.NO_ID; }
		
		UserDMI dbUser = mapper.selUser(param);
		
		if(dbUser==null) { return Const.NO_ID; }
		
		String cryptPw = SecurityUtils.getEncrypt(param.getUser_pw(), dbUser.getSalt());
		
		if(!cryptPw.equals(dbUser.getUser_pw())) { return Const.NO_PW; }
		
		param.setI_user(dbUser.getI_user());
		param.setUser_pw(null);
		param.setNm(dbUser.getNm());
		param.setProfile_img(dbUser.getProfile_img());
		param.setAdmin(dbUser.getAdmin());

		return Const.SUCCESS;
	}
}
