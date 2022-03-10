package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.vo.DeliveryVO;

// ���� ������ �ù� ���� DAO
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
		// delivery_no : ������ȣ, receiver_id : �޴� ��� ���̵� (���� �α��� �� ��������?),
		// delivery_status : ó�� ����
		int cnt = 0;
		try {
			DB();

			String sql = "insert into t_my_delivery (delivery_no, receiver_id, delivery_status, rq_seq,receipt_time) values (?, ?, ?, null, null)";
			// ������ rq_seq, receipt_time�� NULL���� �־��� ������ ���� �����س����Կ�.
			// rq_seq �� ��û ���� �������ε�, �ù� ���� ���� ���̺� ���� ���谡 ������� �ϴ� NULL ���� �־�δ°ɷ� �����߽��ϴ�.
			// receipt_time�� �ù� ���� �ð��� �ǹ��ϴµ�, Ȩ���������� ���� �Ϸ� ��� ��ư�� ������ �� �� update ������ null����
			// sysdate�� �ٲٰ� �����ϸ� �� �� �����ϴ�.
			// ���� ����� ��ȣ�� ����� �� rq_seq, receipt_time�� null �� �־ �ʱ�ȭ ��Ű�°� �´ٰ� �Ǵ��Ͽ����ϴ�.
			// ���� �߸� ������������������, �ʿ信���� �������ֽø� �����ϰڽ��ϴ�. - ����
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
