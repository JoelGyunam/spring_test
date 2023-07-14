package com.joelinseoul.test.jstl;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class JstlTest01Controller {

	
	@RequestMapping("/jstl/ctag")
	public String jstlCtag() {
		return "jstl/ctag";
	};
}
