package com.joelinseoul.test.ajax.pension.repository;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.joelinseoul.test.ajax.pension.domain.Pension;

@Repository
public interface PensionRepository {
	
	public List<Pension> selectReservationList();
	
	public int deleteReservation(@Param("id")int id);
	
	public int insertReservation(
			@Param("name") String name
			,@Param("date") Date date
			,@Param("day") int day
			,@Param("headcount") int headcount
			,@Param("phoneNumber") String phoneNumber
			);

	public Pension selectByNameAndPhoneNumber(
			@Param("name") String name
			,@Param("phoneNumber") String phoneNumber);
}
