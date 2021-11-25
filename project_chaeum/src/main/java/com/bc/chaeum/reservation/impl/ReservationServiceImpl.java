package com.bc.chaeum.reservation.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bc.chaeum.reservation.service.ReservationService;
import com.bc.chaeum.reservation.service.ReservationVO;

@Service("reservationService")
public class ReservationServiceImpl implements ReservationService{
	@Autowired
	private ReservationDAO reservationDAO;
	
	public ReservationServiceImpl() {
		System.out.println(">> ReservationServiceImpl() 객체 생성");
	}

	@Override
	public int roomConfirm(ReservationVO resVO) {
		
		return reservationDAO.roomConfirm(resVO);
	}

	@Override
	public ReservationVO getResInfo(ReservationVO vo) {
		// TODO Auto-generated method stub
		return reservationDAO.getResInfo(vo);
	}

	@Override
	public List<ReservationVO> getResInfoList(ReservationVO resVO) {
		// TODO Auto-generated method stub
		return reservationDAO.getResInfoList(resVO);
	}

	@Override
	public List<ReservationVO> getResInfoList() {
		// TODO Auto-generated method stub
		return reservationDAO.getResInfoList();
	}

	@Override
	public int insertReservation(ReservationVO resVO) {
		return reservationDAO.insertReservation(resVO);
		
	}

	@Override
	public List<ReservationVO> getResInfoList_E(String email) {
		return reservationDAO.getResInfoList_E(email);
	}
	
	
}
