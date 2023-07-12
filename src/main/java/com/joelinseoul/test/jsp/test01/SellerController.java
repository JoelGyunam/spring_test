package com.joelinseoul.test.jsp.test01;


import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.joelinseoul.test.jsp.test01.domain.Seller;
import com.joelinseoul.test.jsp.test01.service.SellerService;

@RequestMapping("/seller")
@Controller
public class SellerController {

	@Autowired
	private SellerService sellerService;
	
	@GetMapping("/register")
	public String sellerInput() {
		return "jsp/insertSeller"; //application.properties 에서 prefix와 suffix 를 jsp 경로와 확장자로 설정해놓았음.
	}
	
	// 등록 컨트롤러
	@PostMapping("/controller/insertSeller")
	public String insertSeller(
			@RequestParam("nickname") String nickname
			,@RequestParam("profileImage") String profileImage
			,@RequestParam("temperature") String temperature
			,Model model
			) {
		sellerService.insertSeller(nickname, profileImage, temperature);
	    model.addAttribute("nickname", nickname);
	    model.addAttribute("profileImage", profileImage);
	    model.addAttribute("temperature", temperature);
		return "jsp/insertSellerResult";
	}
	
	//최근 판매자 정보 출력 컨트롤러
	@GetMapping("/info")
	public String sellerInfo(@RequestParam("id") Optional <Integer> id, Model model) {
		
		Seller seller = new Seller();
		
		if(id.isPresent()) {
			int idForSearch = id.get();
			seller = sellerService.getInfoById(idForSearch);
		} else {
			seller = sellerService.getInfo();
		}	
		
		model.addAttribute("nickname", seller.getNickname());
		model.addAttribute("profileImage", seller.getProfileImage());
		model.addAttribute("temperature", seller.getTemperature());
		return "jsp/sellerInfo";
	}
	
	
		
}
