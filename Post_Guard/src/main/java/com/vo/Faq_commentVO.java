package com.vo;

public class Faq_commentVO {
	private int cmt_seq;
	private int article_seq;
	private String cmt_content;
	private String cmt_date;
	private String mem_id;
	
	public Faq_commentVO(int article_seq, String cmt_content, String mem_id) {
		super();
		this.article_seq = article_seq;
		this.cmt_content = cmt_content;
		this.mem_id = mem_id;
	}

	public int getCmt_seq() {
		return cmt_seq;
	}

	public int getArticle_seq() {
		return article_seq;
	}

	public String getCmt_content() {
		return cmt_content;
	}

	public String getCmt_date() {
		return cmt_date;
	}

	public String getMem_id() {
		return mem_id;
	}
	
	
}





