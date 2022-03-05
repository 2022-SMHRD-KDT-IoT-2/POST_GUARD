package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.vo.ASReplyVO;
import com.vo.ASVO;

// AS게시판 DAO (글+댓글) 
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

	// AS게시판 목록
	public ArrayList<ASVO> getAS_list() {

		ArrayList<ASVO> arr_vo = new ArrayList<ASVO>();

		try {

			DB();

			String sql = "select AS_SEQ, AS_CATEGORY, AS_TITLE, MEM_ID, AS_DATE, AS_CNT from T_AS";
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

	// AS 게시판에 글 등록
	public int write_AS(String as_category, String as_title, String as_content, String mem_id
			) {

		int cnt = 0;

		try {

			DB();

			String sql = "insert into T_AS (as_title, as_content, as_date, as_file, as_cnt, mem_id, as_category, as_progress) values (?, ?, sysdate, 'noFile', 0, ?, ?, '진행중')";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, as_title);
			psmt.setString(2, as_content);
			psmt.setString(3, "noFile");
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

	// 조회수 증가 기능
	public void updateAS_cnt(int as_seq) {

		try {
			DB();

			String sql = "update T_AS set AS_CNT = AS_CNT+1 where AS_SEQ = ?";
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
	public ArrayList<ASVO> getAS_content(int as_seq) {
		ArrayList<ASVO> arr_vo = new ArrayList<ASVO>();

		try {

			DB();

			String sql = "select * from T_AS where AS_SEQ = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, as_seq);

			rs = psmt.executeQuery();

			if (rs.next()) {

				String getAs_category = rs.getString(1);
				String getAs_title = rs.getString(2);
				String getMem_id = rs.getString(3);
				String getAs_content = rs.getString(4);

				ASVO vo = new ASVO(getAs_category, getAs_title, getMem_id, getAs_content);
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

	// 글 수정
	public void update_AS(String as_category, String as_title, String as_content, String as_file, int as_seq) {
		try {

			DB();

			String sql = "update T_AS set AS_TITLE=?, AS_CONTENT=?, AS_FILE=?, AS_CATEGORY =? where AS_SEQ = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, as_title);
			psmt.setString(2, as_content);
			psmt.setString(3, as_file);
			psmt.setString(4, as_category);
			psmt.setInt(5, as_seq);

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

	// 글 삭제
	public int delete_AS(int as_seq) {
		int cnt = 0; 
		int doneDelete = 0;
		try {

			DB();
			
			String sql_AS = "delete from T_AS where =" + as_seq;
			psmt = conn.prepareStatement(sql_AS);
			doneDelete = psmt.executeUpdate();
			
			if(doneDelete > 0) {
				String sql_AS_cmt = "delete from T_AS_COMMENT where AS_SEQ=" + as_seq;
				psmt = conn.prepareStatement(sql_AS_cmt);
				cnt = psmt.executeUpdate();
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
		return cnt; 
	}

	// 댓글 보여주는 기능
	public ArrayList<ASReplyVO> getAS_cmt_content(int as_cmt_seq, String mem_id, String as_cmt_content) {

		ArrayList<ASReplyVO> arr_vo = new ArrayList<ASReplyVO>();

		try {

			DB();

			String sql = "select * from T_AS_COMMENT where AS_CMT_SEQ = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, as_cmt_seq);

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

	//댓글 작성 
	public int write_AS_cmt(String as_cmt_content, String mem_id) {

		int cnt = 0;

		try {

			DB();

			String sql = "insert into T_AS_COMMENT values(as_cmt_seq.nextval, ?, ?, sysdate)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, mem_id);
			psmt.setString(2, as_cmt_content);

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

	// 댓글 수정
	public void update_AS_cmt(String as_cmt_content, int as_cmt_seq) {
		try {

			DB();

			String sql = "update T_AS_COMMENT set AS_CMT_CONTENT=? where AS_CMT_SEQ = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, as_cmt_content);
			psmt.setInt(2, as_cmt_seq);

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

	// 댓글 삭제
	public void delete_AS_cmt(int as_cmt_seq) {

		try {

			DB();

			String sql = "delete from T_AS where AS_CMT_SEQ = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, as_cmt_seq);

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

}
