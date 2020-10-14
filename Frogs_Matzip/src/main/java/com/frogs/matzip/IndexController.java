package com.frogs.matzip;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
		
		model.addAttribute(Const.CSS, new String[] {"common", "index"});
		model.addAttribute(Const.TITLE, "FrogsMatzip");
		model.addAttribute(Const.VIEW, "index");
		return ViewRef.INDEX_TEMP;
	}
	
	@RequestMapping(value="/ajaxJoin", produces = {"application/json; charset=UTF-8"})
	@ResponseBody
	public int ajaxJoin(IndexVO param, HttpSession hs) {
		int result = service.ajaxJoin(param);
		
		if(result != 1) {
			// 메시지 session에 박아야만 하는지 아니면 다른데에 박을 수 있는지 ajax라서 잘 모르겠음 다시 확인 요망
			hs.setAttribute(Const.MSG, "문제가 발생했습니다.");
		}
		
		return result;
	}
	
}