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
	
	@RequestMapping(value="/index", method = RequestMethod.GET)
	public String Index(RestPARAM param, HttpServletRequest req, Model model) {
		if(Const.realPath == null) {
			Const.realPath = req.getSession().getServletContext().getRealPath("");
			System.out.println(Const.realPath);
		}

		model.addAttribute("placeList", rService.selRestList(param));
		model.addAttribute("recRestList", rService.selRecRestList(param));
		
		model.addAttribute(Const.CSS, new String[] {"common", "index", "indexheader"});
		model.addAttribute(Const.JS, new String[] {"search", "usermenu"});
		model.addAttribute(Const.TITLE, "FrogsMatzip");
		model.addAttribute(Const.HEADER, "template/index_header");
		model.addAttribute(Const.VIEW, "index");
		return ViewRef.TEMP;
	}
}