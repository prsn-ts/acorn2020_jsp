package com.gura.spring04.member.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gura.spring04.member.dto.MemberDto;

// Component scan 을 했을 때 bean 이 되도록 어노테이션을 붙인다.
// Dao 에는 @Repository 라는 어노테이션을 붙인다.
@Repository
public class MemberDao {
	//spring 이 관리 하고 있는 객체를 주입(Dependency Injection) 받으려면 @Autowired 어노테이션을 붙인다.
	//spring 이 관리 하고 있는 객체 중에서 SqlSession type 이 존재하면 자동 주입된다.
	//@Autowired는 런타임시에 bean에 존재하는 객체를 내부적으로 setter 또는 getter를 만들어서 값을 저장 및 추출한다.
	@Autowired
	private SqlSession session;
	
	//insert,select 등의 sql 작업을 SqlSession을 이용해서 처리
	
	//회원 한명의 정보를 저장하는 메소드
	public void insert(MemberDto dto) {
		session.insert("member.insert", dto);
	}
	
	//회원 한명의 정보를 삭제하는 메소드
	public void delete(int num) {
		session.delete("member.delete", num);
	}
	
	//회원 한명의 정보를 리턴하는 메소드
	public MemberDto getData(int num) {
		MemberDto dto = session.selectOne("member.getData", num);
		return dto;
	}
}
