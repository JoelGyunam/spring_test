package com.joelinseoul.test.ajax.bookmark;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.joelinseoul.test.ajax.bookmark.domain.Bookmark;
import com.joelinseoul.test.ajax.bookmark.service.BookmarkService;

@RequestMapping("/bookmark")
@Controller
public class BookmarkController {

	@Autowired
	private BookmarkService bookmarkService;
	
	@GetMapping("/add")
	@ResponseBody
	public Map<String,String> addBookmark(
			@RequestParam("n") String name
			,@RequestParam("url") String url
			) {
		int count = bookmarkService.addBookmark(name, url);
		
		Map<String,String> resultMap = new HashMap<>();
		if(count==1) {
			resultMap.put("result", "success");
		} else resultMap.put("result","fail");
		
		return resultMap;
	}
	
	@GetMapping("/input")
	public String inputBookmark() {
		return "ajax/bookmark/bookmarkInput";
	}
	
	@GetMapping("/list")
	public String getBookmark(Model model){
		List<Bookmark> getBookmark = bookmarkService.getBookmark();
		
		model.addAttribute("getBookmarkMd", getBookmark);
		
		return "ajax/bookmark/bookmarkList";
	};
	
	@GetMapping("/url_dup_check")
	@ResponseBody
	public Map<String,String> urlDupCheck(@RequestParam("url") String url) {
		int count = bookmarkService.urlDupCheck(url);
		
		Map<String,String> resultMap = new HashMap<>();
		
		if(count == 1) {
			resultMap.put("result", "true");
		} else resultMap.put("result", "false");
		
		return resultMap;
	}
	
	@GetMapping("delete_id")
	@ResponseBody
	public Map<String, String> deleteBookmarkById(@RequestParam("id") int id){
		int count = bookmarkService.deleteBookmarkById(id);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if(count == 1) {
			resultMap.put("result","success");
		} else resultMap.put("result", "fail");
		
		return resultMap;
	}
}
