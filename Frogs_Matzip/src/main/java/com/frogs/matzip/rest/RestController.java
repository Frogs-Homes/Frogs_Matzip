package com.frogs.matzip.rest;



import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.frogs.matzip.Const;
import com.frogs.matzip.SecurityUtils;
import com.frogs.matzip.ViewRef;
import com.frogs.matzip.rest.model.RestDMI;
import com.frogs.matzip.rest.model.RestFoodFile;
import com.frogs.matzip.rest.model.RestPARAM;
import com.frogs.matzip.rest.model.RestReviewVO;

@Controller
@RequestMapping("/rest")
public class RestController {
	@Autowired
	private RestService service;
	
	@RequestMapping(value="/theme", method = RequestMethod.GET)
	public String restTheme(RestPARAM param, Model model) {
		
		model.addAttribute(Const.CATEGORYLIST, service.selCategoryList());
		
		model.addAttribute(Const.CSS, new String[] {Const.COMMON, Const.DEFAULTHEADER, Const.RESTTHEME});
		model.addAttribute(Const.JS, new String[] {Const.USERMENU, Const.SEARCHBAR, Const.RESTTHEME});
		model.addAttribute(Const.TITLE, "테마별 맛집 목록");
		model.addAttribute(Const.HEADER, "/template/default_header");
		model.addAttribute(Const.VIEW, "/rest/rest_theme");
		
		return ViewRef.TEMP;
	}
	
	@RequestMapping(value="/listMap", method = RequestMethod.GET)
	public String listMap(RestPARAM param, Model model) {
		
		model.addAttribute(Const.CSS, new String[] {Const.COMMON, Const.DEFAULTHEADER,Const.LISTMAP});
		model.addAttribute(Const.JS, new String[] {Const.USERMENU, Const.SEARCHBAR, Const.SEARCHMAP});
		model.addAttribute(Const.TITLE, "맛집 리스트");
		model.addAttribute(Const.HEADER, "/template/default_header");
		model.addAttribute(Const.VIEW, "/rest/list_map");
		model.addAttribute(Const.PLACE, param.getSearch_text());
		return ViewRef.TEMP;
	}
	
	@RequestMapping(value="/reg", method = RequestMethod.GET)
	public String restReg(Model model) {
		model.addAttribute(Const.CATEGORYLIST, service.selCategoryList());
		model.addAttribute(Const.DISTRICTLIST, service.selDistrictList());
		
		model.addAttribute(Const.CSS, new String[] {Const.COMMON, Const.DEFAULTHEADER,Const.RESTREG});
		model.addAttribute(Const.JS, new String[] {Const.USERMENU, Const.SEARCHBAR});
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
	public String restDeail(RestPARAM param, Model model, HttpSession hs) {
		int i_user = SecurityUtils.getLoginUserPk(hs);
		param.setI_user(i_user);
		
		param.setS_idx(Const.SIDX);
		param.setE_idx(Const.REVIEWCNT);
		param.setReview_cnt(Const.REVIEWCNT);
		
		RestReviewVO vo = new RestReviewVO();
		vo.setI_rest(param.getI_rest());
		
		model.addAttribute("param", param);
		model.addAttribute("foodMenuList", service.selFoodPicList(param));
		model.addAttribute("reviewList", service.selReviewList(param));
		model.addAttribute("count", service.selReviewCount(vo)); //리뷰 총갯수
		
		model.addAttribute(Const.DATA, service.selRest(param));
		model.addAttribute(Const.CSS, new String[] {Const.COMMON, Const.DEFAULTHEADER, Const.RESTDETAIL});
		model.addAttribute(Const.JS, new String[] {Const.USERMENU, Const.SEARCHBAR, Const.RESTDETAIL});
		model.addAttribute(Const.TITLE, "가게 상세 페이지");
		model.addAttribute(Const.HEADER, "/template/default_header");
		model.addAttribute(Const.VIEW, "/rest/rest_detail");
		return ViewRef.TEMP;
	}
	
	
	@RequestMapping(value="/regFood", method = RequestMethod.GET)
	public String restRegFood(RestPARAM param, Model model) {
		RestDMI data = service.selRest(param);
		
		model.addAttribute(Const.DATA, data);
		model.addAttribute(Const.CSS, new String[] {Const.COMMON, Const.DEFAULTHEADER, Const.RESTREGFOOD});
		model.addAttribute(Const.JS, new String[] {Const.USERMENU, Const.SEARCHBAR});
		model.addAttribute(Const.TITLE, "음식사진 등록");
		model.addAttribute(Const.HEADER, "/template/default_header");
		model.addAttribute(Const.VIEW, "/rest/rest_regFood");

		return ViewRef.TEMP;
	}
	
	@RequestMapping(value="/regFood", method = RequestMethod.POST)
	public String detailReg(RestFoodFile param, RedirectAttributes ra){
		int i_rest = param.getI_rest();
		int result = Const.SUCCESS;
		try {
			service.insFoodPic(param);
		} catch(Exception e) {
			result = Const.FAIL;
		}
		
		if (result == Const.SUCCESS) {
			ra.addFlashAttribute(Const.MSG, "등록 성공");
		} else {
			ra.addFlashAttribute(Const.MSG, "등록 실패");
		}
	
	
		return "redirect:/rest/regFood?i_rest=" + i_rest;
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
	
	@RequestMapping(value="ajaxSelReview", method = RequestMethod.GET)
	@ResponseBody
	public List<RestDMI> ajaxSelReview(@RequestBody RestPARAM param, HttpSession hs) { //session과  set get? 


		return service.selReviewList(param);
	}
	
	@RequestMapping(value="ajaxInsReview", method = RequestMethod.POST)
	@ResponseBody
	public int ajaxInsReview(@RequestBody RestReviewVO param, HttpSession hs) { //session과  set get? 
		int i_user = SecurityUtils.getLoginUserPk(hs);
		if(i_user == 0) {
			return Const.FAIL;
		}
		param.setI_user(i_user);

		return service.insReview(param);
	}
	
	@RequestMapping(value="ajaxDelReview", method = RequestMethod.POST)
	@ResponseBody
	public int ajaxDelReview(@RequestBody RestReviewVO param, HttpSession hs) {
		int i_user = SecurityUtils.getLoginUserPk(hs);
		if(i_user == 0) {
			return Const.FAIL;
		}
		param.setI_user(i_user);
		
		
		return service.delReview(param);
	}
	
	@RequestMapping(value="ajaxUpdReview", method = RequestMethod.POST)
	@ResponseBody
	public int ajaxModReview(@RequestBody RestReviewVO param, HttpSession hs) {
		int i_user = SecurityUtils.getLoginUserPk(hs);
		if(i_user == 0) {
			return Const.FAIL;
		}
		param.setI_user(i_user);
		
		
		return service.updReview(param);
	}
}
