package com.bc.chaeum.member.impl;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bc.chaeum.member.service.MemberService;
import com.bc.chaeum.member.service.MemberVO;


@Service("memberService")
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAO memberDAO;
	
	public MemberServiceImpl() {
		System.out.println(">> MemberServiceImpl() 객체생성");
	}
	

	// 회원목록
	@Override
	public List<MemberVO> selectAllMember() {
		return memberDAO.selectAllMember();
	}
	// 회원목록
	@Override
	public List<MemberVO> selectAllMember(MemberVO vo) {
		return memberDAO.selectAllMember(vo);
	}
	
	//회원하나조회
	@Override
	public MemberVO oneMember(MemberVO vo) {
		return memberDAO.oneMember(vo);
	}

	//회원정보수정
	@Override
	public int updateMember(MemberVO vo) {
		return memberDAO.updateMember(vo);
	}

	//회원삭제
	@Override
	public int deleteMember(MemberVO vo) {
		return memberDAO.deleteMember(vo);
	}



	

}
