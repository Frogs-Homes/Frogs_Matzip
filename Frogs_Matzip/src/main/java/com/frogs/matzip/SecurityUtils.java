package com.frogs.matzip;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;

import com.frogs.matzip.model.IndexVO;

public class SecurityUtils {
	
	
	public static int getLoginUserPk(HttpServletRequest request) {
		return getLoginUserPk(request.getSession());
	}
	
	public static int getLoginUserPk(HttpSession hs) {
		IndexVO loginUser = (IndexVO)hs.getAttribute(Const.LOGIN_USER);
		
		return loginUser == null ? 0 : loginUser.getI_user();
	}
	
	public static IndexVO getLoginUser(HttpServletRequest request) {
		HttpSession hs = request.getSession();
		return (IndexVO)hs.getAttribute(Const.LOGIN_USER);
	}
	
	public static boolean isLogout(HttpServletRequest request) {
		return getLoginUser(request) == null;
	}
	
	public static String generateSalt() {
		return BCrypt.gensalt();
	}
	
	public static String getEncrypt(String pw, String salt) {
		return BCrypt.hashpw(pw, salt);
	}
}
