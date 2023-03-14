package kr.bebetalk.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.bebetalk.mapper.UserMapper;

@Controller
public class TestController {
	
	@Autowired
	private UserMapper mapper;
	
	@RequestMapping("/kidsSelect.do")
	private String kidsSelect() {
		return "/test/kids_select";
	}

	
	@RequestMapping("/testVoice1.do")
	private String testVoice1() {
		return "/test/test_voice_1";
	}
	
	@RequestMapping("/testVoice2.do")
	private String testVoice2() {
		return "/test/test_voice_2";
	}
	
	@RequestMapping("/testVoice3.do")
	private String testVoice3() {
		return "/test/test_voice_3";
	}
	
	@RequestMapping("/testCheck.do")
	private String testCheck() {
		return "/test/test_check";
	}
	
	@RequestMapping("/result.do")
	private String result() {
		return "/test/result";
	}
}
