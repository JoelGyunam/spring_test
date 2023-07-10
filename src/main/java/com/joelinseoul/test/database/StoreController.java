package com.joelinseoul.test.database;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.joelinseoul.test.database.domain.Store;
import com.joelinseoul.test.database.service.StoreService;

@Controller
public class StoreController {

	// sotre목록 조회
	@Autowired
	private StoreService storeService;
		
	
	@RequestMapping("/db/store/list")
	@ResponseBody
	public List<Store> storeList(){
		List<Store> storeList = storeService.getStoreList();
		
		return storeList;
	}

}
