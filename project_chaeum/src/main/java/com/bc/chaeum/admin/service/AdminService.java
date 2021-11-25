package com.bc.chaeum.admin.service;

import java.util.List;

import com.bc.chaeum.board.service.BoardVO;

public interface AdminService {
	//매출 통계
	public List<AdminVO> selectAll_Month(AdminVO vo); //전체 지점 월 총 매출
	public List<AdminVO> selectAll_Day(AdminVO vo); //전체 지점 일 총 매출
	public AdminVO selectOne_Month(AdminVO vo); //지점별 월 총 매출
	public AdminVO selectOne_Day(AdminVO vo); //지점별 일 총 매출
	public AdminVO selectOne_lastMonth(AdminVO vo2); //전월 매출
	public AdminVO selectOne_lastDay(AdminVO vo3); //전일 매출
	
	//회원 통계
	public AdminVO selectMonth_visitcnt(AdminVO vo);
	public AdminVO selectMonth_regcnt(AdminVO vo);
	public List<AdminVO> visitcntlist();
	public void updatevisitcnt(String now);
	public AdminVO lastMonth_visitcnt(AdminVO vo1);
	public AdminVO lastMonth_regcnt(AdminVO vo1);
	
	//게시판 관리
	public List<BoardVO> allnoticeboard(); //전체 공지사항 글 목록
	public List<BoardVO> getnoticelist(int begin, int end); //현재 페이지에 해당하는 공지사항 글 목록
	public List<BoardVO> allfreeboard(); //전체 자유게시판 글 목록
	public List<BoardVO> getfreeboardlist(int begin, int end); //현재 페이지에 해당하는 자유게시판 글 목록
	public BoardVO oneAdminBoard(BoardVO vo); //공지사항 게시판 게시글 상세
}
