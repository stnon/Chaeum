package com.bc.chaeum.branch.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bc.chaeum.branch.service.BranchService;
import com.bc.chaeum.branch.service.BranchVO;

@Service("branchService")
public class BranchServiceImpl implements BranchService {
	@Autowired
	private BranchDAO branchDAO;
	
	public BranchServiceImpl() {
		System.out.println(">> BranchServiceImpl() 객체 생성");
	}

	@Override
	public void insertBranch(BranchVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateBranch(BranchVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteBranch(BranchVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public BranchVO getBranch(BranchVO vo) {
		return branchDAO.getBranch(vo);
	}

	@Override
	public List<BranchVO> getBranchList(BranchVO vo) {
		return branchDAO.getBranchList(vo);
	}

	@Override
	public List<BranchVO> getBranchList() {
		// TODO Auto-generated method stub
		return branchDAO.getBranchList();
	}
	
}
