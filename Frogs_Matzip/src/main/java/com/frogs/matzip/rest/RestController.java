package com.frogs.matzip.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.frogs.matzip.Const;
import com.frogs.matzip.ViewRef;

import com.frogs.matzip.model.IndexVO;
import com.frogs.matzip.rest.model.RestDMI;
import com.frogs.matzip.rest.model.RestPARAM;


@Controller
@RequestMapping("/rest")
public class RestController {
	@Autowired
	private RestService service;
	
	@RequestMapping(value="/listMap", method = RequestMethod.GET)
	public String listMap(IndexVO vo, Model model) {
		model.addAttribute(Const.CSS, new String[] {"common", "defaultheader","listmap"});
		model.addAttribute(Const.TITLE, "맛집 리스트");
		model.addAttribute(Const.HEADER, "/template/default_header");
		model.addAttribute(Const.VIEW, "/rest/list_map");
		model.addAttribute(Const.PLACE, vo);
		return ViewRef.TEMP;
	}
	
	@RequestMapping(value="/reg", method = RequestMethod.GET)
	public String restReg(Model model) {
		model.addAttribute("categoryList", service.selCategoryList());
		
		model.addAttribute(Const.CSS, new String[] {"common", "defaultheader","restreg"});
		model.addAttribute(Const.TITLE, "맛집 등록");
		model.addAttribute(Const.HEADER, "/template/default_header");
		model.addAttribute(Const.VIEW, "/rest/rest_reg");
		return ViewRef.TEMP;
	}
	
	@RequestMapping(value="/reg", method = RequestMethod.POST)
	public String restReg(RestPARAM param, RedirectAttributes ra) {
		
		int result = Const.SUCCESS;
		try {
			service.insRestTran(param);
		} catch(Exception e) {
			result = Const.FAIL;
		}
		
		if (result == Const.SUCCESS) {
			ra.addFlashAttribute(Const.MSG, "등록 성공");
		} else {
			ra.addFlashAttribute(Const.MSG, "등록 실패");
		}
		return "redirect:/rest/reg";
	}
	
	@RequestMapping(value="/detail", method = RequestMethod.GET)
	public String restDeail(RestPARAM param, Model model) {
		// detail 데이터값 select해서 addAttribute하기
		RestDMI data = service.selRest(param);
		
		model.addAttribute("data", data);
		model.addAttribute(Const.CSS, new String[] {"common", "defaultheader","restdetail"});
		model.addAttribute(Const.TITLE, "Detail");
		model.addAttribute(Const.HEADER, "/template/default_header");
		model.addAttribute(Const.VIEW, "/rest/rest_detail");
		return ViewRef.TEMP;
	}
	
	@RequestMapping(value="/regFood")
	public String restRegFood(Model model) {
		model.addAttribute(Const.CSS, new String[] {"common", "defaultheader","restregfood"});
		model.addAttribute(Const.TITLE, "음식사진등록");
		model.addAttribute(Const.HEADER, "/template/default_header");
		model.addAttribute(Const.VIEW, "/rest/rest_reg_food");
//		model.addAttribute(i_rest 넣어야만..);
		return ViewRef.TEMP;
	}
	
	@RequestMapping(value="/ajaxGetList", produces = {"application/json; charset=UTF-8"})
	@ResponseBody
	public List<RestDMI> ajaxGetList(RestPARAM param) {
		System.out.println("sw_lat : " + param.getSw_lat());
		System.out.println("sw_lng : " + param.getSw_lng());
		System.out.println("ne_lat : " + param.getNe_lat());
		System.out.println("ne_lng : " + param.getNe_lng());
		
		return service.selRestList(param);
	}
}
