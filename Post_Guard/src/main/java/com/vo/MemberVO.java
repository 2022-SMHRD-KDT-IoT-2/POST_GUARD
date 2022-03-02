package com.vo;


// PostVO -> MemberVO 로 파일명 변경
// PostVO 라는 파일명 적절하지 않음.. VO객체 내용만 봐도 멤버관련된 필드들

public class MemberVO {
	private String mem_id;
	private String mem_pw;
	private String mem_name;
	private String mem_phone;
	private String mem_email;
	private String mem_addr;
	private String mem_joindate;
	private String admin_yesno;

	// MemberVO 생성자에 joindate, admin_yesno 는 필요하지 않다.
	// joindate는 사용자가 회원가입을 하면 자동으로 갱신되는 부분이고, admin 권한은 따로 DB에서 우리가 권한을 주는것이 적절함.
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
