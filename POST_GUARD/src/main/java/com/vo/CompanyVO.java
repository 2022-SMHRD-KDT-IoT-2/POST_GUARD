package com.vo;


//
public class CompanyVO {
	private int company_seq;
	private String company_name;
	private String company_addr;
	private String company_tel;
	private String company_ceo;
	private String company_homepage;
	
	public CompanyVO(int company_seq, String company_name, String company_addr, String company_tel,
			String company_ceo, String company_homepage) {
		super();
		this.company_seq = company_seq;
		this.company_name = company_name;
		this.company_addr = company_addr;
		this.company_tel = company_tel;
		this.company_ceo = company_ceo;
		this.company_homepage = company_homepage;
	}
	public int getCompany_seq() {
		return company_seq;
	}
	public String getCompany_name() {
		return company_name;
	}
	public String getCompany_addr() {
		return company_addr;
	}
	public String getCompany_tel() {
		return company_tel;
	}
	public String getCompany_ceo() {
		return company_ceo;
	}
	public String getCompany_homepage() {
		return company_homepage;
	}

	
}
