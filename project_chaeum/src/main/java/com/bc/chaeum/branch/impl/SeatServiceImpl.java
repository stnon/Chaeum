package com.bc.chaeum.branch.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bc.chaeum.branch.service.SeatService;
import com.bc.chaeum.branch.service.SeatVO;


@Service("seatService")
public class SeatServiceImpl implements SeatService{
	private SeatDAO seatDAO;
	
	@Override
	public void insertSeat(SeatVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateSeat(SeatVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteSeat(SeatVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public SeatVO getSeat(SeatVO vo) {
		return seatDAO.getSeat(vo);
	}

	@Override
	public List<SeatVO> getSeatList(SeatVO vo) {
		// TODO Auto-generated method stub
		return seatDAO.getSeatList(vo);
	}

}
