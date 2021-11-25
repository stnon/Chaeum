package com.bc.chaeum.admin.service;

public class AdminVO {
	
	//통계 조회
	//> 매출 통계
	private int branchid; //지점 아이디
	private String branchname; //지점 이름
	private int monthsale; //지점별 월 매출 총액
	private int daysale; //지점별 일 매출 총액
	
	//> 회원 통계
	private int regcnt; //월별 가입자수
	private int visitcnt; //월별 회원 방문자수
	
	//현재날짜 데이터
	private int year;
	private int month;
	private int day;
	
	//생성자
	public AdminVO() {
		super();
	}

	

	public AdminVO(int branchid, String branchname, int monthsale, int daysale, int regcnt, int visitcnt, int year,
			int month, int day) {
		super();
		this.branchid = branchid;
		this.branchname = branchname;
		this.monthsale = monthsale;
		this.daysale = daysale;
		this.regcnt = regcnt;
		this.visitcnt = visitcnt;
		this.year = year;
		this.month = month;
		this.day = day;
	}



	//게터 세터
	public int getBranchid() {
		return branchid;
	}

	public void setBranchid(int branchid) {
		this.branchid = branchid;
	}

	public String getBranchname() {
		return branchname;
	}

	public void setBranchname(String branchname) {
		this.branchname = branchname;
	}

	public int getMonthsale() {
		return monthsale;
	}

	public void setMonthsale(int monthsale) {
		this.monthsale = monthsale;
	}

	public int getDaysale() {
		return daysale;
	}

	public void setDaysale(int daysale) {
		this.daysale = daysale;
	}

	public int getRegcnt() {
		return regcnt;
	}

	public void setRegcnt(int regcnt) {
		this.regcnt = regcnt;
	}

	public int getVisitcnt() {
		return visitcnt;
	}

	public void setVisitcnt(int visitcnt) {
		this.visitcnt = visitcnt;
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}
	
	public int getMonth() {
		return month;
	}

	public void setMonth(int month) {
		this.month = month;
	}

	public int getDay() {
		return day;
	}

	public void setDay(int day) {
		this.day = day;
	}

	@Override
	public String toString() {
		return "AdminVO [branchid=" + branchid + ", branchname=" + branchname + ", monthsale=" + monthsale
				+ ", daysale=" + daysale + ", regcnt=" + regcnt + ", visitcnt=" + visitcnt + ", year=" + year
				+ ", month=" + month + ", day=" + day + "]";
	}

	
}