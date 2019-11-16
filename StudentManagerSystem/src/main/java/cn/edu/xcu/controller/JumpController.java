package cn.edu.xcu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class JumpController {
	@RequestMapping("/index")
	public String hw() {
		return "hello";
	}
	@RequestMapping("/s")
	public String s() {
		return "score";
	}
	@RequestMapping("/toLogin")
	public String sss() {
		return "login";
	}
}
