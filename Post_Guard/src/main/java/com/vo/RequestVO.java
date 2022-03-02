package com.vo;


// 택배 수거 요청할 때 필요한 정보를 담고 있는 객체
public class RequestVO {
	
	private int req_seq;
	private String mem_id;
	private Double company_seq;
	private String req_datetime;
	private String req_type;
	private String accept_time;
	private int pin;
	
	public RequestVO(int req_seq, String mem_id, Double company_seq, String req_datetime, String req_type, String accept_time,
			int pin) {
		super();
		this.req_seq = req_seq;
		this.mem_id = mem_id;
		this.company_seq = company_seq;
		this.req_datetime = req_datetime;
		this.req_type = req_type;
		this.accept_time = accept_time;
		this.pin = pin;
	}
	public int getReseq() {
		return req_seq;
	}
	public String getMemid() {
		return mem_id;
	}
	public Double getCompanyseq() {
		return company_seq;
	}
	public String getRqdatetime() {
		return req_datetime;
	}
	public String getRqtype() {
		return req_type;
	}
	public String getAcceptTime() {
		return accept_time;
	}
	public int getPin() {
		return pin;
	}
	
	
	
}
