package com.bc.chaeum.member.impl;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bc.chaeum.member.service.MessageVO;

import oracle.jdbc.driver.Message;

@Repository
public class MessageDAO {

	@Autowired
	private SqlSession sqlSession;
	
	// 메세지 리스트
	public ArrayList<MessageVO> messageList(MessageVO vo) {
		String email = vo.getEmail();
		// 메세지 리스트에 나타낼 것들 가져오기 - 가장 최근 메세지, 보낸사람 profile 사진(?), 보낸사람 email
		ArrayList<MessageVO> list = (ArrayList) sqlSession.selectList("message_list", vo);
		
		System.out.println("==============");
		list.forEach(System.out::println);
		
		
		  for (MessageVO mvo : list) { 
			  	mvo.setEmail(email);
		   int unread = sqlSession.selectOne("count_unread", mvo); 
		   String nickname = sqlSession.selectOne("get_other_nickname", mvo);
		   mvo.setUnread(unread); 
		   mvo.setNickname(nickname);
		  if (email.equals(mvo.getSend_nick())) {
			   mvo.setOther_email(mvo.getRecv_nick());
		   } else {
			   mvo.setOther_email(mvo.getSend_nick()); 
			   } 
		  }
		 
		return list;
	}


	// room 별 메세지 내용을 가져온다.
	public ArrayList<MessageVO> roomContentList(MessageVO vo) {
		
		System.out.println("room : " + vo.getRoom());
		System.out.println("recv_nick : " + vo.getRecv_nick());
		System.out.println("email : " + vo.getEmail());
		// 메세지 내역을 가져온다
		ArrayList<MessageVO> clist = (ArrayList) sqlSession.selectList("room_content_list", vo);

		// 해당 방의 메세지들 중 받는 사람이 현재사용자의 nick인 메세지를 모두 읽음 처리한다
		sqlSession.update("message_read_chk", vo);

		return clist;
	}
	
	// 메세지 list에서 메세지를 보낸다.
	public int messageSendInlist(MessageVO vo) {
		
		// 메세지리스트에서 보낸건지 프로필에서 보낸건지 구분하기 위함
		if(vo.getRoom() == 0) {	// room이 0이라면 프로필에서 보낸거다
			int exist_chat = sqlSession.selectOne("exist_chat", vo);
			// 프로필에서 보낸것중 메세지 내역이없어서 첫메세지가 될경우를 구분하기 위함
			if(exist_chat == 0) {	// 메세지 내역이 없어서 0이면 message 테이블의 room 최댓값을 구해서 to에 set 한다.
				int max_room = sqlSession.selectOne("max_room", vo);
				vo.setRoom(max_room+1);
			}else {		// 메세지 내역이 있다면 해당 room 번호를 가져온다.
				int room = Integer.parseInt(sqlSession.selectOne("select_room", vo) );
				vo.setRoom(room);
			}
		}
		
		int flag = sqlSession.insert("messageSendInlist",vo);
		return flag;
	}



}
