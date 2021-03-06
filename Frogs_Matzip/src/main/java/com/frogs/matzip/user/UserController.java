package com.frogs.matzip.user;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.frogs.matzip.Const;
import com.frogs.matzip.user.model.UserPARAM;
import com.frogs.matzip.user.model.UserVO;
import com.frogs.matzip.SecurityUtils;
import com.frogs.matzip.ViewRef;
import com.frogs.matzip.rest.RestService;
import com.frogs.matzip.rest.model.RestPARAM;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserService service;
	
	@Autowired
	private RestService rservice;
	
	@RequestMapping(value="/mypage", method = RequestMethod.GET)
	public String myPage(Model model) {
	
		model.addAttribute(Const.CSS, new String[] {Const.COMMON, Const.DEFAULTHEADER, Const.MYPAGE});
		model.addAttribute(Const.JS, new String[] {Const.USERMENU, Const.SEARCHBAR});
		model.addAttribute(Const.TITLE, "마이 페이지");
		model.addAttribute(Const.HEADER, "/template/default_header");
		model.addAttribute(Const.VIEW, "/mypage");
		return ViewRef.TEMP;
	}
	
	@RequestMapping(value="/mypage", method = RequestMethod.POST)
	public String mypage(RestPARAM param, RedirectAttributes ra) {
		
		
		
		return "redirect:/rest/reg";
	}
	
	@RequestMapping(value="/logout", method = RequestMethod.GET) 
	public String logout(HttpSession hs) {
		hs.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping(value="/ajaxJoin", method = RequestMethod.POST)
	@ResponseBody
	public int ajaxJoin(@RequestBody UserVO param) {
		return service.ajaxJoin(param);
	}
	
	@RequestMapping(value="/ajaxCheckId", method = RequestMethod.POST)
	@ResponseBody
	
	public int ajaxCheckId(@RequestBody UserPARAM param) {
		return service.login(param);
	}
	
	@RequestMapping(value="ajaxLogin", method = RequestMethod.POST)
	@ResponseBody
	public int ajaxLogin(@RequestBody UserPARAM param, HttpSession hs) {
		int result = service.login(param);
		if(result == Const.SUCCESS) {
			hs.setAttribute(Const.LOGIN_USER, param);
		}
		return result;
	}
	
	@RequestMapping(value="/ajaxToggleFavorite", method=RequestMethod.GET)
	@ResponseBody
	public int ajaxToggleFavorite(UserPARAM param, HttpSession hs) {
		int i_user = SecurityUtils.getLoginUserPk(hs);
		if(i_user == 0) { return Const.FAIL; }
		param.setI_user(i_user);
		
		return service.ajaxToggleFavorite(param);
	}
	
}
