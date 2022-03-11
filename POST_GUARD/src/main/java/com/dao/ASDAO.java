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

			String sql = "select AS_SEQ, AS_CATEGORY, AS_TITLE, MEM_ID, AS_PROGRESS from T_AS";
			psmt = conn.prepareStatement(sql);

			psmt.executeUpdate();
			rs = psmt.executeQuery();

			while (rs.next()) {

				int getAS_seq = rs.getInt(1);
				String getAS_category = rs.getString(2);
				String getAS_title = rs.getString(3);
				String getMem_id = rs.getString(4);
				String getAS_progress = rs.getString(5);

				ASVO vo = new ASVO(getAS_seq, getAS_category, getAS_title, getMem_id, getAS_progress);
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
	public int write_AS(String as_category, String as_title, String as_content, String mem_id) {

		int cnt = 0;

		try {

			DB();

			String sql = "insert into T_AS (as_title, as_content, as_date, as_file, as_cnt, mem_id, as_category, as_progress) values (?, ?, sysdate, 'noFile', 0, ?, ?, '진행중')";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, as_title);
			psmt.setString(2, as_content);
			psmt.setString(3, mem_id);
			psmt.setString(4, as_category);

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
	public ASVO getAS_datail(int as_seq) {
		ASVO vo = null;

		try {

			DB();

			String sql = "select as_title, as_content, as_date, mem_id, as_category from T_AS where AS_SEQ = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, as_seq);

			rs = psmt.executeQuery();

			while (rs.next()) {

				String getAs_title = rs.getString(1);
				String getAs_content = rs.getString(2);
				String getAs_date = rs.getString(3);
				String getMem_id = rs.getString(4);
				String getAs_category = rs.getString(5);

				vo = new ASVO(getAs_category, getAs_title, getMem_id, getAs_content, getAs_date);
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

//	// 진행상황 반환하는 메서드
//	public void show_progress(String mem_id) {
//		try {
//
//			DB();
//
//			String sql = "select as_progress from t_as where mem_id = ?";
//			psmt = conn.prepareStatement(sql);
//			psmt.setString(1, mem_id);
//
//			psmt.executeQuery();
//			
//			if()
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//
//			try {
//				close();
//			} catch (Exception e2) {
//				e2.printStackTrace();
//			}
//		}
//	}

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

	public int update_AS_progress(int as_seq, String as_progress) {
		int cnt = 0;
		try {

			DB();

			String sql = "update T_AS set as_progress = ? where AS_SEQ = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, as_progress);
			psmt.setInt(2, as_seq);
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

	// 글 삭제
	public int delete_AS(int as_seq) {
		int cnt = 0;
		int doneDelete = 0;
		try {

			DB();

			
			String sql_AS_cmt = "delete from T_AS_COMMENT where AS_SEQ=" + as_seq;
			psmt = conn.prepareStatement(sql_AS_cmt);
			doneDelete = psmt.executeUpdate();

			if (doneDelete > 0) {
				// 댓글이 있는 경우
				String sql_AS = "delete from T_AS where as_seq =" + as_seq;
				psmt = conn.prepareStatement(sql_AS);
				cnt = psmt.executeUpdate();
			} else {
				// 댓글이 없는 경우
				String sql_AS = "delete from T_AS where as_seq =" + as_seq;
				psmt = conn.prepareStatement(sql_AS);
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
	public ArrayList<ASReplyVO> getAS_cmt_content(int as_seq) {
		ArrayList<ASReplyVO> al = new ArrayList<ASReplyVO>(); 

		try {

			DB();

			String sql = "select mem_id, AS_cmt_content, as_cmt_date from t_as_comment where AS_SEQ = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, as_seq);

			rs = psmt.executeQuery();

			while (rs.next()) {

				String mem_id = rs.getString(1);
				String getAS_cmt_content = rs.getString(2);
				String getAs_cmt_date = rs.getString(3);

				ASReplyVO replyvo = new ASReplyVO(getAs_cmt_date, getAS_cmt_content, mem_id);
				al.add(replyvo);

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
		return al;
	}

	// 댓글 작성
	public int write_AS_cmt(int as_seq, String comment, String mem_id) {

		int cnt = 0;

			try {
	
				DB();
	
				String sql = "insert into T_AS_COMMENT (as_cmt_seq, as_seq, as_cmt_content, mem_id, as_cmt_date) values (as_cmt_seq.nextval, ?, ?, ?, sysdate)";
				psmt = conn.prepareStatement(sql);
				psmt.setInt(1, as_seq);
				psmt.setString(2, comment);
				psmt.setString(3, mem_id);
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
	public int delete_AS_cmt(int as_cmt_seq) {
		int cnt = 0;
		try {

			DB();

			String sql = "delete from T_AS_COMMENT where AS_CMT_SEQ = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, as_cmt_seq);

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
