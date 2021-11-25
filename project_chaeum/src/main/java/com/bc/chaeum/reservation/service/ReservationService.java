package com.bc.chaeum.reservation.service;

import java.util.List;

public interface ReservationService {
	public int roomConfirm(ReservationVO resVO);
	public int insertReservation(ReservationVO resVO);
	public ReservationVO getResInfo(ReservationVO vo);
	public List<ReservationVO> getResInfoList(ReservationVO resVO);
	public List<ReservationVO> getResInfoList();
	public List<ReservationVO> getResInfoList_E(String email);
}
