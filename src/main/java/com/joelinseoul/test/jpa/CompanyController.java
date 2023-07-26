package com.joelinseoul.test.jpa;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.joelinseoul.test.jpa.domain.Company;
import com.joelinseoul.test.jpa.service.CompanyService;

@RequestMapping("/company")
@Controller
public class CompanyController {

	@Autowired
	private CompanyService companyService;
	
	
	@GetMapping("/insert")
	@ResponseBody
	public Company[] addCompany() {
		
		Company company = new Company();
		Company companyArr[] = new Company[2];
		List<Map<String, Object>> addInfoList = new ArrayList<>();
		Map<String, Object> addInfoMap = new HashMap<>();
		
		addInfoMap.put("name", "넥손");
		addInfoMap.put("business", "컨텐츠 게임");
		addInfoMap.put("scale", "대기업");
		addInfoMap.put("headcount", 3585);
		addInfoList.add(addInfoMap);
		
		addInfoMap = new HashMap<>();
		addInfoMap.put("name", "버블팡");
		addInfoMap.put("business", "여신 금융업");
		addInfoMap.put("scale", "대기업");
		addInfoMap.put("headcount", 6834);
		addInfoList.add(addInfoMap);
		
		for(int i = 0; i < companyArr.length; i++) {
			String name = (String) addInfoList.get(i).get("name");
			String business = (String) addInfoList.get(i).get("business");
			String scale = (String) addInfoList.get(i).get("scale");
			int headcount = (int) addInfoList.get(i).get("headcount");
			
			companyArr[i] = companyService.addCompany(name, business, scale, headcount);
		}
		
		return companyArr;
		
	};
	
	
	@GetMapping("/edit")
	@ResponseBody
	public Company editCompanyInfo() {
		
		int id = 112;
		String scale = "중소기업";
		int headcount = 34;
		
		Company company = companyService.editCompany(id, scale, headcount);
		return company;
	};
	
	@GetMapping("/delete")
	@ResponseBody
	public String deleteCompanyInfo() {
		
		int id = 2;
		
		companyService.deleteCompany(id);
		return "수행 완료";
	}
	
}
