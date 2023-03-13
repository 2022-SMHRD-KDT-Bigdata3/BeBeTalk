package kr.bebetalk.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.bebetalk.mapper.UserMapper;

@Controller
public class TestController {
	
	@Autowired
	private UserMapper mapper;
	
	@RequestMapping("/testStart.do")
	private String testStart() {
		return "testStart";
	}

}
