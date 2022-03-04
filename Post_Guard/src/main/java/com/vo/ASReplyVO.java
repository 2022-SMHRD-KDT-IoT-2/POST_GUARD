package com.vo;

public class ASReplyVO {

	// AS게시판 댓글 VO
	private int as_cmt_seq;
	private String mem_id;
	private String as_cmt_date;
	private String as_cmt_content;

	// ex) 2022/03/02 ADMIN 2022/03/03일 수거 예정입니다.
	public ASReplyVO(String as_cmt_content, String mem_id) {
		super();
		this.as_cmt_content = as_cmt_content;
		this.mem_id = mem_id;

	}

	public int getAs_cmt_seq() {
		return as_cmt_seq;
	}

	public String getMem_id() {
		return mem_id;
	}

	public String getAs_cmt_date() {
		return as_cmt_date;
	}

	public String getAs_cmt_content() {
		return as_cmt_content;
	}

}
