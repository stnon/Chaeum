package com.bc.chaeum.branch.service;

import java.util.List;

public interface BranchService {
	void insertBranch(BranchVO vo);
	void updateBranch(BranchVO vo);
	void deleteBranch(BranchVO vo);
	BranchVO getBranch(BranchVO vo);
	List<BranchVO> getBranchList(BranchVO vo);
	List<BranchVO> getBranchList();
}
