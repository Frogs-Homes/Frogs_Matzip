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
	
	// ajax 참고용
//	@RequestMapping(value="/ajaxGetList", produces = {"application/json; charset=UTF-8"}) //UTF-8 설정 하는 방법
//	@ResponseBody
//	public List<RestDMI> ajaxGetList(RestPARAM param, HttpSession hs) { //spring에 json라이브러리를 자동으로 받아져있음, 리턴으로 String으로 하지않고 List<RestDMI>할수있는 이유
//		System.out.println("sw_lat : " + param.getSw_lat());
//		System.out.println("sw_lng : " + param.getSw_lng());
//		System.out.println("ne_lat : " + param.getNe_lat());
//		System.out.println("ne_lng : " + param.getNe_lng());
//		
//		int i_user = SecurityUtils.getLoginUserPk(hs);
//		param.setI_user(i_user);
//		
//		return service.selRestList(param);
//	}
}