package com.joelinseoul.test.jsp.test01.repository;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface SellerRepository {

	public int insertSeller(
			@Param("nickname")String nickname
			,@Param("profileImage")String profileImage
			,@Param("temperature")String temperature
			);
	
}
