package test.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import test.member.dto.MemoDto;
import test.util.DbcpBean;

public class MemoDao {
	//참조값을 하나로 계속 쓰기위한 static 필드 선언
	private static MemoDao dao;
	
	//기본 생성자를 private로 선언(무한 객체 생성 방지용)
	private MemoDao() {}
	
	//자신의 참조값을 리턴해주는 메소드
	public static MemoDao getInstance() {
		if(dao == null) {
			dao = new MemoDao();
		}
		return dao;
	}
	//인자로 전달되는 번호에 해당하는 할일을 삭제 하는 메소드
	public boolean delete(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 sql 문 준비하기
			String sql = "DELETE FROM memo"
					+ " WHERE num = ?";
			pstmt = conn.prepareStatement(sql);
			//? 에 바인딩 할 값이 있으면 바인딩한다.
			pstmt.setInt(1, num);
			//sql 문 수행하고 update or insert or delete 된 row 의 개수 리턴받기
			flag = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		if (flag > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	//인자로 전달되는 할일 1개를 DB에 저장하고 성공 여부를 리턴하는 메소드
	public boolean insert(String content) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 sql 문 준비하기
			String sql = "INSERT INTO memo"
					+ " (num, content, regdate)"
					+ " VALUES(memo_seq.NEXTVAL, ?, SYSDATE)";
			pstmt = conn.prepareStatement(sql);
			//? 에 바인딩 할 값이 있으면 바인딩한다.
			pstmt.setString(1, content);
			//sql 문 수행하고 update or insert or delete 된 row 의 개수 리턴받기
			flag = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		if (flag > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	//회원 목록을 리턴해주는 메소드
	public List<MemoDto> getList(){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<MemoDto> list = new ArrayList<>();
		
		conn = new DbcpBean().getConn();
		String sql = "SELECT num, content, TO_CHAR(regdate , 'YYYY\"년 \"MM\"월 \"DD\"일 \"') AS regdate"
				+ " FROM memo"
				+ " ORDER BY num ASC";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				MemoDto dto = new MemoDto();
				dto.setNum(rs.getInt("num"));
				dto.setContent(rs.getString("content"));
				dto.setRegdate(rs.getString("regdate"));
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return list;
	}
}
