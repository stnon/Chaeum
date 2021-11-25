package com.bc.chaeum.board.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bc.chaeum.board.service.BoardVO;
import com.bc.chaeum.common.Criteria;
import com.bc.chaeum.common.SearchCriteria;

@Repository
public class BoardDAO {
	@Autowired
	private SqlSessionTemplate mybatis;

	public BoardDAO() {
		System.out.println(">> BoardDAOMybatis() 객체 생성");
	}

	// 글입력
	public void insertBoard(BoardVO vo) {
		System.out.println("===> MyBatis로 insertBoard() 실행");
		mybatis.insert("boardDAO.insertBoard", vo);
	}

	// 글수정
	public void updateBoard(BoardVO vo) {
		System.out.println("===> MyBatis로 updateBoard() 실행");
		mybatis.update("boardDAO.updateBoard", vo);
	}

	// 글삭제
	public void deleteBoard(BoardVO vo) {
		System.out.println("===> MyBatis로 deleteBoard() 실행");
		mybatis.delete("boardDAO.deleteBoard", vo);
	}

	// 글 하나조회
	public BoardVO getBoard(BoardVO vo) {
		System.out.println("===> MyBatis로 getBoard() 실행");
		return mybatis.selectOne("boardDAO.getBoard", vo);
	}

	// 글 목록 조회
	public List<BoardVO> getBoardList(SearchCriteria scri) {
		System.out.println("===> MyBatis로 getBoardList() 실행");
		return mybatis.selectList("boardDAO.getBoardList", scri);
	}

	
	public List<BoardVO> getBoardList(BoardVO vo, Criteria cri) {
		System.out.println("===> MyBatis로 getBoardList() 실행");
		return null;
	}

	public List<BoardVO> getBoardList(BoardVO vo) {
		System.out.println("===> MyBatis로 getBoardList(vo) 실행");

		return mybatis.selectList("boardDAO.getBoardList", vo);
	}

	// 글 조회수
	public void boardCnt(int board_id) throws Exception {
		mybatis.update("boardDAO.boardCnt", board_id);
	}

	public int listCount(SearchCriteria scri) {
		return mybatis.selectOne("boardDAO.listCount", scri);
	}
	public List<BoardVO> getBoardList_F(SearchCriteria scri) {
		System.out.println("===> MyBatis로 getBoardList(vo) 실행");

		return mybatis.selectList("boardDAO.getBoardList_F", scri);
	}

	public List<BoardVO> getBoardList2(String email) {
		return mybatis.selectList("boardDAO.getBoardList2", email);
	}
	
	/*
	public List<BoardVO> getBoardList_F(BoardVO vo) {
		System.out.println("===> MyBatis로 getBoardList(vo) 실행");

		return mybatis.selectList("boardDAO.getBoardList_F", vo);
	}
	*/
}