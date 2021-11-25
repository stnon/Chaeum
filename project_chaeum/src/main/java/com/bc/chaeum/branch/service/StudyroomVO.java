package com.bc.chaeum.branch.service;

public class StudyroomVO {
	private int studyroom_id;
	private String studyroom_name;
	private String studyroom_price;
	private String studyroom_num;
	private String studyroom_size;
	private String studyroom_structure;
	private String studyroom_info;
	private int branch_id;
	private String studyroom_check;
	
	public int getStudyroom_id() {
		return studyroom_id;
	}
	public void setStudyroom_id(int studyroom_id) {
		this.studyroom_id = studyroom_id;
	}
	public String getStudyroom_name() {
		return studyroom_name;
	}
	public void setStudyroom_name(String studyroom_name) {
		this.studyroom_name = studyroom_name;
	}
	public String getStudyroom_price() {
		return studyroom_price;
	}
	public void setStudyroom_price(String studyroom_price) {
		this.studyroom_price = studyroom_price;
	}
	public String getStudyroom_num() {
		return studyroom_num;
	}
	public void setStudyroom_num(String studyroom_num) {
		this.studyroom_num = studyroom_num;
	}
	public String getStudyroom_size() {
		return studyroom_size;
	}
	public void setStudyroom_size(String studyroom_size) {
		this.studyroom_size = studyroom_size;
	}
	public String getStudyroom_structure() {
		return studyroom_structure;
	}
	public void setStudyroom_structure(String studyroom_structure) {
		this.studyroom_structure = studyroom_structure;
	}
	public String getStudyroom_info() {
		return studyroom_info;
	}
	public void setStudyroom_info(String studyroom_info) {
		this.studyroom_info = studyroom_info;
	}
	
	
	
	
	public int getBranch_id() {
		return branch_id;
	}
	public void setBranch_id(int branch_id) {
		this.branch_id = branch_id;
	}
	public String getStudyroom_check() {
		return studyroom_check;
	}
	public void setStudyroom_check(String studyroom_check) {
		this.studyroom_check = studyroom_check;
	}
	@Override
	public String toString() {
		return "StudyroomVO [studyroom_id=" + studyroom_id + ", studyroom_name=" + studyroom_name + ", studyroom_price="
				+ studyroom_price + ", studyroom_num=" + studyroom_num + ", studyroom_size=" + studyroom_size
				+ ", studyroom_structure=" + studyroom_structure + ", studyroom_info=" + studyroom_info + ", branch_id="
				+ branch_id + ", studyroom_check=" + studyroom_check + "]";
	}

	

	
	
	
}
