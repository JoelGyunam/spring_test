package com.joelinseoul.test.lifecycle.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Test03Controller {

	@RequestMapping("/lifecycle/test03")
	public String listPage() {
		return "lifecycle/test03";
	}
	
	
}
