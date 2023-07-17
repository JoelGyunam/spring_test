package com.joelinseoul.test.jstl.pastweather;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PastWeatehrController {

	@GetMapping("/weather/past")
	public String pastPageController() {
		return "jstl/weather/weatherRoot";
	}
	
}
