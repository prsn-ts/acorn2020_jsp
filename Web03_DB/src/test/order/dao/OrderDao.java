package test.order.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.order.dto.OrderDto;
import test.util.DbcpBean;

public class OrderDao {
	//필드
	private static OrderDao dao;
	
	//외부에서 객체 생성할 수 없도록 생성자의 접근 지정자를 private 로
	private OrderDao() {}
	
	//static 메소드
	public static OrderDao getInstance() {
		if(dao == null) {
			dao = new OrderDao();
		}
		return dao;
	}
	
	//주문 리스트를 가져오는 메소드
	public List<OrderDto> getList(){
		OrderDto dto = null;
		//필요한 객체의 참조값을 담을 지역변수 만들기 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		//OrderDto의 정보를 담을 리스트 배열 생성.
		List<OrderDto> list = new ArrayList<>();
		try {
			//Connection 객체의 참조값 얻어오기 
			conn = new DbcpBean().getConn();
			//실행할 sql 문 준비하기
			String sql = "SELECT num, price, menu, time"
					+ " FROM orderlist"
					+ " ORDER BY num ASC";
			pstmt = conn.prepareStatement(sql);
			//sql 문에 ? 에 바인딩할 값이 있으면 바인딩하고 

			//select 문 수행하고 결과 받아오기 
			rs = pstmt.executeQuery();
			//반복문 돌면서 결과 값 추출하기 
			while (rs.next()) {
				dto = new OrderDto();
				dto.setNum(rs.getInt("num"));
				dto.setPrice(rs.getInt("price"));
				dto.setMenu(rs.getString("menu"));
				dto.setTime(rs.getString("time"));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		return list;
	}
}
