package com.bc.chaeum.branch.service;

import java.util.List;

public interface LockerService {
	void insertLocker(LockerVO vo);
	void updateLocker(LockerVO vo);
	void deleteLocker(LockerVO vo);
	LockerVO getLocker(LockerVO vo);
	List<LockerVO> getLockerList(LockerVO vo);
	List<LockerVO> getLockerList(int branch_id);
}
