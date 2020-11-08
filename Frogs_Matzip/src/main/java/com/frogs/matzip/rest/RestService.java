package com.frogs.matzip.rest;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.frogs.matzip.Const;
import com.frogs.matzip.FileUtils;
import com.frogs.matzip.rest.model.RestDMI;
import com.frogs.matzip.rest.model.RestFoodFile;
import com.frogs.matzip.rest.model.RestFoodVO;
import com.frogs.matzip.rest.model.RestPARAM;
import com.frogs.matzip.rest.model.RestReviewVO;

@Service
public class RestService {
	@Autowired
	private RestMapper mapper;
	
	@Transactional
	public void insRestTran(RestPARAM param) {
		mapper.insRest(param);
		//RestDMI dmi = mapper.selRestMaxPk();
	
		//int i_rest = dmi.getI_rest(); //여기서 에러 터짐
		int i_rest = param.getI_rest();
		String path = Const.realPath + "/resources/img/rest/" + i_rest + "/menu_pic/"; 
		String menu_pic = FileUtils.saveFile(path, param.getMenu_pic_file());
		
		param.setI_rest(i_rest);
		param.setMenu_pic(menu_pic);
		
		mapper.updRestMenu(param);
	}
	
	public int insFoodPic(RestFoodFile param) {
		String path = Const.realPath + "/resources/img/rest/" + param.getI_rest() + "/food_pic/"; 
			
		List<RestFoodVO> list = new ArrayList();
		
		for(MultipartFile mf : param.getFood_list()) {
			RestFoodVO vo = new RestFoodVO();
			list.add(vo);
			
			String saveFileNm = FileUtils.saveFile(path, mf);
			vo.setFood_pic(saveFileNm);
			vo.setI_rest(param.getI_rest());
		}
		
		for(RestFoodVO vo : list) {
			mapper.insFoodPic(vo);
		}
		
		return Const.SUCCESS;
	}
	
	public int insReview(RestReviewVO param) {
		return mapper.insReview(param);
	}
	
	public RestDMI selRest(RestPARAM param) {
		return mapper.selRest(param);
	}
	
	public List<RestDMI> selCategoryList() {
		return mapper.selCategoryList();
	}
	
	public List<RestDMI> selDistrictList() {
		return mapper.selDistrictList();
	}
	
	public List<RestDMI> selRestList(RestPARAM param) {
		String search_text = param.getSearch_text();
		System.out.println(search_text);
		if(search_text != null) {
			param.setSql_search_text("%"+search_text+"%");
			System.out.println(param.getSql_search_text());
		}
		
		return mapper.selRestList(param);
	}
	
	public List<RestFoodVO> selFoodPicList(RestPARAM param) {
		return mapper.selFoodPicList(param);
	}
	
	public List<RestDMI> selRecRestList(RestPARAM param) {
		return mapper.selRecRestList();
	}
	
	public List<RestDMI> selReviewList(RestPARAM param) {
		return mapper.selReviewList(param);
	}
	
	public RestDMI selReviewCount(RestReviewVO param) {
		return mapper.selReviewCount(param);
	}
	
	public int updReview(RestReviewVO param) {
		return mapper.updReview(param);
	}
	
	public int delReview(RestReviewVO param) {
		return mapper.delReview(param);
	}
}
