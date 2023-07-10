package com.joelinseoul.test.mybatis.test01.repository;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.joelinseoul.test.mybatis.test01.domain.Realestate;

@Repository
public interface RealestateRepository {

	public Realestate selectRealestate(@Param("id") int id);
}
