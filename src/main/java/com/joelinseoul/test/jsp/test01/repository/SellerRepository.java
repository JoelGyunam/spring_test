package com.joelinseoul.test.jsp.test01.repository;

import java.util.Optional;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.joelinseoul.test.jsp.test01.domain.Seller;

@Repository
public interface SellerRepository {

	public int insertSeller(
			@Param("nickname")String nickname
			,@Param("profileImage")String profileImage
			,@Param("temperature")String temperature
			);

	public Seller getInfo();
	
	public Seller getInfoById(int id);
	
}
