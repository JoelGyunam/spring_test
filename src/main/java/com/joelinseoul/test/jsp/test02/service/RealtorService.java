package com.joelinseoul.test.jsp.test02.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.joelinseoul.test.jsp.test02.domain.Realtor;
import com.joelinseoul.test.jsp.test02.repository.RealtorRepository;

@Service
public class RealtorService {

	@Autowired
	private RealtorRepository realtorRepository;
	
	public int insertRealtor(Realtor realtor) {
		int count = realtorRepository.insertRealtor(realtor);
		return count;
	}
	
}
