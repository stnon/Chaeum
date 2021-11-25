package com.bc.chaeum.branch.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bc.chaeum.branch.service.BranchVO;

@Repository
public class BranchDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public BranchDAO() {
		System.out.println(">> BranchDAO() 객체 생성");
	}
	
	// 지점 하나조회
	public BranchVO getBranch(BranchVO vo) {
		return mybatis.selectOne("branch.getBranch", vo);
	}
	
	//지점 목록 조회
	public List<BranchVO> getBranchList(BranchVO vo){
		return mybatis.selectList("branch.getBranchList", vo);
	}
	
	//지점 목록 조회
	public List<BranchVO> getBranchList(){
		return mybatis.selectList("branch.getBranchList_E");
	}

}
