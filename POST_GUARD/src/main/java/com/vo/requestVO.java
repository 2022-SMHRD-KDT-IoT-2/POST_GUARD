package com.vo;

public class requestVO {
	
	private Double re_seq;
	private String mem_id;
	private Double company_seq;
	private String rq_datetime;
	private String rq_type;
	private String accept_time;
	private int pin;
	
	public requestVO(Double re_seq, String mem_id, Double company_seq, String rq_datetime, String rq_type, String accept_time,
			int pin) {
		super();
		this.re_seq = re_seq;
		this.mem_id = mem_id;
		this.company_seq = company_seq;
		this.rq_datetime = rq_datetime;
		this.rq_type = rq_type;
		this.accept_time = accept_time;
		this.pin = pin;
	}
	public Double getReseq() {
		return re_seq;
	}
	public String getMemid() {
		return mem_id;
	}
	public Double getCompanyseq() {
		return company_seq;
	}
	public String getRqdatetime() {
		return rq_datetime;
	}
	public String getRqtype() {
		return rq_type;
	}
	public String getAcceptTime() {
		return accept_time;
	}
	public int getPin() {
		return pin;
	}
	
	
	
}
