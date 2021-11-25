package com.bc.chaeum.branch.service;

import java.util.List;

public interface StudyroomService {
	int insertStudyroom(StudyroomVO vo);
	int deleteStudyroom(StudyroomVO vo);
	StudyroomVO getStudyroom(StudyroomVO vo);
	List<StudyroomVO> getStudyroomList(StudyroomVO vo);
	List<StudyroomVO> getStudyroomList_Bid(int branch_id);
}
