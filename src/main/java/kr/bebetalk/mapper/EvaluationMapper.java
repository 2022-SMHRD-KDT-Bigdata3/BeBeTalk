package kr.bebetalk.mapper;

import kr.bebetalk.entity.Evaluation;

public interface EvaluationMapper {
	
	// 평가 추가
	public void newEva(String ev);

	public Evaluation getEva(String selectedValue);
	

}