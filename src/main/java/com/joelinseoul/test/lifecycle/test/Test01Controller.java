package com.joelinseoul.test.lifecycle.test;

import java.util.HashMap;
import java.util.Map;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping("/lifecycle/test01")
@RestController // @Controller + @ResponseBody
public class Test01Controller {

	@RequestMapping("/q1")
	public String stringResponse() {
		String toPrint = "<h1> 테스트 프로젝트 완성</h1>"
				+ "<div>해당 프로젝트를 통해서 문제 풀이를 진행합니다.</div>";
		return toPrint;
	}
	
	@RequestMapping("/q2")
	public Map<String,Integer> scoreResponse(){
		Map<String,Integer> scoreMap = new HashMap<>();
		scoreMap.put("국어", 80);
		scoreMap.put("수학", 90);
		scoreMap.put("영어", 85);
		
		return scoreMap;
		
	}
	
}
