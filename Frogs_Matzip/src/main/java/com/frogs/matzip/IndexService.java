package com.frogs.matzip;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.frogs.matzip.model.IndexDMI;
import com.frogs.matzip.model.IndexPARAM;
import com.frogs.matzip.model.IndexVO;

@Service
public class IndexService {
	@Autowired
	private IndexMapper mapper;
	
	public int ajaxJoin(IndexVO param) {
		String pw = param.getUser_pw();
		String salt = SecurityUtils.generateSalt();
		String cryptPw = SecurityUtils.getEncrypt(pw, salt);
		
		param.setSalt(salt);
		param.setUser_pw(cryptPw);
		
		return mapper.insUser(param);
	}
	
	//1: 로그인 성공 2: 아이디없음 3: 비밀번호틀림 
	public int login(IndexPARAM param) {
		if(param.getUser_id().equals("")) { return Const.NO_ID; }
		
		IndexDMI dbUser = mapper.selUser(param);
		
		if(dbUser==null) { return Const.NO_ID; }
		
		String cryptPw = SecurityUtils.getEncrypt(param.getUser_pw(), dbUser.getSalt());
		
		if(!cryptPw.equals(dbUser.getUser_pw())) { return Const.NO_PW; }
		
		param.setI_user(dbUser.getI_user());
		param.setUser_pw(null);
		param.setNm(dbUser.getNm());
		param.setProfile_img(dbUser.getProfile_img());

		return Const.SUCCESS;
	}
}
