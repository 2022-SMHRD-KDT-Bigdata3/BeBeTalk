package kr.bebetalk.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.bebetalk.mapper.UserMapper;

@Controller
public class MyPageController {
	
	@Autowired
	private UserMapper mapper;
	
	@RequestMapping("/myPage.do")
	private String myPage() {
		return "myPage";
	}

}
