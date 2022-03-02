package com.vo;

public class FaqVO {

	private int article_seq;
	private String article_title;
	private String article_content;
	private String article_date;
	private String article_file;
	private int article_cnt;
	private String mem_id;
	

	public FaqVO(int article_seq, String article_title, String mem_id, int article_cnt) {
		super();
		this.article_seq = article_seq;
		this.article_title = article_title;
		this.mem_id = mem_id;
		this.article_cnt = article_cnt;
	}

	public int getArticle_seq() {
		return article_seq;
	}

	public String getArticle_title() {
		return article_title;
	}

	public String getArticle_content() {
		return article_content;
	}

	public String getArticle_date() {
		return article_date;
	}

	public String getArticle_file() {
		return article_file;
	}

	public int getArticle_cnt() {
		return article_cnt;
	}

	public String getMem_id() {
		return mem_id;
	}

}
