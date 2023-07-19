package com.joelinseoul.test.jstl.baemin.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.joelinseoul.test.jstl.baemin.domain.BaeminReview;
import com.joelinseoul.test.jstl.baemin.domain.BaeminUserReview;

@Repository
public interface BaeminReviewRepository {

	public List<BaeminReview> selectStoreList();

	public List<BaeminUserReview> selectReviewByStoreId(@Param("storeId") int storeId);
	
	public BaeminReview selectStore(@Param("storeId") int storeid);
}
