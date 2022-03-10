package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.vo.DeliveryVO;

// 내가 수신할 택배 정보 DAO
public class DeliveryDAO {
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;

	public void DB() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
			String dbid = "campus_d_5_0216";
			String dbpw = "smhrd5";
			conn = DriverManager.getConnection(url, dbid, dbpw);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void close() {
		try {
			if (rs != null) {
				rs.close();
			}
			if (psmt != null) {
				psmt.close();
			}
			if (conn != null) {
				conn.close();
			}

		} catch (Exception e2) {
			e2.printStackTrace();
		}
	}

	public int enroll_tracking_num(String delivery_no, String receiver_id, String delivery_status) {
		// delivery_no : 운송장번호, receiver_id : 받는 사람 아이디 (현재 로그인 한 유저겠지?),
		// delivery_status : 처리 구분
		int cnt = 0;
		try {
			DB();

			String sql = "insert into t_my_delivery (delivery_no, receiver_id, delivery_status, rq_seq,receipt_time) values (?, ?, ?, null, null)";
			// 쿼리문 rq_seq, receipt_time에 NULL값을 넣어준 이유를 각각 설명해놓을게요.
			// rq_seq 는 요청 순번 시퀀스인데, 택배 수신 정보 테이블에 딱히 관계가 없어보여서 일단 NULL 값을 넣어두는걸로 생각했습니다.
			// receipt_time은 택배 수령 시간을 의미하는데, 홈페이지에서 수령 완료 라는 버튼을 누르면 그 때 update 문으로 null값을
			// sysdate로 바꾸게 설계하면 될 것 같습니다.
			// 따라서 운송장 번호를 등록할 때 rq_seq, receipt_time에 null 을 넣어서 초기화 시키는게 맞다고 판단하였습니다.
			// 제가 잘못 생각했을수도있으니, 필요에따라서 수정해주시면 감사하겠습니다. - 종재
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, delivery_no);
			psmt.setString(2, receiver_id);
			psmt.setString(3, delivery_status);

			cnt = psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

	public ArrayList<DeliveryVO> select_tracking_num(String receiver_id) {
		ArrayList<DeliveryVO> al = new ArrayList<DeliveryVO>();
		try {
			DB();
			String sql = "select * from t_my_delivery where receiver_id = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, receiver_id);
			rs = psmt.executeQuery();

			while (rs.next()) {
				int delivery_seq = Integer.parseInt(rs.getString(1));
				String delivery_no = rs.getString(2);
				String receiver = rs.getString(3);
				String reg_date = rs.getString(4);
				String delivery_status = rs.getString(5);
				int rq_seq = 0;
				String receipt_time = rs.getString(7);
				DeliveryVO vo = new DeliveryVO(delivery_seq, delivery_no, receiver, reg_date, delivery_status,
						rq_seq, receipt_time);
				al.add(vo);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return al;
	}
	
	public int delete_tracking_num (String seq) {
		int cnt = 0;
		try {
			DB();
			String sql = "delete from t_my_delivery where my_delivery_seq = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, seq);
			cnt = psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
	
	public ArrayList<DeliveryVO> select_all_tracking_num() {
		ArrayList<DeliveryVO> al = new ArrayList<DeliveryVO>();
		try {
			DB();
			String sql = "select * from t_my_delivery";
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();

			while (rs.next()) {
				int delivery_seq = Integer.parseInt(rs.getString(1));
				String delivery_no = rs.getString(2);
				String receiver = rs.getString(3);
				String reg_date = rs.getString(4);
				String delivery_status = rs.getString(5);
				int rq_seq = 0;
				String receipt_time = rs.getString(7);
				DeliveryVO vo = new DeliveryVO(delivery_seq, delivery_no, receiver, reg_date, delivery_status,
						rq_seq, receipt_time);
				al.add(vo);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return al;
	}
}
