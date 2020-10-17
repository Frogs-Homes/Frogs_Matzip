package com.frogs.matzip.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.frogs.matzip.Const;
import com.frogs.matzip.ViewRef;

@Controller
@RequestMapping("/rest")
public class RestController {
	@Autowired
	private RestService service;
	
	@RequestMapping(value="/listMap", method = RequestMethod.GET)
	public String listMap(Model model) {
		model.addAttribute(Const.CSS, new String[] {"common", "defaultheader","listmap"});
		model.addAttribute(Const.TITLE, "맛집 리스트");
		model.addAttribute(Const.VIEW, "/rest/list_map");
		return ViewRef.DEFAULT_TEMP;
	}
	
	@RequestMapping(value="/reg", method = RequestMethod.GET)
	public String restReg(Model model) {
		model.addAttribute("categoryList", service.selCategoryList());
		
		model.addAttribute(Const.CSS, new String[] {"common", "defaultheader","restreg"});
		model.addAttribute(Const.TITLE, "맛집 등록");
		model.addAttribute(Const.VIEW, "/rest/rest_reg");
		return ViewRef.DEFAULT_TEMP;
	}
}
