package kr.bebetalk.mapper;


import java.util.List;

import kr.bebetalk.entity.Testee;


public interface TesteeMapper {
	
	// 아이 등록
	public void childInsert(Testee tt);
	
	
	// 아이 목록 불러오기
	public List<Testee> childList(Testee tt);

}