package kr.bebetalk.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

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
	public String childList(Testee tt, Model model, HttpSession session) {
		System.out.println("tt 값 :: " + tt);
		List<Testee> list;
		
		if(tt.getTesteeID() == null) {
			// 세션에서 로그인 사용자 정보를 가져옴
			String userID = (String) session.getAttribute("userID");
			System.out.println("세션 값 :: "+ userID);
			tt.setTesteeID(userID);
			list = mapper.childList(tt);
		} else {
			list = mapper.childList(tt);			
		}
		
		model.addAttribute("list", list);
		
		return "test/kids_select";
	}	
	
}
