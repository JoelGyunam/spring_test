package com.joelinseoul.test.mybatis.test01.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.joelinseoul.test.mybatis.test01.domain.Realestate;
import com.joelinseoul.test.mybatis.test01.repository.RealestateRepository;

@Service
public class RealestateService {

	@Autowired
	private RealestateRepository realestateRepository;
	
	public Realestate getRealestate(int id) {
		Realestate realestate = realestateRepository.selectRealestate(id);
		return realestate;
	}
	
	public String getAddressById(int id) {
		String address = realestateRepository.selectAddressById(id);
		return address;
	}
	
	
	//전달된 면적 가격 정보를 기반으로 매물 행 조회  getRealestateDouble
	public List<Realestate> getRealestateDouble(int area, int price) {
		List<Realestate> realestate = realestateRepository.selectRealestateDouble(area, price);
		return realestate;
	}
	
	public int addRealestate(int realtorId,String address,int area,String type,int price) {
		int count = realestateRepository.insertRealestate(realtorId, address, area, type, price);
		return count;
	}
	
	public int addRealestateByObject(Realestate realestate) {
		int count = realestateRepository.InsertRealestateByObject(realestate);
		return count;
	}

	public int updateRealestate(int id, String type, int price) {
		int count = realestateRepository.updateRealesatate(id,type,price);
		return count;
	}
	
	public int deleteRealestate(int id) {
		int count = realestateRepository.deleteRealestate(id);
		return count;
	}
	
}
