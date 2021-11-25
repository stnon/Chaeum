package com.bc.chaeum.view;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.bc.chaeum.member.service.MemberService;
import com.bc.chaeum.member.service.MemberVO;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;
	
	public MemberController() {
		System.out.println("--->> MemberController() 객체생성");
	}
	
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		System.out.println("--->> Map searchConditionMap() 실행");
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("이메일", "EMAIL");
		conditionMap.put("닉네임", "NICKNAME");
		return conditionMap;
	}	
	
	@RequestMapping(value = "/memberList.do", method=RequestMethod.GET)
	public String selectAllMember(MemberVO vo, Model model) {
		List<MemberVO> memberList = memberService.selectAllMember(vo);
		model.addAttribute("memberList", memberList);
		return "index.jsp?contentPage=admin/manageMember/memberList.jsp";
		
	}
	
	@RequestMapping(value = "/memberOne.do", method=RequestMethod.GET)
	public String oneMember(MemberVO vo, Model model) {
		MemberVO oneMember = memberService.oneMember(vo);
		model.addAttribute("oneMember", oneMember);
		return "index.jsp?contentPage=admin/manageMember/memberOne.jsp";
	}

	@RequestMapping(value = "/updateMember.do", method=RequestMethod.GET)
	public String updateMember(MemberVO vo) {
		memberService.updateMember(vo);
		return "memberOne.do";
	}
	
	@RequestMapping(value = "/deleteMember.do", method=RequestMethod.GET)
	public String deleteMember(MemberVO vo) {
		memberService.deleteMember(vo);
		return "memberList.do";
	}

	
}
