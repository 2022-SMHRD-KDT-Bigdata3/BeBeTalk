package kr.bebetalk.controller;

import kr.bebetalk.entity.Evaluation;
import kr.bebetalk.entity.EvaluationResult;
import kr.bebetalk.entity.Result;
import kr.bebetalk.entity.ResultText;
import kr.bebetalk.mapper.EvaluationMapper;
import kr.bebetalk.mapper.ResultTextMapper;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

@Controller
public class ResultController {
	
	@Autowired
	private ResultTextMapper mapper;

	@Autowired
	private EvaluationMapper mapper2;
	
	@RequestMapping("/result.do")
	public String ajax(@RequestParam("result") String result , Model model, HttpSession session) {
		
		System.out.println("Result 생성 완료 :: " + result);
		
		model.addAttribute("result", result);
        
        System.out.println("결과 받아오기 완료 :: " + result);

        Float modelRes = Float.parseFloat(result);
        System.out.println("소수점 :: " + result);
        
	     // 메인 문장 받아오기
	  	  ResultText main = mapper.getMainText();
	  	  String mainText = main.getResultContent();
	  	  System.out.println("랜덤 메인 문장 :: " + mainText);
	  	  
	  	  Evaluation test = (Evaluation) session.getAttribute("testInfo");
	  	  String testNum = test.getEvaluationNum();
	  	  System.out.println("테스트번호 메인 :: " + testNum);
	  	  
	  	  
	  	  EvaluationResult evResMain = new EvaluationResult(testNum, mainText);
	  	  mapper2.upMain(evResMain);
	  	  System.out.println("메인 업데이트 :: " + evResMain.getEvaluationResult());
	  	  
	  	  model.addAttribute("mainText", mainText);
	  	  
	  	  if((modelRes - 4) >= 0 ) { // 모델 결과가 4세 이상으로 나올 경우
	  		  
	  		  // 솔루션 상 문장 받아오기
	  		  ResultText solHigh = mapper.getHighText();
	  		  String solHighText = solHigh.getResultContent();
	  		  System.out.println("랜덤 솔루션 상 문장 :: " + solHighText);	  		  
	  		  
	  		  System.out.println("테스트번호 상 :: " + testNum);
	  		  EvaluationResult evResSub = new EvaluationResult(testNum, solHighText);
	  		  mapper2.upSub(evResSub);
	  		  System.out.println("솔루션 상 업데이트 후 :: " + evResSub.getEvaluationResult());
	  		  
	  		  model.addAttribute("solHighText", solHighText);
	  		  
	  	  }else { // 모델 결과가 4세 미만으로 나올 경우
	  		  // 솔루션 하 받아오기
	  		  ResultText solLow = mapper.getLowText();
	  		  String solLowText = solLow.getResultContent();
	  		  System.out.println("랜덤 솔루션 하 문장 :: " + solLowText);	  		  
	  		  
	  		  System.out.println("테스트번호 하 :: " + testNum);
	  		  EvaluationResult evResSub = new EvaluationResult(testNum, solLowText);
	  		  System.out.println("솔루션 하 업데이트 :: " + evResSub.getEvaluationResult());
	  		  mapper2.upSub(evResSub);
	  		  
	  		  model.addAttribute("solLowText", solLowText);
	  	  }
        return "/test/result";
		
	}
	
	

}

