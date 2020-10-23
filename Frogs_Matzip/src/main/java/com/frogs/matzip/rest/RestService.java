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
import com.frogs.matzip.rest.model.RestPARAM;
import com.frogs.matzip.rest.model.RestRecMenuVO;

import lombok.extern.slf4j.Slf4j;

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
	
	public int insFoodMenu(RestFoodFile param) {
		String path = Const.realPath + "/resources/img/rest/" + param.getI_rest() + "/food_pic/"; 
			
		List<RestRecMenuVO> list = new ArrayList();
		
		for(MultipartFile mf : param.getFood_list()) {
			RestRecMenuVO vo = new RestRecMenuVO();
			list.add(vo);
			
			String saveFileNm = FileUtils.saveFile(path, mf);
			vo.setFood_pic(saveFileNm);
			vo.setI_rest(param.getI_rest());
		}
		
		for(RestRecMenuVO vo : list) {
			mapper.insFoodMenu(vo);
		}
		
		return Const.SUCCESS;
	}
	
	public RestDMI selRest(RestPARAM param) {
		return mapper.selRest(param);
	}
	
	public List<RestDMI> selRecRestList() {
		return mapper.selRecRestList();
	}
	
	public List<RestDMI> selCategoryList() {
		return mapper.selCategoryList();
	}
	
	public List<RestDMI> selDistrictList() {
		return mapper.selDistrictList();
	}
	
	public List<RestDMI> selRestList(RestPARAM param) {
		return mapper.selRestList(param);
	}
	
	public List<RestRecMenuVO> selFoodmenu(RestPARAM param) {
		return mapper.selFoodmenu(param);
	}
}
