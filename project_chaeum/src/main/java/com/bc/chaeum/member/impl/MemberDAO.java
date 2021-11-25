package com.bc.chaeum.member.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bc.chaeum.member.service.MemberVO;

@Repository
public class MemberDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public MemberDAO() {
		System.out.println(">> MemberDAO() 객체 생성");
	}
	

	// 회원목록
	public List<MemberVO> selectAllMember() {
		return mybatis.selectList("member.selectAllMember");
	}
	
	// 회원목록
	public List<MemberVO> selectAllMember(MemberVO vo) {
		return mybatis.selectList("member.selectAllMember", vo);
	}
	
	// 회원이름아이디검색
	public List<MemberVO> list(MemberVO vo) {
		return mybatis.selectList("member.selectAllMember",vo);			
	}

	//회원정보수정
	public int updateMember(MemberVO vo) {
		return mybatis.update("member.updateMember", vo);
	}
	
	//회원하나조회
	public MemberVO oneMember(MemberVO vo) {
		System.out.println("회원하나조회");
		return mybatis.selectOne("member.oneMember", vo);
	}
	
	// 회원삭제
	public int deleteMember(MemberVO vo) {
		return mybatis.delete("member.deleteMember", vo);
	}
	
	
}
