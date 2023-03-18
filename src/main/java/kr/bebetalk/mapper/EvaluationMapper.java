package kr.bebetalk.mapper;

import org.apache.ibatis.annotations.Select;

import kr.bebetalk.entity.Evaluation;

public interface EvaluationMapper {
	
	// 평가 추가
		@Select("insert into EvaluationTable(EvaluationDate, EvaluationName) values(NOW(), #{evaluationName})")
		public void newEva(String ev);
		
		// 지금 평가하는 애기 정보 가져오기
		public Evaluation getEva(String selectedValue);

//		// 현재 평가 애기의 결과 업데이트
//		public void updateRes(EvaluationResult evResult);
	

}