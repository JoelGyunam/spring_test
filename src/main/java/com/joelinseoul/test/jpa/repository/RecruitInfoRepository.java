package com.joelinseoul.test.jpa.repository;

import java.time.ZonedDateTime;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.joelinseoul.test.jpa.domain.RecruitInfo;

@Repository
public interface RecruitInfoRepository extends JpaRepository<RecruitInfo, Integer> {

	public List<RecruitInfo> findById(int id);
	
	public List<RecruitInfo> findByCompanyId(int companyId);
	
	public List<RecruitInfo> findByPositionAndType(String position, String type);
	
	public List<RecruitInfo> findByTypeOrSalaryGreaterThanEqual(String type, int salary);
	
	public List<RecruitInfo> findTop3ByOrderBySalaryDesc();
	
	public List<RecruitInfo> findByRegionAndSalaryBetween(String region, int start, int end);
	
	@Query(value="SELECT * FROM `recruit_info`"
			+ " WHERE "
			+ "`deadline` >= :deadline"
			+ " AND `salary` >= :salary"
			+ " AND `type`=:type"
			+ " ORDER BY `salary` DESC;",nativeQuery=true)
	public List<RecruitInfo> findByDateAndSalaryAndType(
			@Param("deadline")ZonedDateTime deadline
			,@Param("salary")int salary
			,@Param("type") String type
			);
}
