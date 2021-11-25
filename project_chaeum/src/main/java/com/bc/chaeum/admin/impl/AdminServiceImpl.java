package com.bc.chaeum.admin.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bc.chaeum.admin.service.AdminService;
import com.bc.chaeum.admin.service.AdminVO;
import com.bc.chaeum.board.service.BoardVO;

@Service("adminService")
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private AdminDAO adminDAO;
	
	//매출통계
	public AdminServiceImpl() {
		System.out.println("AdminServiceImpl() 객체 생성");
	}
	
	@Override
	public List<AdminVO> selectAll_Month(AdminVO vo) {
		System.out.println("AdminServiceImpl selectAll_Month 실행");
		return adminDAO.selectAll_Month(vo);
	}
	
	@Override
	public List<AdminVO> selectAll_Day(AdminVO vo) {
		return adminDAO.selectAll_Day(vo);
	}

	@Override
	public AdminVO selectOne_Month(AdminVO vo) {
		return adminDAO.selectOne_Month(vo);
	}

	@Override
	public AdminVO selectOne_Day(AdminVO vo) {
		return adminDAO.selectOne_Day(vo);
	}

	@Override
	public AdminVO selectOne_lastMonth(AdminVO vo2) {
		return adminDAO.selectOne_lastMonth(vo2);
	}

	@Override
	public AdminVO selectOne_lastDay(AdminVO vo3) {
		return adminDAO.selectOne_lastDay(vo3);
	}

	//============================================
	//회원 통계
	@Override
	public AdminVO selectMonth_visitcnt(AdminVO vo) {
		return adminDAO.selectMonth_visitcnt(vo);
	}

	@Override
	public AdminVO selectMonth_regcnt(AdminVO vo) {
		return adminDAO.selectMonth_regcnt(vo);
	}

	@Override
	public List<AdminVO> visitcntlist() {
		return adminDAO.visitcntlist();
	}
	
	//현재 시간 기준으로 방문자 수 업데이트
	@Override
	public void updatevisitcnt(String now) {
		adminDAO.updatevisitcnt(now);
	}
	
	//전월 대비
	@Override
	public AdminVO lastMonth_visitcnt(AdminVO vo1) {
		return adminDAO.selectMonth_visitcnt(vo1);
	}

	@Override
	public AdminVO lastMonth_regcnt(AdminVO vo1) {
		return adminDAO.selectMonth_regcnt(vo1);
	}
	
	//================================================
	//게시판 관리
	//공지사항
	@Override
	public List<BoardVO> allnoticeboard() {
		return adminDAO.allnoticeboard();
	}

	@Override
	public List<BoardVO> getnoticelist(int begin, int end) {
		return adminDAO.getnoticelist(begin, end);
	}
	
	//자유게시판
	@Override
	public List<BoardVO> allfreeboard() {
		return adminDAO.allfreeboard();
	}

	@Override
	public List<BoardVO> getfreeboardlist(int begin, int end) {
		return adminDAO.getfreeboardlist(begin, end);
	}

	@Override
	public BoardVO oneAdminBoard(BoardVO vo) {
		return adminDAO.oneAdminBoard(vo);
	}

}