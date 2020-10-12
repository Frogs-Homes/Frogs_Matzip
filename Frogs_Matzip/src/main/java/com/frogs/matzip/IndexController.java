package com.frogs.matzip;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class IndexController {
	
	@RequestMapping(value="/index", method = RequestMethod.GET)
	public String Index(Model model) {
		model.addAttribute(Const.CSS, new String[] {"common", "index"});
		model.addAttribute(Const.TITLE, "FrogsMatzip");
		model.addAttribute(Const.VIEW, "index");
		return ViewRef.INDEX_TEMP;
	}
}