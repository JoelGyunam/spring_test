package com.joelinseoul.test.jsp.test02;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.joelinseoul.test.jsp.test02.domain.Realtor;
import com.joelinseoul.test.jsp.test02.service.RealtorService;

@Controller
@RequestMapping("/realtor")
public class RealtorController {

	@Autowired
	private RealtorService realtorService;
	
	@RequestMapping("/add")
	public String insertRealtorJsp(){
		return "jsp/insertRealtor";
	}
	
	
	@PostMapping("/controller/insertRealtor")
	public String insertRealtor(
			@RequestParam("office") String office
			,@RequestParam("phoneNumber") String phoneNumber  
			,@RequestParam("address") String address  
			,@RequestParam("grade") String grade
			,Model model
			) {
		
		Realtor realtor = new Realtor();
		
		realtor.setOffice(office);
		realtor.setPhoneNumber(phoneNumber);
		realtor.setAddress(address);
		realtor.setGrade(grade);
		
		
		realtorService.insertRealtor(realtor);
		model.addAttribute("realtor",realtor);

		return "jsp/realtorInfo";
		
	}
	
}
