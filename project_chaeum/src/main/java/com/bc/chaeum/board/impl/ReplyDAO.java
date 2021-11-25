package com.bc.chaeum.board.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bc.chaeum.board.service.ReplyVO;

@Repository
public class ReplyDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<ReplyVO> getReplyList(int board_id) {
		System.out.println("===> MyBatis로 replyList(vo) 실행");
		return mybatis.selectList("replyDAO.replyList", board_id);
	}

	public int insertReply(ReplyVO vo) {
		System.out.println("===> MyBatis로 insertReply 실행");
		
		return mybatis.insert("replyDAO.insertReply", vo);
		
	}

	public int updateReply(ReplyVO vo) {
		
		return mybatis.update("replyDAO.updateReply", vo);
	}

	public ReplyVO getReply(ReplyVO vo) {
		return mybatis.selectOne("replyDAO.getReply", vo);
	}

	public int deleteReply(int r_id) {
		return mybatis.delete("replyDAO.deleteReply", r_id);
	}

	public List<ReplyVO> getReplyList(String email) {
		return mybatis.selectList("replyDAO.myReply", email);
	}

}
