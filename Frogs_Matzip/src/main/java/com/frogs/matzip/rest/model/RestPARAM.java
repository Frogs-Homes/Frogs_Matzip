package com.frogs.matzip.rest.model;

import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;

@Alias("RestPARAM")
public class RestPARAM extends RestVO {
	private MultipartFile menu_pic_file;

	public MultipartFile getMenu_pic_file() {
		return menu_pic_file;
	}

	public void setMenu_pic_file(MultipartFile menu_pic_file) {
		this.menu_pic_file = menu_pic_file;
	}
}
