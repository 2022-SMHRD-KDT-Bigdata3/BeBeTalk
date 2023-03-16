package kr.bebetalk.controller;

import kr.bebetalk.entity.Result;
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
    
    @RequestMapping("/result2.do")
    public String resultPage() {
        
        return "/test/result";
    }
}

