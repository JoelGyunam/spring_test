package com.joelinseoul.test.jstl.baemin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.joelinseoul.test.jstl.baemin.domain.BaeminReview;
import com.joelinseoul.test.jstl.baemin.domain.BaeminUserReview;
import com.joelinseoul.test.jstl.baemin.repository.BaeminReviewRepository;

@Service
public class BaeminReviewService {

	@Autowired
	private BaeminReviewRepository baeminReviewRepository;
	
	public List<BaeminReview> selectStoreList(){
		List<BaeminReview> selectStoreList = baeminReviewRepository.selectStoreList();
		return selectStoreList;
	}
	
	public List<BaeminUserReview> selectReviewByStoreId(int storeId){
		List<BaeminUserReview> selectReviewByStoreId = baeminReviewRepository.selectReviewByStoreId(storeId);
		return selectReviewByStoreId;
	}
	
	public BaeminReview selectStore(int storeid) {
		BaeminReview selectStore = baeminReviewRepository.selectStore(storeid);
		return selectStore;
	}
}
