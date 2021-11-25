package com.bc.chaeum.member.service;


public interface UserService {
	MemberVO loginUser(MemberVO vo);
	void insertUser(MemberVO vo);
	int checkName(String ninkname);
	int checkEmail(String email);
	void userUpdate(MemberVO vo);
	void userSignout(String email);
	void passFind(MemberVO vo);
	MemberVO signinCheck(MemberVO vo);
	int passChk(MemberVO vo);
	int loginChk(String email);
}
