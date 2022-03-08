package com.vo;

public class ASVO {

	//AS�Խ����Դϴ�. 
	private int as_seq;
	private String as_title;
	private String as_content;
	private String as_date;
	private String as_file;
	private int as_cnt;
	private String mem_id;
	private String as_category;
	private String as_progress; 

	// as��û ����, ī�װ�, ����, �ۼ���, as��û �ð� �����ִ� method
	// ex) 01  [������û]  �Ҹ��� �ȳ��Ϳ�  yyyyy  22/03/02  ��ȸ��
	public ASVO(int as_seq, String as_category, String as_title, String mem_id, String as_date, int as_cnt) {
		super();
		this.as_seq = as_seq;
		this.as_category = as_category;
		this.as_title = as_title;
		this.mem_id = mem_id;
		this.as_date = as_date;
		this.as_cnt = as_cnt;
	}

	// asī�װ�, ����, �ۼ���, ���� �����ִ� method
	public ASVO (String as_category, String as_title, String mem_id, String as_content, String as_progress) {
		super();
		this.as_category = as_category;
		this.as_title = as_title;
		this.mem_id = mem_id;
		this.as_content = as_content;
		this.as_progress=as_progress; 
	}
	
	public ASVO (int as_seq, String as_category, String as_title, String mem_id, String as_progress) {
		super();
		this.as_seq = as_seq;
		this.as_category = as_category;
		this.as_title = as_title;
		this.mem_id = mem_id;
		this.as_progress = as_progress;
	}
	
	public ASVO(int as_seq, String as_title) {
		super();
		this.as_seq=as_seq; 
	}

	public int getAs_seq() {
		return as_seq;
	}

	public String getAs_title() {
		return as_title;
	}

	public String getAs_content() {
		return as_content;
	}

	public int getAs_cnt() {
		return as_cnt;
	}

	public String getMem_id() {
		return mem_id;
	}

	public String getAs_category() {
		return as_category;
	}
	
	public String getAs_progress() {
		return as_progress; 
	}

}
