package com.bc.chaeum.member.service;

import java.util.List;

public interface MemberService {
	public List<MemberVO> selectAllMember();
	public List<MemberVO> selectAllMember(MemberVO vo);
	public MemberVO oneMember(MemberVO vo);
	public int updateMember(MemberVO vo);
	public int deleteMember(MemberVO vo);

}
