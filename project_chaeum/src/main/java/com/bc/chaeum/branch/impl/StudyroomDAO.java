package com.bc.chaeum.branch.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bc.chaeum.branch.service.StudyroomVO;

@Repository
public class StudyroomDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public StudyroomDAO() {
		System.out.println(">> StudyroomDAO() 객체 생성");
	}
	
	public StudyroomVO getStudyroom(StudyroomVO vo) {
		return mybatis.selectOne("studyroom.getStudyroom", vo);
	}
	
	public List<StudyroomVO> getStudyroomList(StudyroomVO vo) {
		return mybatis.selectList("studyroom.getStudyroomList", vo);
	}
	
	public List<StudyroomVO> getStudyroomList_Bid(int branch_id) {
		return mybatis.selectList("studyroom.getStudyroomList_Bid", branch_id);
	}
	
	public int insertStudyroom(StudyroomVO vo) {
		return mybatis.insert("studyroom.insertStudyroom", vo);
	}
	
	public int deleteStudyroom(StudyroomVO vo) {
		return mybatis.delete("studyroom.deleteStudyroom", vo);
	}
}
