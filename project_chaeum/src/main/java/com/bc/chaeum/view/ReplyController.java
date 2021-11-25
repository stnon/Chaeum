package com.bc.chaeum.view;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.bc.chaeum.board.service.ReplyService;
import com.bc.chaeum.board.service.ReplyVO;

@SessionAttributes("reply")
@Controller
public class ReplyController {
	
	@Autowired
	private ReplyService replyService;
		
	public ReplyController() {
	System.out.println("--->> ReplyController() 객체생성");
	
	}
	
	@PostMapping("/writerReply.do")
	@ResponseBody
	public String replyWriter(ReplyVO vo) {
		System.out.println(">>> 댓글입력" + vo);	
		int rs = replyService.insertReply(vo);	
		System.out.println("결과값 : "  + rs);
		
		return Integer.toString(rs);
	}
	

	@GetMapping("/replyList.do")
	@ResponseBody
	public List<ReplyVO> replyList(int board_id, Model model) {
		System.out.println(">>> 댓글목록 보여주기");		
		List<ReplyVO> rlist = replyService.getReplyList(board_id);
		System.out.println(rlist);
		model.addAttribute("reply", rlist);
		
		return rlist;
	}
	
	@PostMapping("/modifyOk.do")
	@ResponseBody
	private int updateReply(ReplyVO vo) {
		System.out.println(">>> 댓글수정완료버튼");
		int reply = replyService.updateReply(vo);
				
		return reply;
	}
	
	@GetMapping("/getReply.do")
	@ResponseBody
	private ReplyVO getReply(ReplyVO vo)  {		
		System.out.println(">>> 댓글수정");
		ReplyVO reply = replyService.getReply(vo);	
		
		return reply;
	}
	
	@GetMapping("/deleteReply.do")
	@ResponseBody
	private int deleteReply(int r_id) {
		System.out.println(">>> 댓글 삭제 컨트롤러");
		int reply = replyService.deleteReply(r_id);
		
		return reply;
	}
}