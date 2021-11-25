package com.bc.chaeum.member.service;

import java.sql.Date;

public class MemberVO {
	private String email;
	private String m_pass;
	private String nickname;
	private String phone;
	private String birth;
	private String rank;
	private String email1;
	private String email2;
	private String ch1;
	private String ch2;
	private Date m_regdate;
	private String m_useable;
	private String rememberEmail;
	 
	
	public MemberVO() {}
	public MemberVO(String email, String m_pass, String nickname, String phone, Date m_regdate, String rank,
			String birth, String m_useable) {
		super();
		this.email = email;
		this.m_pass = m_pass;
		this.nickname = nickname;
		this.phone = phone;
		this.m_regdate = m_regdate;
		this.rank = rank;
		this.birth = birth;
		this.m_useable = m_useable;
	}
	
	

	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getM_pass() {
		return m_pass;
	}
	public void setM_pass(String m_pass) {
		this.m_pass = m_pass;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getRank() {
		return rank;
	}
	public void setRank(String rank) {
		this.rank = rank;
	}
	public String getEmail1() {
		return email1;
	}
	public void setEmail1(String email1) {
		this.email1 = email1;
	}
	public String getEmail2() {
		return email2;
	}
	public void setEmail2(String email2) {
		this.email2 = email2;
	}
	public String getCh1() {
		return ch1;
	}
	public void setCh1(String ch1) {
		this.ch1 = ch1;
	}
	public String getCh2() {
		return ch2;
	}
	public void setCh2(String ch2) {
		this.ch2 = ch2;
	}
	public Date getM_regdate() {
		return m_regdate;
	}
	public void setM_regdate(Date m_regdate) {
		this.m_regdate = m_regdate;
	}
	public String getM_useable() {
		return m_useable;
	}
	public void setM_useable(String m_useable) {
		this.m_useable = m_useable;
	}
	@Override
	public String toString() {
		return "MemberVO [email=" + email + ", m_pass=" + m_pass + ", nickname=" + nickname + ", phone=" + phone
				+ ", birth=" + birth + ", rank=" + rank + ", email1=" + email1 + ", email2=" + email2 + ", ch1=" + ch1
				+ ", ch2=" + ch2 + ", m_regdate=" + m_regdate + ", m_useable=" + m_useable + "]";
	}
	public String getRememberEmail() {
		return rememberEmail;
	}
	public void setRememberEmail(String rememberEmail) {
		this.rememberEmail = rememberEmail;
	}
	
	
	
	
}
