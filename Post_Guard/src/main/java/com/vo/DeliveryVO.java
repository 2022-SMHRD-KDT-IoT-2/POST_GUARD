package com.vo;

public class DeliveryVO {
	private int my_delivery_seq;
	private String delivery_no;
	private int receiver_id;
	private String reg_date;
	private char delivery_status;
	private int rq_seq;
	private String receipt_time;
	
	
	
	public DeliveryVO(int my_delivery_seq, String delivery_no, int receiver_id, String reg_date, char delivery_status,
			int rq_seq, String receipt_time) {
		super();
		this.my_delivery_seq = my_delivery_seq;
		this.delivery_no = delivery_no;
		this.receiver_id = receiver_id;
		this.reg_date = reg_date;
		this.delivery_status = delivery_status;
		this.rq_seq = rq_seq;
		this.receipt_time = receipt_time;
	}
	
	public int getMy_delivery_seq() {
		return my_delivery_seq;
	}
	public String getDelivery_no() {
		return delivery_no;
	}
	public int getReceiver_id() {
		return receiver_id;
	}
	public String getReg_date() {
		return reg_date;
	}
	public char getDelivery_status() {
		return delivery_status;
	}
	public int getRq_seq() {
		return rq_seq;
	}
	public String getReceipt_time() {
		return receipt_time;
	}
	
	
}
