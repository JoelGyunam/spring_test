package com.joelinseoul.test.lifecycle.test;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/RestController/test02")
public class Test02Controller {

	
	@RequestMapping("/q1")
	public List<Map<String, Object>> movieList(){
		
		List<Map<String, Object>> movieList = new ArrayList<>();
		
		Map<String, Object> mapResponse = new HashMap<>();
		mapResponse.put("rate", "15");
		mapResponse.put("director", "봉준호");
		mapResponse.put("time", "131");
		mapResponse.put("title", "기생충");
		movieList.add(mapResponse);
		
		mapResponse.put("rate", "18");
		mapResponse.put("director", "홍길동");
		mapResponse.put("time", "98");
		mapResponse.put("title", "홍길동전");
		movieList.add(mapResponse);
		
		return movieList;
	}

	
	
		// List<Map<String,Object>> listMapInsert = new ArrayList<Map<String, Object>>();
//	public Map<String, Object> mapResponse(){
//		Map<String, Object> mapResponse = new HashMap<>();
//		
//		
//		listMapInsert.put(mapResponse);
//	}
	
}

