package com.frogs.matzip;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.frogs.matzip.model.IndexPARAM;
import com.frogs.matzip.model.IndexVO;


@Controller
public class IndexController {
	
	@Autowired
	private IndexService service;
	
	@RequestMapping(value="/logout", method = RequestMethod.GET) 
	public String logout(HttpSession hs) {
		hs.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping(value="/index", method = RequestMethod.GET)
	public String Index(Model model) {
		// 인기 식당, 카테고리별 식당 리스트 뿌리기 해야 함
		model.addAttribute("recRestList", service.selRecRestList());
		
		model.addAttribute(Const.CSS, new String[] {"common", "index", "indexheader"});
		model.addAttribute(Const.TITLE, "FrogsMatzip");
		model.addAttribute(Const.HEADER, "template/index_header");
		model.addAttribute(Const.VIEW, "index");
		return ViewRef.TEMP;
	}
	
	@RequestMapping(value="/ajaxJoin", method = RequestMethod.POST)
	@ResponseBody
	public int ajaxJoin(@RequestBody IndexVO param) {
		return service.ajaxJoin(param);
	}
	
	@RequestMapping(value="/ajaxCheckId", method = RequestMethod.POST)
	@ResponseBody
	public int ajaxCheckId(@RequestBody IndexPARAM param) {
		return service.login(param);
	}
	
	@RequestMapping(value="ajaxLogin", method = RequestMethod.POST)
	@ResponseBody
	public int ajaxLogin(@RequestBody IndexPARAM param, HttpSession hs) {
		int result = service.login(param);
		if(result == Const.SUCCESS) {
			hs.setAttribute(Const.LOGIN_USER, param);
		}
		return result;
	}
	
	
}