package com.bc.chaeum.branch.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bc.chaeum.branch.service.LockerVO;

@Repository
public class LockerDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public LockerDAO() {
		System.out.println(">> lockerDAO() 객체 생성");
	}
	
	public LockerVO getLocker(LockerVO vo) {
		return mybatis.selectOne("locker.getLocker", vo);
	}
	
	public List<LockerVO> getLockerList(LockerVO vo){
		return mybatis.selectList("locker.getLockerList", vo);
	}
	
	public List<LockerVO> getLockerList(int branch_id){
		return mybatis.selectList("locker.getLockerList_bid", branch_id);
	}
}
