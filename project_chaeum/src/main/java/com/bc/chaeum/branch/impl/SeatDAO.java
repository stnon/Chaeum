package com.bc.chaeum.branch.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bc.chaeum.branch.service.SeatVO;

@Repository
public class SeatDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public SeatDAO() {
		System.out.println(">> SeatDAO() 객체 생성");
	}
	
	public SeatVO getSeat(SeatVO vo) {
		return mybatis.selectOne("seat.getSeat", vo);
	}
	
	public List<SeatVO> getSeatList(SeatVO vo){
		System.out.println("===========> getSeatList(vo) 실행");
		return mybatis.selectList("seat.getSeatList", vo);
	}
}
