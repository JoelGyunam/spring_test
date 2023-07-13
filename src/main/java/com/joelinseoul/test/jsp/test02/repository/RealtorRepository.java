package com.joelinseoul.test.jsp.test02.repository;

import org.springframework.stereotype.Repository;

import com.joelinseoul.test.jsp.test02.domain.Realtor;

@Repository
public interface RealtorRepository {

	public int insertRealtor(Realtor realtor);
}
