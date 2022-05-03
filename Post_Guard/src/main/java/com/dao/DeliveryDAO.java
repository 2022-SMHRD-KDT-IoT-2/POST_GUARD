package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
	
	public int enroll_tracking_num (int delivery_no, String receiver_id, String delivery_status) {
		// delivery_no : ������ȣ, receiver_id : �޴� ��� ���̵� (���� �α��� �� ��������?), delivery_status : ó�� ����
		int cnt = 0;
		try {
			DB();
			
			String sql = "insert into t_my_delivery (delivery_no, receiver_id, delivery_status, rq_seq,receipt_time) values (?, ?, ?, null, null)";
			// ������ rq_seq, receipt_time�� NULL���� �־��� ������ ���� �����س����Կ�.
			// rq_seq �� ��û ���� �������ε�, �ù� ���� ���� ���̺� ���� ���谡 ������� �ϴ� NULL ���� �־�δ°ɷ� �����߽��ϴ�.
			// receipt_time�� �ù� ���� �ð��� �ǹ��ϴµ�, Ȩ���������� ���� �Ϸ� ��� ��ư�� ������ �� �� update ������ null���� sysdate�� �ٲٰ� �����ϸ� �� �� �����ϴ�.
			// ���� ����� ��ȣ�� ����� ��  rq_seq, receipt_time�� null �� �־ �ʱ�ȭ ��Ű�°� �´ٰ� �Ǵ��Ͽ����ϴ�.
			// ���� �߸� ������������������, �ʿ信���� �������ֽø� �����ϰڽ��ϴ�. - ����
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, delivery_no);
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
}
