package com.frogs.matzip.rest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.frogs.matzip.Const;
import com.frogs.matzip.ViewRef;

@Controller
@RequestMapping("/rest")
public class RestController {
	@RequestMapping(value="/listMap", method = RequestMethod.GET)
	public String listMap(Model model) {
		model.addAttribute(Const.CSS, new String[] {"common", "listmap","defaultheader"});
		model.addAttribute(Const.TITLE, "맛집 리스트");
		model.addAttribute(Const.VIEW, "/rest/list_map");
		return ViewRef.DEFAULT_TEMP;
	}
}
