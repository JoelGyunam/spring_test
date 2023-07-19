package com.joelinseoul.test.jstl.baemin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.joelinseoul.test.jstl.baemin.domain.BaeminReview;
import com.joelinseoul.test.jstl.baemin.domain.BaeminUserReview;
import com.joelinseoul.test.jstl.baemin.service.BaeminReviewService;

@Controller
public class BaeminReviewController {

	@Autowired
	private BaeminReviewService baeminReviewService;
	
	@GetMapping("/baemin/list")
	public String BaeminListController(Model model ) {
		
		List<BaeminReview> selectStoreList = baeminReviewService.selectStoreList();
		
		model.addAttribute("reviewStoresMd",selectStoreList);
		
		return "jstl/baemin/baeminReviewList";
	}
	
	@GetMapping("/baemin/list/review")
	public String BaeminReviewController(@RequestParam("storeid") int storeId, Model model) {
		List<BaeminUserReview> selectReviewByStoreId = baeminReviewService.selectReviewByStoreId(storeId);
		BaeminReview selectStore = baeminReviewService.selectStore(storeId);
		
		model.addAttribute("reviewByStoreMd", selectReviewByStoreId);
		model.addAttribute("selectStoreMd", selectStore);
		
		return "jstl/baemin/baeminReviewByStore";
	}
	
}
