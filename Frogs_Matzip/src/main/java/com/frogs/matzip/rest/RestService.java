package com.frogs.matzip.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.frogs.matzip.Const;
import com.frogs.matzip.FileUtils;
import com.frogs.matzip.rest.model.RestDMI;
import com.frogs.matzip.rest.model.RestPARAM;

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
	
	public List<RestDMI> selRecRestList() {
		return mapper.selRecRestList();
	}
	
	public List<RestDMI> selCategoryList() {
		return mapper.selCategoryList();
	}
}
