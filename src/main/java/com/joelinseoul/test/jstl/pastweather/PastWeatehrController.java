package com.joelinseoul.test.jstl.pastweather;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	public String insertWeatherController(@RequestParam Date date,@RequestParam String weather,@RequestParam String microDust,@RequestParam double temperatures,@RequestParam double precipation,@RequestParam double windSpeed) {
		int insertWeather = pastWeatherService.insertWeather(date,weather,microDust,temperatures,precipation,windSpeed);
		return "forward:/weather/past";
	}
	
	@GetMapping("/weather/input")
	public String inputPageController() {
		return "jstl/weather/viewInsertWeather";
	}
}
