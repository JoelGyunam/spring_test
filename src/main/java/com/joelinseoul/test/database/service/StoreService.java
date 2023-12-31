package com.joelinseoul.test.database.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.joelinseoul.test.database.domain.Store;
import com.joelinseoul.test.database.repository.StoreRepository;

@Service
public class StoreService {
	
	@Autowired
	private StoreRepository storeRepository;
	
	// store 리스트 조회 기능
	public List<Store> getStoreList(){
		List<Store> storeList = storeRepository.selectStoreList();
		
		return storeList;
	}
}
