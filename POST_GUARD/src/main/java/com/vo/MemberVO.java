package com.vo;


// PostVO -> MemberVO �� ���ϸ� ����
// PostVO ��� ���ϸ� �������� ����.. VO��ü ���븸 ���� ������õ� �ʵ��

public class MemberVO {
	private String mem_id;
	private String mem_pw;
	private String mem_name;
	private String mem_phone;
	private String mem_email;
	private String mem_addr;
	private String mem_joindate;
	private String admin_yesno;

	// MemberVO �����ڿ� joindate, admin_yesno �� �ʿ����� �ʴ�.
	// joindate�� ����ڰ� ȸ�������� �ϸ� �ڵ����� ���ŵǴ� �κ��̰�, admin ������ ���� DB���� �츮�� ������ �ִ°��� ������.
	public MemberVO(String mem_id, String mem_pw, String mem_name, String mem_phone, String mem_email, String mem_addr) {
		super();
		this.mem_id = mem_id;
		this.mem_pw = mem_pw;
		this.mem_name = mem_name;
		this.mem_phone = mem_phone;
		this.mem_email = mem_email;
		this.mem_addr = mem_addr;
	}

	public String getMem_id() {
		return mem_id;
	}

	public String getMem_pw() {
		return mem_pw;
	}

	public String getMem_name() {
		return mem_name;
	}

	public String getMem_phone() {
		return mem_phone;
	}

	public String getMem_email() {
		return mem_email;
	}

	public String getMem_addr() {
		return mem_addr;
	}

	public String getMem_joindate() {
		return mem_joindate;
	}

	public String getAdmin_yesno() {
		return admin_yesno;
	}

}
