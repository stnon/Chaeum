package com.bc.chaeum.board.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bc.chaeum.board.service.ReplyService;
import com.bc.chaeum.board.service.ReplyVO;

@Service("replyService")
public class ReplyServiceImpl implements ReplyService {
	
	@Autowired 
	private ReplyDAO replyDAO;
	
	@Override
	public int insertReply(ReplyVO vo) {
		return replyDAO.insertReply(vo);
		
	}

	@Override
	public int updateReply(ReplyVO vo) {
		return replyDAO.updateReply(vo);
	}

	@Override
	public int deleteReply(int r_id) {
		return replyDAO.deleteReply(r_id);
	}

	@Override
	public ReplyVO getReply(ReplyVO vo) {
		
		return replyDAO.getReply(vo);
	}

	@Override
	public List<ReplyVO> getReplyList(int board_id) {
		return replyDAO.getReplyList(board_id);
	}

	@Override
	public List<ReplyVO> getMyReply(String email) {
		return replyDAO.getReplyList(email);
	}

	

}
