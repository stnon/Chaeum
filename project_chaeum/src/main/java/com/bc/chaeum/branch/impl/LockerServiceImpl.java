package com.bc.chaeum.branch.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bc.chaeum.branch.service.LockerService;
import com.bc.chaeum.branch.service.LockerVO;

@Service("lockerService")
public class LockerServiceImpl implements LockerService{
	@Autowired
	private LockerDAO lockerDAO;
	
	public LockerServiceImpl() {
		System.out.println(">> lockerServiceImple() 객체 생성");
	}

	@Override
	public void insertLocker(LockerVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateLocker(LockerVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteLocker(LockerVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public LockerVO getLocker(LockerVO vo) {
		return lockerDAO.getLocker(vo);
	}

	@Override
	public List<LockerVO> getLockerList(LockerVO vo) {
		return lockerDAO.getLockerList(vo);
	}
	@Override
	public List<LockerVO> getLockerList(int branch_id) {
		return lockerDAO.getLockerList(branch_id);
	}
	
}
