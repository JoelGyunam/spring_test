package com.joelinseoul.test.jstl.pastweather.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.joelinseoul.test.jstl.pastweather.domain.PastWeather;
import com.joelinseoul.test.jstl.pastweather.repository.PastWeatherRepository;

@Service
public class PastWeatherService {

	@Autowired
	private PastWeatherRepository pastWeatherRepository;
	
	public List<PastWeather> selectPast() {
		List<PastWeather> selectPast = pastWeatherRepository.selectPast();
		return selectPast;
	}
	
	public int insertWeather(Date date, String weather, String microDust, double temperatures, double precipation, double windSpeed) {
		int insertWeather = pastWeatherRepository.insertWeather(date,weather,microDust,temperatures,precipation,windSpeed);
		return insertWeather;
	}
	
	public int insertWeatherByObject(PastWeather pastWeather) {
		int insertWeatherByObject = pastWeatherRepository.insertWeatehrByObject(pastWeather);
		return insertWeatherByObject;
	}
	
}
