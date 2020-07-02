package test.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.member.dto.MemberDto;
import test.util.DbcpBean;

public class MemberDao {
	//자신의 참조값을 담을 static 필드
	private static MemberDao dao;
	//외부에서 객체 생성할 수 없도록 생성자의 접근 지정자를 private 로
	private MemberDao() {}
	//자신의 참조값을 리턴해주는 static 메소드
	public static MemberDao getInstance() {
		if(dao == null) {//최초 호출될때는
			//객체를 생성해서 static 필드에 참조값을 저장해 놓는다.
			dao = new MemberDao();
		}
		return dao;
	}
	
	//회원 목록을 리턴해주는 메소드
	public List<MemberDto> getList(){
		List<MemberDto> list = new ArrayList<>();
		
		//필요한 객체의 참조값을 담을 지역변수 만들기
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//Connection 객체의 참조값 얻어오기
			conn = new DbcpBean().getConn();
			//실행할 sql 문 준비하기
			String sql = "SELECT num,name,addr"
					+ " FROM member"
					+ " ORDER BY num ASC";
			pstmt = conn.prepareStatement(sql);
			//sql 문에 ? 에 바인딩할 값이 있으면 바인딩하고
			
			//select 문 수행하고 결과 받아오기
			rs = pstmt.executeQuery();
			//반복문 돌면서 결과 값 추출하기
			while(rs.next()) {
				//row 하나의 정보를 Dto 객체에 담고
				MemberDto dto = new MemberDto();
				dto.setNum(rs.getInt("num"));
				dto.setName(rs.getString("name"));
				dto.setAddr(rs.getString("addr"));
				//Dto 의 참조값을 ArrayList 객체에 누적 시킨다.
				list.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception e) {}
		}
		//ArrayList 객체의 참조값을 리턴해준다.
		return list;
	}
}
