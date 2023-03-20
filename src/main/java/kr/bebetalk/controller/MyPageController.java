package kr.bebetalk.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.bebetalk.entity.Evaluation;
import kr.bebetalk.entity.Testee;
import kr.bebetalk.entity.User;
import kr.bebetalk.mapper.EvaluationMapper;
import kr.bebetalk.mapper.TesteeMapper;

@Controller
public class MyPageController {
	
	@Autowired
	private TesteeMapper mapper;
	
	@Autowired
	private EvaluationMapper mapper2;
	
	// 마이 페이지 아이 목록 불러오기
	@RequestMapping("/myPage.do")
	private String myPage(Testee tt, Model model, HttpSession session) {
		
		List<Testee> list;
		List<Evaluation> list2;
		
		if(tt.getTesteeID() == null) {
			User userID = (User) session.getAttribute("uvo");
			System.out.println("마이페이지 아이 불러오기 :: " + userID.getUserID());
			tt.setTesteeID(userID.getUserID());
			list = mapper.myList(tt);
			list2 = mapper2.evList(tt);
		}else {
			list = mapper.myList(tt);
			list2 = mapper2.evList(tt);
		}

		model.addAttribute("myList", list);
		model.addAttribute("prevResult", list2);
		
		return "main/mypage";
	}
		
	// 아이 삭제
	@RequestMapping("/childremove.do")
	public String childremove(Testee tt) {
		
		System.out.println("childremove.do :: " + tt);
		System.out.println("update nick :: " + tt.getTestKidsNick());

		// 참조하고 있는 테이블에 데이터가 있는지 여부를 확인
		int count = mapper.checkReference(tt.getTestKidsNick());
		
		if(count > 0) {	 // 참조하고 있는 테이블에 데이터 O
			System.out.println("count > nick :: " + tt.getTestKidsNick());
		    mapper2.testDelete(tt.getTestKidsNick()); // 참조하는 테이블이 있다면 testDelete() 실행
		    System.out.println("after delete :: " + tt.getTestKidsNick());
		    mapper.childremove(tt.getTestKidsNick()); // 참조 테이블 데이터 삭제 후childremove() 실행
		    
		} else {	// 참조하고 있는 테이블에 데이터 X
		    mapper.childremove(tt.getTestKidsNick()); // 참조하는 테이블에 데이터가 없다면 childremove() 실행
		}
		
		System.out.println("아이삭제성공");

		return "redirect:/myPage.do";
	}
		
}
