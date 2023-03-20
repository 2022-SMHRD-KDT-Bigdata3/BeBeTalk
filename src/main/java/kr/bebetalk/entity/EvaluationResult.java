package kr.bebetalk.entity;

import lombok.Data;

// Lombok API 연결
@Data
public class EvaluationResult {

	private String evaluationNum; // 평가 번호
	private String evaluationResult; // 평가 결과	
	
	public EvaluationResult(String testNum, String mainText) {
		
		this.evaluationNum = testNum;
		this.evaluationResult = mainText;
	}

}
