package com.joelinseoul.test.jstl.pastweather.repository;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.joelinseoul.test.jstl.pastweather.domain.PastWeather;

@Repository
public interface PastWeatherRepository {

	public List<PastWeather> selectPast();
	
	public int insertWeather(
			@Param("date") Date date
			,@Param("weather") String weather
			,@Param("microDust") String microDust
			,@Param("temperatures") double temperatures
			,@Param("precipation") double precipation
			,@Param("windSpeed") double windSpeed
			);
}
