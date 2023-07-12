package com.joelinseoul.test.jsp.test01.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.joelinseoul.test.jsp.test01.domain.Seller;
import com.joelinseoul.test.jsp.test01.repository.SellerRepository;

@Service
public class SellerService {

	@Autowired
	private SellerRepository sellerRepository;
	
	
	public int insertSeller(String nickname, String profileImage, String temperature) {
		int count = sellerRepository.insertSeller(nickname, profileImage, temperature);
		return count;
	}
	
	
	public Seller getInfo() {
		Seller seller = sellerRepository.getInfo();
		return seller;
	}
	
	public Seller getInfoById(int id) {
		Seller seller = sellerRepository.getInfoById(id);
		return seller;
	}
}
