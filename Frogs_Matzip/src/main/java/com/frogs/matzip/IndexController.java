package com.frogs.matzip;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.frogs.matzip.rest.RestService;

@Controller
public class IndexController {
	
	@Autowired
	private RestService rService;
	
	@RequestMapping(value="/index", method = RequestMethod.GET)
	public String Index(HttpServletRequest req, Model model) {
		if(Const.realPath == null) {
			Const.realPath = req.getSession().getServletContext().getRealPath("");
			System.out.println(Const.realPath);
		}
		
		// 인기 식당, 카테고리별 식당 리스트 뿌리기 해야 함
		model.addAttribute("recRestList", rService.selRecRestList());
		
		model.addAttribute(Const.CSS, new String[] {"common", "index", "indexheader"});
		model.addAttribute(Const.TITLE, "FrogsMatzip");
		model.addAttribute(Const.HEADER, "template/index_header");
		model.addAttribute(Const.VIEW, "index");
		return ViewRef.TEMP;
	}
}