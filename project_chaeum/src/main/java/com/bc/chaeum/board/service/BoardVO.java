package com.bc.chaeum.board.service;

import java.sql.Date;

import com.bc.chaeum.member.service.MemberVO;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

//@JsonIgnoreProperties : JSON 데이터 변환시 제외시킬 필드 지정
//@JsonIgnoreProperties(value = {"searchCondition", "searchKeyword"})
public class BoardVO {
	
	private int board_id;
	private String title;
	private String b_contents;
	private String boardtype;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss")
	private Date b_regdate;
	private Date update_date;
	private String b_useable;
	private int count;
	private String email;
	private String nickname;
	
	private MemberVO memberVO;
	
	
	// 검색조건용 필드 추가
	//@JsonIgnore //JSON 데이터 변경 제외
	private String searchCondition;
	//@JsonIgnore 
	private String searchKeyword;
	
	
	
	public BoardVO() {
		System.out.println(">> BoardVO() 객체 생성");
	}

	

	public int getBoard_id() {
		return board_id;
	}



	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}



	public String getTitle() {
		return title;
	}



	public void setTitle(String title) {
		this.title = title;
	}



	public String getB_contents() {
		return b_contents;
	}



	public void setB_contents(String b_contents) {
		this.b_contents = b_contents;
	}



	public String getBoardtype() {
		return boardtype;
	}



	public void setBoardtype(String boardtype) {
		this.boardtype = boardtype;
	}



	public Date getB_regdate() {
		return b_regdate;
	}



	public void setB_regdate(Date b_regdate) {
		this.b_regdate = b_regdate;
	}



	public Date getUpdate_date() {
		return update_date;
	}



	public void setUpdate_date(Date update_date) {
		this.update_date = update_date;
	}



	public String getB_useable() {
		return b_useable;
	}



	public void setB_useable(String b_useable) {
		this.b_useable = b_useable;
	}



	public int getCount() {
		return count;
	}



	public void setCount(int count) {
		this.count = count;
	}



	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}

	

	public MemberVO getMemberVO() {
		return memberVO;
	}



	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	

	public String getNickname() {
		return nickname;
	}



	public void setNickname(String nickname) {
		this.nickname = nickname;
	}



	


	@Override
	public String toString() {
		return "BoardVO [board_id=" + board_id + ", title=" + title + ", b_contents=" + b_contents + ", boardtype="
				+ boardtype + ", b_regdate=" + b_regdate + ", update_date=" + update_date + ", b_useable=" + b_useable
				+ ", count=" + count + ", email=" + email + ", nickname=" + nickname + ", memberVO=" + memberVO
				+ ", searchCondition=" + searchCondition + ", searchKeyword=" + searchKeyword + "]";
	}



	//==========================
	public String getSearchCondition() {
		return searchCondition;
	}
	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}

	
	
}









