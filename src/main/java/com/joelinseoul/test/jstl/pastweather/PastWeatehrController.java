package com.joelinseoul.test.jstl.pastweather;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.joelinseoul.test.jstl.pastweather.domain.PastWeather;
import com.joelinseoul.test.jstl.pastweather.service.PastWeatherService;

@Controller
public class PastWeatehrController {

	@Autowired
	private PastWeatherService pastWeatherService;
	
	@GetMapping("/weather/past")
	public String pastPageController(Model model) {
		List<PastWeather> pastWeather = pastWeatherService.selectPast();
		model.addAttribute("selectPastMd",pastWeather);
		return "jstl/weather/viewPastWeather";
	}
	
	@GetMapping("/weather/callinsertWeatherController")
	public String insertWeatherController(
//			@RequestParam("date") @DateTimeFormat(pattern = "MM/dd/yyyy") Date date
//			,@RequestParam("weather") String weather
//			,@RequestParam("microDust") String microDust
//			,@RequestParam("temperatures") double temperatures
//			,@RequestParam("precipation") double precipation
//			,@RequestParam("windSpeed") double windSpeed
			@ModelAttribute PastWeather pastWeather) {
		int insertWeather = pastWeatherService.insertWeatherByObject(pastWeather);
		return "redirect:/weather/past";
		// return "forward:/weather/past";   >> 가능. redirect 와 forward 의 차이는 무엇인가?
	}
	
	@GetMapping("/weather/input")
	public String inputPageController() {
		return "jstl/weather/viewInsertWeather";
	}
}
