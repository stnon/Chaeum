package com.bc.chaeum.board.service;

import java.util.List;

public interface ReplyService {
	
	int insertReply(ReplyVO vo);
	int updateReply(ReplyVO vo);
	int deleteReply(int r_id);
	ReplyVO getReply(ReplyVO vo);
	List<ReplyVO> getReplyList(int board_id);
	List<ReplyVO> getMyReply(String email);
	
}
