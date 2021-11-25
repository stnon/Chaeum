package com.bc.chaeum.reservation.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bc.chaeum.reservation.service.ReservationVO;

@Repository
public class ReservationDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public ReservationDAO() {
		System.out.println(">> ReservationDAO() 객체 생성");
	}
	public ReservationVO getResInfo(ReservationVO vo) {
		return mybatis.selectOne("reservation.getResInfo", vo);
	}
	public List<ReservationVO> getResInfoList(ReservationVO resVO){
		return mybatis.selectList("reservation.getResInfoList", resVO);
	}
	public List<ReservationVO> getResInfoList(){
		return mybatis.selectList("reservation.getRestInfoList_E");
	}
	
	public int insertReservation(ReservationVO resVO) {
		return mybatis.insert("insertReservation", resVO);
	}
	
	public int roomConfirm(ReservationVO resVO) {
		return mybatis.selectOne("getResId", resVO);
	}
	public List<ReservationVO> getResInfoList_E(String email){
		return mybatis.selectList("reservation.getResInfoList_E", email);
	}
	
}
