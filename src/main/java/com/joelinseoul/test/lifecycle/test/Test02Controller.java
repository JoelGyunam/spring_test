package com.joelinseoul.test.lifecycle.test;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@ResponseBody
@RequestMapping("/lifecycle/test02")
public class Test02Controller {

		@RequestMapping("/q1")
		public List<Map<String,Object>> movieList(){
			
			
			List<Map<String,Object>> movieList = new ArrayList<Map<String,Object>>();
			
			Map<String,Object> movieInfo = new HashMap<>();
			
			movieInfo.put("rate", "15");
			movieInfo.put("director", "봉준호");
			movieInfo.put("time", "131");
			movieInfo.put("title", "기생충");
			movieList.add(movieInfo);
			
			movieInfo = new HashMap<>();
			movieInfo.put("rate", "0");
			movieInfo.put("director", "로베르토 베니니");
			movieInfo.put("time", "116");
			movieInfo.put("title", "인생은 아름다워");
			movieList.add(movieInfo);
			
			movieInfo = new HashMap<>();
			movieInfo.put("rate", "12");
			movieInfo.put("director", "크리스토퍼 놀란");
			movieInfo.put("time", "147");
			movieInfo.put("title", "인셉션");
			movieList.add(movieInfo);
			
			return movieList;
			
		}
		
		@RequestMapping("/q2")
		public List<Post> postList(){
		
			List<Post> postList = new ArrayList<>();
			Post post = new Post("안녕하세요 가입인사 드립니다","haguru", "gd");
			postList.add(post);
			
			
			return postList;
			
		}
		

	
	
}

