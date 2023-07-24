package com.joelinseoul.test.ajax.pension.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.joelinseoul.test.ajax.pension.domain.Pension;
import com.joelinseoul.test.ajax.pension.repository.PensionRepository;

@Service
public class PensionService {

	@Autowired
	private PensionRepository pensionRepository;
	
	
	public List<Pension> getReseravationList(){
		List<Pension> getList = pensionRepository.selectReservationList();
		return getList;
	}
	
	public int deleteReservation(int id) {
		int count = pensionRepository.deleteReservation(id);
		return count;
	}
	
	public int addReservation(String name, Date date, int day, int headcount, String phoneNumber) {
		int count = pensionRepository.insertReservation(name, date, day, headcount, phoneNumber);
		return count;
	}
	
	public Pension getReservationByNameAndPhoneNumber(String Name, String phoneNumber) {
		Pension getInfo = pensionRepository.selectByNameAndPhoneNumber(Name, phoneNumber);
		
		if(getInfo == null) {
			return null;
		} else		
		return getInfo;
	}
}
