package com.bc.chaeum.view;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bc.chaeum.member.impl.MessageDAO;
import com.bc.chaeum.member.service.MemberVO;
import com.bc.chaeum.member.service.MessageVO;

@Controller
public class MessageController {

	@Autowired
	private MessageDAO messageDao;

	// 메세지 목록;
	@RequestMapping(value = "/message_list.do")
	public String message_list(HttpServletRequest request, HttpSession session) {
		MemberVO user = (MemberVO)session.getAttribute("user");
		String email = user.getEmail();

		MessageVO vo = new MessageVO();
		vo.setEmail(email);

		System.out.println("현재 사용자 email : " +email);
		// 메세지 리스트
		ArrayList<MessageVO> list = messageDao.messageList(vo);

		request.setAttribute("list", list);
		
		return "index.jsp?contentPage=admin/manageMember/message_list.jsp";
		
	}

	// 메세지 목록
	@RequestMapping(value = "/message_ajax_list.do")
	public String message_ajax_list(HttpServletRequest request, HttpSession session) {
		MemberVO user = (MemberVO) session.getAttribute("user");
		String email = user.getEmail();

		MessageVO vo = new MessageVO();
		vo.setEmail(email);

		// 메세지 리스트
		ArrayList<MessageVO> list = messageDao.messageList(vo);

		request.setAttribute("list", list);

		return "admin/manageMember/message_ajax_list.jsp";
		
	}
	
	@RequestMapping(value = "/message_content_list.do")
	public String message_content_list(HttpServletRequest request, HttpSession session) {

		int room = Integer.parseInt(request.getParameter("room"));
		String other_email = request.getParameter("other_email");
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		MessageVO vo = new MessageVO();
		vo.setRoom(room);
		vo.setEmail(user.getEmail());
		vo.setRecv_nick(other_email);

		// 메세지 내용을 가져온다.
		ArrayList<MessageVO> clist = messageDao.roomContentList(vo);

		request.setAttribute("clist", clist);

		return "admin/manageMember/message_content_list.jsp";
	}

	// 메세지 리스트에서 메세지 보내기
	@ResponseBody
	@RequestMapping(value = "/message_send_inlist.do")
	public int message_send_inlist(@RequestParam int room, @RequestParam String other_email,
			@RequestParam String content, HttpSession session) {
		MemberVO user = (MemberVO) session.getAttribute("user");
		MessageVO vo = new MessageVO();
		vo.setRoom(room);
		vo.setSend_nick(user.getEmail());
		vo.setRecv_nick(other_email);
		vo.setContent(content);

		int flag = messageDao.messageSendInlist(vo);

		return flag;
	}

}
