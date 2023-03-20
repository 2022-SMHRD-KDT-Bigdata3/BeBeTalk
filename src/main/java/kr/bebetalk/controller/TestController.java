package kr.bebetalk.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.bebetalk.entity.Evaluation;
import kr.bebetalk.entity.Testee;
import kr.bebetalk.mapper.EvaluationMapper;
import kr.bebetalk.mapper.TesteeMapper;

@Controller
public class TestController {
	
	@Autowired
	private EvaluationMapper mapper;
	@Autowired
	private TesteeMapper mapper2;
	
	@PostMapping("/testVoice1-1.do")
	public String receiveDataFromClient(@RequestParam("selectedValue") String selectedValue, HttpSession session) {
		System.out.println("controller 값 : " + selectedValue);
		
		mapper.newEva(selectedValue);
		System.out.println("새로운 평가 시작");
		
		Evaluation ev = mapper.getEva(selectedValue);
		System.out.println("현재 평가 애기 이름 불러오기 :::: " + ev.getEvaluationName());
		
		Testee testeeBirth = mapper2.getBirth(selectedValue);
		System.out.println("현재 평가 애기 나이 불러오기 :::: " + testeeBirth.getTesteeBirth());
		
		session.setAttribute("testInfo", ev);
		session.setAttribute("testeeBirth", testeeBirth);
		return "redirect:/test_voice_1_1.do";
	}
	
	@RequestMapping("/test_voice_1_1.do")
	private String test_voice_1_1() {
		System.out.println("제발 이동 해줄래 ?");
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
	
	@PostMapping("/testVoice2-1.do")
	public String receive2(@RequestParam("selectedValue") String selectedValue, HttpSession session) {
		System.out.println("controller 값 : " + selectedValue);
		mapper.newEva(selectedValue);
		System.out.println("새로운 평가 시작2");
		
		Evaluation ev = mapper.getEva(selectedValue);
		System.out.println("현재 평가자 정보 불러오기 :::: " + ev.getEvaluationName());
		
		Testee testeeBirth = mapper2.getBirth(selectedValue);
		System.out.println("현재 평가 애기 나이 불러오기 :::: " + testeeBirth.getTesteeBirth());
		
		session.setAttribute("testInfo", ev);
		session.setAttribute("testeeBirth", testeeBirth);
		return "redirect:/test_voice_2_1.do";
	}
	
	@RequestMapping("/test_voice_2_1.do")
	private String test_voice_2_1() {
		System.out.println("제발 이동 해줄래22222 ?");
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
