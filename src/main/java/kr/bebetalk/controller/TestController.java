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

	
	@RequestMapping("/testVoice1-1.do")
	private String testVoice1_1() {
		return "/test/test_voice_1_1";
	}
	
	@RequestMapping("/testVoice1-2.do")
	private String testVoice1_2() {
		return "/test/test_voice_1_2";
	}
	
	@RequestMapping("/testVoice1-3.do")
	private String testVoice1_3() {
		return "/test/test_voice_1_3";
	}
	
	@RequestMapping("/testVoice2-1.do")
	private String testVoice2_1() {
		return "/test/test_voice_2_1";
	}
	
	@RequestMapping("/testVoice2-2.do")
	private String testVoice2_2() {
		return "/test/test_voice_2_2";
	}
	
	@RequestMapping("/testVoice2-3.do")
	private String testVoice2_3() {
		return "/test/test_voice_2_3";
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
