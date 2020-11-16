package com.frogs.matzip;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.frogs.matzip.rest.RestService;
import com.frogs.matzip.rest.model.RestPARAM;

@Controller
public class IndexController {
	
	@Autowired
	private RestService rService;
	
	@RequestMapping(value="/main", method = RequestMethod.GET)
	public String Index(RestPARAM param, HttpServletRequest req, Model model) {
		if(Const.realPath == null) {
			Const.realPath = req.getSession().getServletContext().getRealPath("");
			System.out.println(Const.realPath);
		}

		model.addAttribute("recRestList", rService.selRecRestList(param));
		
		model.addAttribute(Const.CSS, new String[] {Const.COMMON, Const.INDEX, Const.INDEXHEADER, Const.SLICK});	
		model.addAttribute(Const.JS, new String[] {Const.USERMENU, Const.SEARCHBAR, Const.SLICKMIN});
		model.addAttribute(Const.TITLE, "FrogsMatzip");
		model.addAttribute(Const.HEADER, "template/index_header");
		model.addAttribute(Const.VIEW, "main");
		return ViewRef.TEMP;
	}
	
	@RequestMapping(value="/mypage", method = RequestMethod.GET)
	public String MyPage(RestPARAM param, HttpServletRequest req, Model model) {
		

		model.addAttribute(Const.VIEW, "mypage");
		return ViewRef.TEMP;
	}
}