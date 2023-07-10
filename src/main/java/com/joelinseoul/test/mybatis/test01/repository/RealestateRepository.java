package com.joelinseoul.test.mybatis.test01.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.joelinseoul.test.mybatis.test01.domain.Realestate;

@Repository
public interface RealestateRepository {

	public Realestate selectRealestate(@Param("id") int id);
	
	public List<Realestate> selectRealestateDouble(@Param("area")int area, @Param("price")int price);
	
	public int insertRealestate(
			@Param("realtorId")int realtorId
			,@Param("address")String address
			,@Param("area")int area
			,@Param("type")String type
			,@Param("price")int price
			);
}
