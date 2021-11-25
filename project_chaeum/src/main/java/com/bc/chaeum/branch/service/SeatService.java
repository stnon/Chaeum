package com.bc.chaeum.branch.service;

import java.util.List;

public interface SeatService {
	void insertSeat(SeatVO vo);
	void updateSeat(SeatVO vo);
	void deleteSeat(SeatVO vo);
	SeatVO getSeat(SeatVO vo);
	List<SeatVO> getSeatList(SeatVO vo);
}
