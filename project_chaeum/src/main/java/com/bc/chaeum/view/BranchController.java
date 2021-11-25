package com.bc.chaeum.view;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.bc.chaeum.branch.service.BranchService;
import com.bc.chaeum.branch.service.BranchVO;
import com.bc.chaeum.member.service.MemberVO;

@Controller
@SessionAttributes("branch")
public class BranchController {
	@Autowired
	private BranchService branchService;
	
	public BranchController() {
		System.out.println(">> BranchController() 객체 생성");
				
	}
	@ModelAttribute("branchListMap")
	public Map<String, String> searchConditionMap() {
		System.out.println("--->> Map branchListMap() 실행");
		Map<String, String> branchListMap = new HashMap<String, String>();
		branchListMap.put("이름", "branch_name");
		branchListMap.put("지점설명", "branch_info");
		return branchListMap;
	}	
	@RequestMapping("/getBranch.do")
	public String getBranch(BranchVO vo, Model model) {
		System.out.println(vo);
		BranchVO branch = branchService.getBranch(vo);
		System.out.println(":: getBranch branch : " + branch);
		
		model.addAttribute("branch", branch); //Model 객체 사용 View로 데이터 전달
		
		return "index.jsp?contentPage=reservation/branchInfo.jsp";
	}
	
	@RequestMapping("/getBranchList.do")
	public String getBoardList(BranchVO vo, Model model) {
		System.out.println(">>> 지역별 지점보여주기");
		System.out.println(":: getBranchList() vo : " + vo);
		List<BranchVO> boardList = branchService.getBranchList(vo);
	
		model.addAttribute("branchList", boardList);
		
		return "index.jsp?contentPage=reservation/choiceBranch.jsp";
	}
	
	@RequestMapping("/getJsonBranchList.do")
	@ResponseBody
	public List<BranchVO> getAjaxBranchList(){
		List<BranchVO> branchList = branchService.getBranchList();
		System.out.println("getJsonBranchList() branchList : " + branchList);
		
		return branchList;
	}
	
	@RequestMapping("/getJsonBranch.do")
	@ResponseBody
	public BranchVO getJsonBranch(@RequestBody BranchVO vo){
		BranchVO branch = branchService.getBranch(vo);
		
		return branch;
	}

}


