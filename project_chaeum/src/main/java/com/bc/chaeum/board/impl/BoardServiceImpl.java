package com.bc.chaeum.board.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bc.chaeum.board.service.BoardService;
import com.bc.chaeum.board.service.BoardVO;
import com.bc.chaeum.common.SearchCriteria;

// @Service : @Component 상속확장 어노테이션
//		비즈니스 로직 처리 서비스 영역에 사용
@Service("boardService")
public class BoardServiceImpl implements BoardService {
	@Autowired //타입이 일치하는 객체(인스턴스) 주입

	private BoardDAO boardDAO;

	public BoardServiceImpl() {
		System.out.println(">> BoardServiceImpl() 객체생성");
	}
	
	@Override
	public void insertBoard(BoardVO vo) {
		boardDAO.insertBoard(vo);
	}

	@Override
	public void updateBoard(BoardVO vo) {
		boardDAO.updateBoard(vo);
	}

	@Override
	public void deleteBoard(BoardVO vo) {
		boardDAO.deleteBoard(vo);
	}

	@Override
	public BoardVO getBoard(BoardVO vo) throws Exception {
		return boardDAO.getBoard(vo);
	}


	@Override
	public void boardCnt(int board_id) throws Exception {
		boardDAO.boardCnt(board_id);
	}



	@Override
	public List<BoardVO> getBoardList(SearchCriteria scri) {
		return boardDAO.getBoardList(scri);
	}

	@Override
	public List<BoardVO> getBoardList(BoardVO vo) {
		return boardDAO.getBoardList(vo);
	}

	@Override
	public int listCount(SearchCriteria scri) {
		return boardDAO.listCount(scri);
	}

	@Override
	public List<BoardVO> getBoardList_F(SearchCriteria scri) {
		// TODO Auto-generated method stub
		return boardDAO.getBoardList_F(scri);
	}

	@Override
	public List<BoardVO> getBoardList2(String email) {
		
		return boardDAO.getBoardList2(email);
	}

	
	/*
	@Override
	public List<BoardVO> getBoardList_F(BoardVO vo) {
		// TODO Auto-generated method stub
		return boardDAO.getBoardList_F(vo);
	}
	*/


}
