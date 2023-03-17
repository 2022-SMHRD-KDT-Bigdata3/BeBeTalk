package kr.bebetalk.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.bebetalk.entity.Testee;
import kr.bebetalk.mapper.TesteeMapper;

@Controller
public class MyPageController {
	
	@Autowired
	private TesteeMapper mapper;
	
	@RequestMapping("/myPage.do")
	private String myPage(Testee tt, Model model) {
		
		List<Testee> list = mapper.myList(tt);
		
		model.addAttribute("myList", list);
		return "main/mypage";
	}
	
}
