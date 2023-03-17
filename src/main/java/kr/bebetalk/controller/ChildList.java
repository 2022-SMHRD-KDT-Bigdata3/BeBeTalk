package kr.bebetalk.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.bebetalk.entity.Testee;
import kr.bebetalk.mapper.TesteeMapper;

@Controller
public class ChildList {
	
	@Autowired
	private TesteeMapper mapper;
	
	
	@PostMapping("/childInsert.do")
	private String childInsert(Testee tt) {
		System.out.println(tt.getTesteeID());
		System.out.println(tt.getTestKidsNick());
		System.out.println(tt.getTesteeBirth());
		System.out.println(tt.getTesteeSex());
		mapper.childInsert(tt);
		
		System.out.println("아이 추가 성공");
		
		return "redirect:/childList.do";
	}
	
	@RequestMapping("/childList.do")
	public String childList(Testee tt, Model model) {
				
		List<Testee> list = mapper.childList(tt);
		
		model.addAttribute("list", list);
		
		return "test/kids_select";
	}	

}
