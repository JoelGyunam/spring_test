package com.joelinseoul.test.database.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.joelinseoul.test.database.domain.Store;

@Repository
public interface StoreRepository {

	// store 테이블에서 모든 행 조회
	public List<Store> selectStoreList();
}
