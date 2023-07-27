package com.joelinseoul.test.jpa;

import java.time.ZonedDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.joelinseoul.test.jpa.domain.RecruitInfo;
import com.joelinseoul.test.jpa.service.RecruitInfoService;

@RequestMapping("/jpa/read")
@RestController
public class RecruitInfoController {
	
	@Autowired
	private RecruitInfoService recruitInfoService;
	
	@GetMapping("/1")
	public List<RecruitInfo> findById(){
		List<RecruitInfo> result = recruitInfoService.findById(8);
		return result;
	};
	
	@GetMapping("/2")
	public List<RecruitInfo> findByCompanyId(@RequestParam("companyId") int companyId){
		List<RecruitInfo> result = recruitInfoService.findByCompanyId(companyId);
		return result;
	};
	
	@GetMapping("/3")
	public List<RecruitInfo> findByPositionAndType(){
		List<RecruitInfo> result= recruitInfoService.findByPositionAndType("웹 back-end 개발자","정규직");
		return result;
	};
	
	@GetMapping("/4")
	public List<RecruitInfo> findByTypeAndSalary(){
		List<RecruitInfo> result= recruitInfoService.findByTypeAndSalary("정규직", 9000);
		return result;
	};
	
	@GetMapping("/5")
	public List<RecruitInfo> findTop3BySalaryOrderByDesc(){
		List<RecruitInfo> result= recruitInfoService.findTop3ByOrderBySalaryDesc();
		return result;
	};
	
	@GetMapping("/6")
	public List<RecruitInfo> findByRegionAndSalaryBetween(){
		List<RecruitInfo> result= recruitInfoService.findByRegionAndSalaryBetween("성남시 분당구",7000,8500);
		return result;
	};
	
	@GetMapping("/7")
	public List<RecruitInfo> findByDateAndSalaryAndType(){
		
		ZonedDateTime deadline = ZonedDateTime.parse("2026-04-10T00:00:00+09:00[Asia/Seoul]");
		
		List<RecruitInfo> result= recruitInfoService.findByDateAndSalaryAndType(deadline,8100,"정규직");
		return result;
	};
}
