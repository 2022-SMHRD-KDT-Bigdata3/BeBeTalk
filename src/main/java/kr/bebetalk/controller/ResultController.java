package kr.bebetalk.controller;

import kr.bebetalk.entity.Result;
import kr.bebetalk.entity.ResultText;
import kr.bebetalk.mapper.ResultTextMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.RestTemplate;

@Controller
public class ResultController {

    @GetMapping("/result.do")
    public String getResult(Model model) {
        final String url = "http://127.0.0.1:5000/result";

        RestTemplate restTemplate = new RestTemplate();
        String resultString = restTemplate.getForObject(url, String.class);

        Result result = new Result();
        result.setResultString(resultString);

        model.addAttribute("result", result);

        return "/test/result";
    }
    
    @Autowired
	  private ResultTextMapper mapper;
    
    @RequestMapping("/result2.do")
    public String resultText(Model model) {
  	  // 메인 문장 받아오기
  	  ResultText main = mapper.getMainText();
  	  String mainText = main.getResultContent();
  	  System.out.println("랜덤 메인 문장 :: " + mainText);
  	  
  	  // 솔루션 상 문장 받아오기
  	  ResultText solHigh = mapper.getHighText();
  	  String solHighText = solHigh.getResultContent();
  	  System.out.println("랜덤 솔루션 상 문장 :: " + solHighText);
  	  
  	  // 솔루션 하 받아오기
  	  ResultText solLow = mapper.getLowText();
  	  String solLowText = solLow.getResultContent();
  	  System.out.println("랜덤 솔루션 하 문장 :: " + solLowText);
  	  
  	  model.addAttribute("mainText", mainText);
	      model.addAttribute("solHighText", solHighText);
	      model.addAttribute("solLowText", solLowText);
  	  
  	  return "/test/result";
    }
}

