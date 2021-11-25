package com.bc.chaeum.member.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bc.chaeum.member.service.MemberVO;

@Repository
public class UserDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public UserDAO() {
		System.out.println(">> UserDAO() 객체 생성");
		
	}

	public MemberVO loginUser(MemberVO vo) {
		System.out.println("===> MyBatis로 loginUser() 실행");
		return mybatis.selectOne("userDAO.loginUser", vo);
	}

	public void insertUser(MemberVO vo) {
		System.out.println("===> MyBatis로 insertUser() 실행");
		mybatis.insert("userDAO.insertUser", vo);
	}

	public int checkName(String nickname) {
		System.out.println("====> checkName() 실행");
		
		return mybatis.selectOne("userDAO.checkName", nickname);
		
	}

	public int checkEmail(String email) {
		System.out.println("====> checkEmail() 실행");
		return mybatis.selectOne("userDAO.checkEmail", email);
	}

	public void userUpdate(MemberVO vo) {
		mybatis.update("userDAO.userUpdate", vo);
		
	}

	public void userSignout(String email) {
		mybatis.update("userDAO.userSignout", email);
		
	}

	public void passFind(MemberVO vo) {
		mybatis.update("userDAO.passFind", vo);
		
	}

	public MemberVO signinCheck(MemberVO vo) {
		return mybatis.selectOne("userDAO.signinCheck" , vo);
	}

	public int passChk(MemberVO vo) {
		int result = mybatis.selectOne("userDAO.passChk", vo);
		return result;
	}

	public int loginChk(String email) {
		int result = mybatis.selectOne("userDAO.loginChk", email);
		return result;
	}
}	
