package com.bc.chaeum.branch.service;


public class BranchVO {
	private int branch_id;
	private String branch_name;
	private String branch_addr;
	private String branch_tel;
	private String branch_info;
	private double branch_latitude;
	private double branch_longitude;
	public BranchVO() {
		System.out.println(">> BranchVO() 객체생성");
	}
	
	public int getBranch_id() {
		return branch_id;
	}
	public void setBranch_id(int branch_id) {
		this.branch_id = branch_id;
	}
	public String getBranch_name() {
		return branch_name;
	}
	public void setBranch_name(String branch_name) {
		this.branch_name = branch_name;
	}
	public String getBranch_addr() {
		return branch_addr;
	}
	public void setBranch_addr(String branch_addr) {
		this.branch_addr = branch_addr;
	}
	public String getBranch_tel() {
		return branch_tel;
	}
	public void setBranch_tel(String branch_tel) {
		this.branch_tel = branch_tel;
	}
	
	
	public String getBranch_info() {
		return branch_info;
	}

	public void setBranch_info(String branch_info) {
		this.branch_info = branch_info;
	}
	
	

	public double getBranch_latitude() {
		return branch_latitude;
	}

	public void setBranch_latitude(double branch_latitude) {
		this.branch_latitude = branch_latitude;
	}

	public double getBranch_longitude() {
		return branch_longitude;
	}

	public void setBranch_longitude(double branch_longitude) {
		this.branch_longitude = branch_longitude;
	}

	@Override
	public String toString() {
		return "BranchVO [branch_id=" + branch_id + ", branch_name=" + branch_name + ", branch_addr=" + branch_addr
				+ ", branch_tel=" + branch_tel + ", branch_info=" + branch_info + ", branch_latitude=" + branch_latitude
				+ ", branch_longitude=" + branch_longitude + "]";
	}

	
	
	
}
