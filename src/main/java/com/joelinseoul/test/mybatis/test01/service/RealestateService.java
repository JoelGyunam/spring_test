package com.joelinseoul.test.mybatis.test01.service;

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
	
}
