package kr.bebetalk.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import kr.bebetalk.entity.Testee;


public interface TesteeMapper {
	
		// 아이 등록
		@Insert("insert into TesteeTable(TesteeID, TestKidsNick, TesteeBirth, TesteeSex) values( #{testeeID}, #{testKidsNick}, #{testeeBirth}, #{testeeSex})")
		public void childInsert(Testee tt);

		// 자녀 선택 페이지 아이 목록 불러오기
		@Select("select * from TesteeTable where TesteeID = #{testeeID}")
		public List<Testee> childList(Testee tt);
		
		// 마이 페이지 아이 목록 불러오기
		@Select("select * from TesteeTable where TesteeID = #{testeeID}")
		public List<Testee> myList(Testee tt);

		// 진행중인 아이의 정보 가져오기
		@Select("select * from TesteeTable where TestKidsNick=#{selectedValue};")
		public Testee getBirth(String selectedValue);



}