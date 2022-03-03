package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import com.vo.Faq_commentVO;

public class Faq_commentDAO {
	Connection conn = null;
	PreparedStatement psmt = null;
	
	public int Faq_comment(int article_seq, String cmt_content, String mem_id) {
		int cnt = 0;	
		try {

		Class.forName("oracle.jdbc.driver.OracleDriver");

		String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		String dbid = "hr";
		String dbpw = "hr";

		conn = DriverManager.getConnection(url, dbid, dbpw);

		String sql = "insert into t_faq_comment values(cmt_seq.nextval, ?, ?, sysdate, ?)";
		psmt = conn.prepareStatement(sql);
		psmt.setInt(1, article_seq);
		psmt.setString(2, cmt_content);
		psmt.setString(3,mem_id);
		

		cnt = psmt.executeUpdate();
		
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
			psmt.close();
			conn.close();
			}
			catch(Exception e2) {
				e2.printStackTrace();
			}
		}
		return cnt;
		
	}
}
	

