package com.joelinseoul.test.jpa.service;

import java.time.ZonedDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.joelinseoul.test.jpa.domain.RecruitInfo;
import com.joelinseoul.test.jpa.repository.RecruitInfoRepository;

@Service
public class RecruitInfoService {

	@Autowired
	private RecruitInfoRepository recruitInfoRepository;
	
	public List<RecruitInfo> findById(int id){
		return recruitInfoRepository.findById(id);
	};
	
	public List<RecruitInfo> findByCompanyId(int companyId){
		return recruitInfoRepository.findByCompanyId(companyId);
	};
	
	public List<RecruitInfo> findByPositionAndType(String position, String type){
		return recruitInfoRepository.findByPositionAndType(position,type);
	};
	
	public List<RecruitInfo> findByTypeAndSalary(String type, int salary){
		return recruitInfoRepository.findByTypeOrSalaryGreaterThanEqual(type, salary);
	};
	
	public List<RecruitInfo> findTop3ByOrderBySalaryDesc(){
		return recruitInfoRepository.findTop3ByOrderBySalaryDesc();
	};
	
	public List<RecruitInfo> findByRegionAndSalaryBetween(String region, int startSalary, int endSalary){
		return recruitInfoRepository.findByRegionAndSalaryBetween(region,startSalary,endSalary);
	};
	
	public List<RecruitInfo> findByDateAndSalaryAndType(ZonedDateTime deadline, int salary, String type){
		return recruitInfoRepository.findByDateAndSalaryAndType(deadline,salary,type);
	};
	
}
