package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.vo.ASReplyVO;
import com.vo.ASVO;

public class ASDAO {

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

	// AS게시판 DAO
	// 조회수 증가 기능
	public void updateAS_cnt(int as_seq) {

		try {
			DB();

			String sql = "UPDATE T_AS SET AS_CNT = AS_CNT+1 WHERE AS_SEQ = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, as_seq);

			psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			try {
				close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}

		}
	}

	// 제목 클릭했을 때 내용 보여주는 기능
	public ASVO getAS_content(int as_seq) {

		ASVO vo = null;

		try {

			DB();

			String sql = "SELECT AS_DATE, AS_CATEGORY, AS_TITLE, MEM_ID, AS_CONTENT FROM T_AS WHERE AS_SEQ = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, as_seq);

			rs = psmt.executeQuery();

			if (rs.next()) {

				String getAs_category = rs.getString(1);
				String getAs_title = rs.getString(2);
				String getMem_id = rs.getString(3);
				String getAs_content = rs.getString(4);

				vo = new ASVO(getAs_category, getAs_title, getMem_id, getAs_content);

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			try {
				close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}

		}
		return vo;
	}

	// 댓글 보여주는 기능
	public ArrayList<ASReplyVO> getAS_cmt_content(int as_seq) {

		ArrayList<ASReplyVO> arr_vo = new ArrayList<ASReplyVO>();

		try {

			DB();

			String sql = "select AS_CMT_DATE, MEM_ID, AS_CMT_CONTENT from T_AS_CMT where AS_CMT_SEQ = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, as_seq);

			rs = psmt.executeQuery();

			while (rs.next()) {

				String getAS_cmt_content = rs.getString(1);
				String getMem_id = rs.getString(2);

				ASReplyVO vo = new ASReplyVO(getAS_cmt_content, getMem_id);
				arr_vo.add(vo);

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			try {
				close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}

		}
		return arr_vo;
	}

	// AS게시판 목록
	public ArrayList<ASVO> getAS_list() {

		ArrayList<ASVO> arr_vo = new ArrayList<ASVO>();

		try {

			DB();

			String sql = "select as_seq, as_category, as_title, mem_id, as_date, as_cnt from t_as";
			psmt = conn.prepareStatement(sql);

			psmt.executeUpdate();
			rs = psmt.executeQuery();

			while (rs.next()) {

				int getAS_seq = rs.getInt(1);
				String getAS_category = rs.getString(2);
				String getAS_title = rs.getString(3);
				String getMem_id = rs.getString(4);
				String getAS_date = rs.getString(5);
				int getAS_cnt = rs.getInt(6);

				ASVO vo = new ASVO(getAS_seq, getAS_category, getAS_title, getMem_id, getAS_date, getAS_cnt);
				arr_vo.add(vo);

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			try {
				close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}

		}
		return arr_vo;

	}

	// AS게시판에 글 등록!
	public int write_AS(String as_category, String as_title, String as_content, String as_file, String mem_id, String as_date) {

		int cnt = 0;

		try {

			DB();

			String sql = "insert into t_as values(as_seq.nextval, ?, ?, sysdate, ?, ?, ?)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, as_title);
			psmt.setString(2, as_content);
			psmt.setString(3, as_file);
			psmt.setString(4, mem_id);
			psmt.setString(5, as_category);

			cnt = psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			try {
				close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}

		}
		return cnt;

	}
}
