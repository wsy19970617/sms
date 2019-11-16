package cn.edu.xcu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class HelloController {
	@RequestMapping("/index")
	public String index() {
		return "main";
	}
	@RequestMapping("/hw")
	public String hw() {
		return "hello";
	}
	@RequestMapping("/s")
	public String s() {
		return "score";
	}
}
