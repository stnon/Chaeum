package com.bc.chaeum.branch.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bc.chaeum.branch.service.StudyroomService;
import com.bc.chaeum.branch.service.StudyroomVO;


@Service("studyroomService")
public class StudyroomServiceImpl implements StudyroomService{
	@Autowired
	private StudyroomDAO studyroomDAO;
	
	public StudyroomServiceImpl() {
		System.out.println(">> StudyroomServiceImpl() 객체 생성");
	}
	
	@Override
	public int insertStudyroom(StudyroomVO vo) {
		return studyroomDAO.insertStudyroom(vo);
	}

	@Override
	public int deleteStudyroom(StudyroomVO vo) {
		return studyroomDAO.deleteStudyroom(vo);
	}

	@Override
	public StudyroomVO getStudyroom(StudyroomVO vo) {
		return studyroomDAO.getStudyroom(vo);
	}

	@Override
	public List<StudyroomVO> getStudyroomList(StudyroomVO vo) {
		return studyroomDAO.getStudyroomList(vo);
	}
	
	@Override
	public List<StudyroomVO> getStudyroomList_Bid(int branch_id) {
		return studyroomDAO.getStudyroomList_Bid(branch_id);
	}

}
