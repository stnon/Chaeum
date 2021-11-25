package com.bc.chaeum.view;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bc.chaeum.admin.service.AdminService;
import com.bc.chaeum.admin.service.AdminVO;
import com.bc.chaeum.admin.service.PagingVO;
import com.bc.chaeum.board.service.BoardService;
import com.bc.chaeum.board.service.BoardVO;
import com.bc.chaeum.member.service.MemberService;
import com.bc.chaeum.member.service.MemberVO;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BoardService boardService;
	
	@RequestMapping(value = "/adminhome.do")
	public String adminHome(HttpSession session) {
		System.out.println("adminHome() 실행");
		
		//현재 시간 추출
		LocalDate now = LocalDate.now();
		int year = now.getYear();
		int month = now.getMonthValue();
		//int day = now.getDayOfMonth(); //월단위 통계만 지원
		
		System.out.println("현재시간 체크 : " + LocalDate.now().format(DateTimeFormatter.ofPattern("yy/MM/dd")));
		
		//시간 저장할 객체 생성
		AdminVO vo = new AdminVO();
		AdminVO vo1 = new AdminVO();
		
		//추출된 값 저장
		vo.setMonth(month);
		vo.setYear(year);
		
		System.out.println("vo값 체크 : " + vo);
		
		//전월 대비 값
		vo1 = setlastmonth(vo);
		
		System.out.println("vo1값 체크 : " + vo1);
		//전체 지점 월 매출 통계
		 
		List<AdminVO> main1 = adminService.selectAll_Month(vo);
		List<AdminVO> main2 = adminService.selectAll_Month(vo1);
		
		System.out.println("list1: " + main1);
		System.out.println("list2: " + main2);
		
		//List로 가져온 전체 지점 월 매출 합산
		int total = 0;
		int lasttotal = 0;
		for(int i = 0; i < main1.size(); i++) {
			total += main1.get(i).getMonthsale();
		}
		for(int i = 0; i < main2.size(); i++) {
			lasttotal += main2.get(i).getMonthsale();
		}
		System.out.println("현재 월 전체 지점 매출 합산값 체크 : " + total);
		System.out.println("전 월 전체 지점 매출 합산값 체크 : " + lasttotal);
		
		//방문자 통계
		AdminVO main3 = adminService.selectMonth_visitcnt(vo);
		AdminVO main4 = adminService.lastMonth_visitcnt(vo1);
		
		//가져온 값 체크
		System.out.println("adminhome 월 매출 : " + main1);
		System.out.println("adminhome 전월 매출 : " + main2);
		System.out.println("adminhome 월 방문자 수 : " + main3);
		System.out.println("adminhome 전월 방문자 수 : " + main4);
		System.out.println("adminhome 월매출 차트 : " + main1);
		
		session.setAttribute("Monthsale", total);
		session.setAttribute("lastMonthsale", lasttotal);
		session.setAttribute("visitcnt", main3);
		session.setAttribute("lastMonth_visitcnt", main4);
		session.setAttribute("Monthrank", main1);
		
		//관리자 목록 출력
		List<MemberVO> adminlist = memberService.selectAllMember();
		
		System.out.println("adminlist 값 체크 : " + adminlist);
		
		session.setAttribute("adminlist", adminlist);
		
		return "index.jsp?contentPage=admin/adminHome.jsp";
	}
	
	@RequestMapping(value = "/Saletotal.do", method = RequestMethod.GET)
	public String totalmain(HttpSession session) {
		
		//세션에 변경된 날짜값 체크
		AdminVO changedate = (AdminVO)session.getAttribute("changedate");
		
		//세션에 전달받은 지점값 체크
		AdminVO changebranch = (AdminVO)session.getAttribute("changebranch");
		
		//변경된 날짜값 없을 시 
		if(changedate == null) {
			System.out.println("변경된 날짜값 : " + changedate);
			
			//현재 시간 저장할  VO 객체 생성
			AdminVO vo = new AdminVO();
			
			//전월 대비 값 저장할 VO 객체 생성
			AdminVO vo2 = new AdminVO();
			
			//전일 대비 값 저장할 VO 객체 생성
			AdminVO vo3 = new AdminVO();
			
			//현재 시간 추출 (월, 일)
			LocalDate now = LocalDate.now();
			int month = now.getMonthValue();
			int day = now.getDayOfMonth();
			
			//추출된 현재 시간 값 VO 객체에 저장
			vo.setDay(day);
			vo.setMonth(month);
			
			//테스트 날짜 값
			//vo.setDay(5);
			
			
			if(changebranch == null) {
				//지점번호 디폴트값 지정
				vo.setBranchid(1);
			} else {
				vo.setBranchid(changebranch.getBranchid());
			}
			
			//전월 대비를 위한 vo2에 값 입력
			vo2 = setlastmonth(vo);
			
			//전일 대비를 위한 vo3에 값 입력
			vo3 = setlastday(vo);
			
			System.out.println("vo값 체크 : " + vo);
			System.out.println("vo2값 체크 : " + vo2);
			System.out.println("vo3값 체크 : " + vo3);
			System.out.println("vo 값 전달");
			System.out.println("vo 값 전달");
			System.out.println("vo 값 전달");
			System.out.println("vo 값 전달");
			
			//VO에 설정된 현재 시간 값 전달 
			
			List<AdminVO> main1 = adminService.selectAll_Month(vo);
			List<AdminVO> main2 = adminService.selectAll_Day(vo);
			AdminVO main3 = adminService.selectOne_Month(vo);
			AdminVO main4 = adminService.selectOne_Day(vo);
			AdminVO main5 = adminService.selectOne_lastMonth(vo2);
			AdminVO main6 = adminService.selectOne_lastDay(vo3);
			
			//월별,일별 데이터가 null값일때 날짜 데이터 입력
			if(main1.isEmpty()) {
				main1.add(0, vo);
			}
			if(main2.isEmpty()) {
				main2.add(0, vo);
			}
			if(main3 == null) {
				main3 = vo;
			}
			if(main4 == null) {
				main4 = vo;
			}
				
			session.setAttribute("selectAll_Month", main1);
			session.setAttribute("selectAll_Day", main2);
			session.setAttribute("selectOne_Month", main3);
			session.setAttribute("selectOne_Day", main4);
			session.setAttribute("selectOne_lastMonth", main5);
			session.setAttribute("selectOne_lastDay", main6);
			
			
			System.out.println("정상으로 값 입력 selectAll_Month : " + main1);
			System.out.println("정상으로 값 입력 selectAll_Day : " + main2);
			System.out.println("정상으로 값 입력 selectOne_Month : " + main3);
			System.out.println("정상으로 값 입력 selectOne_day : " + main4);
			System.out.println("정상으로 값 입력 selectOne_lastMonth : " + main5);
			System.out.println("정상으로 값 입력 selectOne_lastDay : " + main6);
			
			return "index.jsp?contentPage=admin/statisticsSales.jsp";
			
		//변경된 날짜값 있을 시
		} else {
			System.out.println("변경된 날짜값 : " + changedate);
			
			//전월 대비 값 저장할 VO 객체 생성
			AdminVO vo2 = new AdminVO();
			
			//전일 대비 값 저장할 VO 객체 생성
			AdminVO vo3 = new AdminVO();
			
			if(changebranch == null) {
				//지점번호 디폴트값 지정
				changedate.setBranchid(1);
			} else {
				changedate.setBranchid(changebranch.getBranchid());
			}
			
			//전월 대비를 위한 vo2에 값 입력
			vo2 = setlastmonth(changedate);
			
			//전일 대비를 위한 vo3에 값 입력
			vo3 = setlastday(changedate);
			
			System.out.println("changedate 값 체크 : " + changedate);
			System.out.println("vo2값 체크 : " + vo2);
			System.out.println("vo3값 체크 : " + vo3);
			System.out.println("vo 값 전달");
			System.out.println("vo 값 전달");
			System.out.println("vo 값 전달");
			System.out.println("vo 값 전달");
			
			//VO에 설정된 현재 시간 값 전달 
			
			List<AdminVO> main1 = adminService.selectAll_Month(changedate);
			List<AdminVO> main2 = adminService.selectAll_Day(changedate);
			AdminVO main3 = adminService.selectOne_Month(changedate);
			AdminVO main4 = adminService.selectOne_Day(changedate);
			AdminVO main5 = adminService.selectOne_lastMonth(vo2);
			AdminVO main6 = adminService.selectOne_lastDay(vo3);
			
			//월별,일별 데이터가 null값일때 날짜 데이터 입력
			if(main1.isEmpty()) {
				main1.add(0, changedate);
			}
			if(main2.isEmpty()) {
				main2.add(0, changedate);
			}
			if(main3 == null) {
				main3 = changedate;
			}
			if(main4 == null) {
				main4 = changedate;
			}
			
			session.setAttribute("selectAll_Month", main1);
			session.setAttribute("selectAll_Day", main2);
			session.setAttribute("selectOne_Month", main3);
			session.setAttribute("selectOne_Day", main4);
			session.setAttribute("selectOne_lastMonth", main5);
			session.setAttribute("selectOne_lastDay", main6);
			
			System.out.println("정상으로 값 입력 selectAll_Month : " + main1);
			System.out.println("정상으로 값 입력 selectAll_Day : " + main2);
			System.out.println("정상으로 값 입력 selectOne_Month : " + main3);
			System.out.println("정상으로 값 입력 selectOne_day : " + main4);
			System.out.println("정상으로 값 입력 selectOne_lastMonth : " + main5);
			System.out.println("정상으로 값 입력 selectOne_lastDay : " + main6);
			
			//입력 완료된 날짜값 초기화
			//session.removeAttribute("changedate");
			
			return "index.jsp?contentPage=admin/statisticsSales.jsp";
		} 
	}
	
	@RequestMapping(value = "/Usertotal.do", method = RequestMethod.GET)
	public String Usertotal(HttpSession session) {
		System.out.println("Usertotal() 실행");
		
		//현재 시간 추출
		LocalDate now = LocalDate.now();
		int year = now.getYear();
		int month = now.getMonthValue();
		//int day = now.getDayOfMonth(); //월단위 통계만 지원
		
		System.out.println("현재시간 체크 : " + LocalDate.now().format(DateTimeFormatter.ofPattern("yy/MM/dd")));
		
		//시간 저장할 객체 생성
		AdminVO vo = new AdminVO();
		AdminVO vo1 = new AdminVO();
		
		//추출된 값 저장
		vo.setMonth(month);
		vo.setYear(year);
		
		System.out.println("vo값 체크 : " + vo);
		
		//전월 대비 값
		vo1 = setlastmonth(vo);
		
		AdminVO main1 = adminService.selectMonth_visitcnt(vo);
		AdminVO main2 = adminService.selectMonth_regcnt(vo);
		List<AdminVO> main3 = adminService.visitcntlist();
		AdminVO main4 = adminService.lastMonth_visitcnt(vo1);
		AdminVO main5 = adminService.lastMonth_regcnt(vo1);
		
		Map<Integer, Integer> map = new HashMap<Integer, Integer>();
		
		for(AdminVO vomap : main3) {
			map.put(vomap.getMonth(), vomap.getVisitcnt());
		}
		
		for(int i = 1; i < 13; i++) {
			if(map.get(i) == null) {
				map.put(i, 0);
			}
		}
		
		ArrayList<AdminVO> list = new ArrayList<AdminVO>(); 
		
		for(int i = 0; i < 12; i++) {
			AdminVO temp = new AdminVO();
			temp.setVisitcnt(map.get(i+1));
			list.add(i, temp);
		}
		
		System.out.println("map.keySet : " + map.keySet());
		System.out.println("map.size : " + map.size());
		System.out.println("연간 방문자 수 map 데이터 체크 : " + map);
		System.out.println("연간 방문자 수 map 데이터 체크 : " + map.get(11));
		System.out.println("연간 방문자 수 map 데이터 체크 : " + map.get(12));
		System.out.println("새로운 list 크기 : " + list.size());
		System.out.println("새로운 list 값 : " + list);
		
		if(main1 != null) {
			session.setAttribute("visitcnt", main1);
			session.setAttribute("regcnt", main2);
			session.setAttribute("visitcntlist", list);
			session.setAttribute("lastMonth_visitcnt", main4);
			session.setAttribute("lastMonth_regcnt", main5);
			
			System.out.println("월 방문자 수 체크 : " + main1);
			System.out.println("월 가입자 수 체크 : " + main2);
			System.out.println("연간 방문자 수 체크 : " + map);
			System.out.println("전월 방문자 수 체크 : " + main4);
			System.out.println("전월 가입자 수 체크 : " + main5);
			
			return "index.jsp?contentPage=admin/statisticsMember.jsp";
		} else {
			return null;
		}
	}
	
	@RequestMapping(value = "/adminboard.do")
	public String adminboard(HttpSession session) {
		System.out.println("adminboard 실행");
		
		//전체 게시글 목록 요청
		List<BoardVO> adminnotice = adminService.allnoticeboard();
		
		PagingVO page = createPage(adminnotice.size(), 1);
		
		//====================================
		//현재페이지 기준으로 DB데이터(게시글) 가져오기
		//시작글번호, 끝 글번호로 
		List<BoardVO> list = adminService.getnoticelist(page.getBegin(), page.getEnd());
		
		System.out.println("> 현재페이지 글목록(list) 갯수 : " + list.size());
		System.out.println("page 값 체크 : " + page);
		System.out.println("adminnotice 값 체크 : " + adminnotice);
		
		session.setAttribute("adminboardlist", list);
		session.setAttribute("page", page);
		
		return "index.jsp?contentPage=admin/adminboard.jsp";
	}
	
	@RequestMapping(value = "/adminfreeboard.do")
	public String adminfreeboard(HttpSession session) {
		System.out.println("adminfreeboard 실행");
		
		//전체 게시글 목록 요청
		List<BoardVO> adminfree = adminService.allfreeboard();
		
		PagingVO page = createPage(adminfree.size(), 1);
		
		//====================================
		//현재페이지 기준으로 DB데이터(게시글) 가져오기
		//시작글번호, 끝 글번호로 
		List<BoardVO> list = adminService.getfreeboardlist(page.getBegin(), page.getEnd());
		
		System.out.println("> 현재페이지 글목록(list) 갯수 : " + list.size());
		System.out.println("page 값 체크 : " + page);
		System.out.println("adminfree 값 체크 : " + adminfree);
		
		session.setAttribute("adminfreeboardlist", list);
		session.setAttribute("page", page);
		
		return "index.jsp?contentPage=admin/adminfreeboard.jsp";
	}
	
	@RequestMapping(value = "/getAdminBoardList.do")
	@ResponseBody
	public Map<String, Object> getAdminBoardList(HttpSession session, String cPage) { //@RequestBody : json 문자열로 전달 받은 데이터를 객체 형태로 변환하여 받을 때 사용
		System.out.println("getAdminBoardList 실행");
		
		//넘어온 페이지 값 확인
		System.out.println("cPage 값 확인 : " + cPage);
		
		//전체 게시글 목록 요청
		List<BoardVO> adminnotice = adminService.allnoticeboard();
		
		PagingVO page = createPage(adminnotice.size(), Integer.parseInt(cPage));
		
		//====================================
		//현재페이지 기준으로 DB데이터(게시글) 가져오기
		//시작글번호, 끝 글번호로 
		List<BoardVO> list = adminService.getnoticelist(page.getBegin(), page.getEnd());
		session.setAttribute("page", page);
		
		System.out.println("> 현재페이지 글목록(list) : " + list);
		System.out.println("page 값 체크 : " + page);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("page", page);
		
		System.out.println("map 값 체크 : " + map);
		
		return map;
	}
	
	@RequestMapping(value = "/getAdminFreeBoardList.do")
	@ResponseBody
	public Map<String, Object> getAdminFreeBoardList(HttpSession session, String cPage) { //@RequestBody : json 문자열로 전달 받은 데이터를 객체 형태로 변환하여 받을 때 사용
		System.out.println("getAdminFreeBoardList 실행");
		
		//넘어온 페이지 값 확인
		System.out.println("cPage 값 확인 : " + cPage);
		
		//전체 게시글 목록 요청
		List<BoardVO> adminfree = adminService.allfreeboard();
		
		PagingVO page = createPage(adminfree.size(), Integer.parseInt(cPage));
		
		//====================================
		//현재페이지 기준으로 DB데이터(게시글) 가져오기
		//시작글번호, 끝 글번호로 
		List<BoardVO> list = adminService.getfreeboardlist(page.getBegin(), page.getEnd());
		session.setAttribute("page", page);
		
		System.out.println("> 현재페이지 글목록(list) : " + list);
		System.out.println("page 값 체크 : " + page);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("page", page);
		
		System.out.println("map 값 체크 : " + map);
		
		return map;
	}
	
	@RequestMapping(value = "/adminedithome.do")
	public String adminedithome(HttpSession session, String email) {
		System.out.println("adminedithome 실행");
		
		System.out.println("넘어온 email 값 확인 : " + email);
		
		//정보 검색을 위한 vo객체 생성
		MemberVO vo = new MemberVO();
		vo.setEmail(email);
		
		vo = memberService.oneMember(vo);
		
		System.out.println("vo 값 확인 : " + vo);
		
		session.setAttribute("oneadmin", vo);
		
		return "index.jsp?contentPage=admin/adminedithome.jsp";
	}
	
	@SuppressWarnings("unused")
	@RequestMapping(value = "/adminedit.do")
	public String adminedit(HttpSession session, String editrank, String doit, String email, HttpServletResponse response) throws IOException {
		System.out.println("adminedit 실행");
		
		System.out.println("넘어온 editrank 선택값 확인 : " + editrank);
		System.out.println("넘어온 email 선택값 확인 : " + email);
		System.out.println("넘어온 doit 선택값 확인 : " + doit);
		
		
		//수정할 정보를 담을 vo 객체 생성
		MemberVO vo = (MemberVO)session.getAttribute("oneadmin");
		
		System.out.println("수정할 vo 값 체크 : " + vo);
		
		if("수정".equals(doit)) {
			
			//변경할 권한 지정 안했을 시
			if(editrank == null) {
				
				response.setContentType("text/html; charset=UTF-8");
				
				PrintWriter out = response.getWriter();
		        out.println("<script>alert('" + "수정할 권한을 지정하지 않으셨습니다." + "');</script> ");
		        out.flush();
				
		        String result = "adminedithome.do?email=";
		        result += vo.getEmail();
		        System.out.println("경고메시지 출력 후 리턴할 url 값 " + result);
		        
		        return result;
			}
			
			//변경할 권한 지정했을 시
			if(editrank != null) {
				vo.setRank(editrank);
				memberService.updateMember(vo);
				
				response.setContentType("text/html; charset=UTF-8");
				
				PrintWriter out = response.getWriter();
		        out.println("<script>alert('" + "관리자 권한정보 수정 완료" + "');</script> ");
		        out.flush();
				
				return "adminhome.do";
			}
			
		} else if("삭제".equals(doit)) {
			System.out.println("계정 삭제 실행");
			if(email != null) {
				vo = new MemberVO();
				vo.setEmail(email);
				vo = memberService.oneMember(vo);
			}
			vo.setM_useable("불가");
			
			System.out.println("삭제할 vo 값 체크 : " + vo);
			
			memberService.updateMember(vo);
			
			response.setContentType("text/html; charset=UTF-8");
			
			PrintWriter out = response.getWriter();
	        out.println("<script>alert('" + "계정정보 삭제 완료" + "');</script> ");
	        out.flush();
			
			return "adminhome.do";
			
		} else if("돌아가기".equals(doit)) {
			System.out.println("돌아가기 실행");
			
			return "adminhome.do";
		} else {
			return "adminhome.do";
		}
		return null;
	}
	
	
	@RequestMapping(value = "/adminboardedithome.do")
	public String adminboardedithome(HttpSession session, int boardid) {
		System.out.println("adminboardedithome 실행");
		
		System.out.println("넘어온 boardid 값 확인 : " + boardid);
		
		//정보 검색을 위한 vo객체 생성
		BoardVO vo = new BoardVO();
		vo.setBoard_id(boardid);
		
		vo = adminService.oneAdminBoard(vo);
		
		System.out.println("vo 값 확인 : " + vo);
		
		session.setAttribute("onenotice", vo);
		
		return "index.jsp?contentPage=admin/adminboardedit.jsp";
	}
	
	@RequestMapping(value = "/adminboardedit.do")
	public String adminboardedit(HttpSession session, BoardVO onenotice, String doit, String boardid, HttpServletResponse response) throws IOException {
		System.out.println("adminboardedit 실행");
		
		System.out.println("넘어온 객체 확인 : " + onenotice);
		System.out.println("넘어온 doit 확인 : " + doit);
		System.out.println("수정페이지 넘어온 boardid 확인 : " + boardid);
	
		if("수정".equals(doit)) {
			boardService.updateBoard(onenotice);
			
			response.setContentType("text/html; charset=UTF-8");
			
			PrintWriter out = response.getWriter();
	        out.println("<script>alert('" + "게시글 수정 완료" + "');</script> ");
	        out.flush();
			
		} else if("삭제".equals(doit)) {
			
			if(boardid != null) {
				BoardVO vo = new BoardVO();
				vo.setBoard_id(Integer.parseInt(boardid));
				boardService.deleteBoard(vo);
				
				response.setContentType("text/html; charset=UTF-8");
				
				PrintWriter out = response.getWriter();
		        out.println("<script>alert('" + "게시글 삭제 완료" + "');</script> ");
		        out.flush();
				
				
			} else if(boardid == null) {
				boardService.deleteBoard(onenotice);
				

				response.setContentType("text/html; charset=UTF-8");
				
				PrintWriter out = response.getWriter();
		        out.println("<script>alert('" + "게시글 삭제 완료" + "');</script> ");
		        out.flush();
				
			}
			
		}
		return "adminboard.do";
	}
	
	@RequestMapping(value = "/adminfreeboardedithome.do")
	public String adminfreeboardedithome(HttpSession session, int boardid) {
		System.out.println("adminfreeboardedithome 실행");
		
		System.out.println("넘어온 boardid 값 확인 : " + boardid);
		
		//정보 검색을 위한 vo객체 생성
		BoardVO vo = new BoardVO();
		vo.setBoard_id(boardid);
		
		vo = adminService.oneAdminBoard(vo);
		
		System.out.println("vo 값 확인 : " + vo);
		
		session.setAttribute("onefreeboard", vo);
		
		return "index.jsp?contentPage=admin/adminfreeboardedit.jsp";
	}
	
	@RequestMapping(value = "/adminfreeboardedit.do")
	public String adminfreeboardedit(HttpSession session, BoardVO onenotice, String doit, String boardid, HttpServletResponse response) throws IOException {
		System.out.println("adminfreeboardedit 실행");
		
		System.out.println("넘어온 객체 확인 : " + onenotice);
		System.out.println("넘어온 doit 확인 : " + doit);
		System.out.println("수정페이지 넘어온 boardid 확인 : " + boardid);
	
		if("수정".equals(doit)) {
			boardService.updateBoard(onenotice);
			
			response.setContentType("text/html; charset=UTF-8");
			
			PrintWriter out = response.getWriter();
	        out.println("<script>alert('" + "게시글 수정 완료" + "');</script> ");
	        out.flush();
			
		} else if("삭제".equals(doit)) {
			
			if(boardid != null) {
				BoardVO vo = new BoardVO();
				vo.setBoard_id(Integer.parseInt(boardid));
				boardService.deleteBoard(vo);
				
				response.setContentType("text/html; charset=UTF-8");
				
				PrintWriter out = response.getWriter();
		        out.println("<script>alert('" + "게시글 삭제 완료" + "');</script> ");
		        out.flush();
				
				
			} else if(boardid == null) {
				boardService.deleteBoard(onenotice);
				

				response.setContentType("text/html; charset=UTF-8");
				
				PrintWriter out = response.getWriter();
		        out.println("<script>alert('" + "게시글 삭제 완료" + "');</script> ");
		        out.flush();
				
			}
			
		}
		return "adminfreeboard.do";
	}
	
	@RequestMapping(value = "/changeSaledate.do", method = RequestMethod.GET)
	public String changSaledate(HttpSession session, String Saledate) {
		System.out.println("changSaledate() 실행");
		System.out.println("받은 입력값 확인 : " + Saledate);
		
		if (Saledate == null || Saledate == "") {
			Saledate = LocalDate.now().toString();
		}
		
		//String으로 받은 날짜 값 형 변환
		Date date = null;
		
		try {
			date = new SimpleDateFormat("yyyy-MM-dd").parse(Saledate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		//변환된 값에서 월, 일 추출
		int month = Integer.parseInt(new SimpleDateFormat("MM").format(date));
		int day = Integer.parseInt(new SimpleDateFormat("dd").format(date));
		
		System.out.println("추출값 확인 : " + month);
		System.out.println("추출값 확인 : " + day);
		
		//받은 날짜 값 VO 객체에 저장
		AdminVO changedate = new AdminVO();
		changedate.setMonth(month);
		changedate.setDay(day);
		session.setAttribute("changedate", changedate);
		
		return "Saletotal.do";
	}
	
	@RequestMapping(value = "/changebranch.do", method = RequestMethod.GET)
	public String changebranch(HttpSession session, String changebranch) {
		System.out.println("changebranch() 실행");
		System.out.println("전달받은 branch 확인 : " + changebranch);
		
		//전달받은 branchid 값 vo 객체에 저장
		AdminVO changebranchid = new AdminVO();
		changebranchid.setBranchid(Integer.parseInt(changebranch));
		session.setAttribute("changebranch", changebranchid);
		
		return "Saletotal.do";
	}

	//컨트롤러 내부 사용 메소드
	public AdminVO setlastmonth(AdminVO vo) {
		AdminVO vo2 = new AdminVO();
		
		//전월 대비를 위한 vo2에 값 입력
		vo2.setMonth(vo.getMonth() - 1);
		vo2.setBranchid(vo.getBranchid());
		
		//1월일 경우 전월 대비 값 입력
		if(vo.getMonth() == 1) {
			vo2.setMonth(12);
		}
		
		return vo2;
	}
	
	public AdminVO setlastday(AdminVO vo) {
		AdminVO vo3 = new AdminVO();
		
		//전일 대비를 위한 vo3에 값 입력
		vo3.setBranchid(vo.getBranchid());
		vo3.setDay(vo.getDay() - 1);
		vo3.setMonth(vo.getMonth());
		
		//1일일 경우 전일 대비 값 입력
		if(vo.getDay() == 1) {
			if(vo.getMonth() == 2) {
				vo3.setDay(28);
			}
			if(vo.getMonth() == 11 || vo.getMonth() == 9 || vo.getMonth() == 6 || vo.getMonth() == 4) {
				vo3.setDay(30);
			}
			if(vo.getMonth() == 1 || vo.getMonth() == 3 || vo.getMonth() == 5 || vo.getMonth() == 7 || vo.getMonth() == 8 || vo.getMonth() == 10 || vo.getMonth() == 12) {
				vo3.setDay(31);
			}
		}
		return vo3;
	}
	
	public PagingVO createPage(int totalrecordsize, int cPage) {
		//페이징 객체 생성
		PagingVO page = new PagingVO();
		
		//전체 게시물 수 구하기
		page.setTotalRecord(totalrecordsize);
		page.setTotalPage();
		System.out.println("> 전체 게시글 수 : " + page.getTotalRecord());
		System.out.println("> 전체 페이지 수 : " + page.getTotalPage());
		
		//초기 페이지 세팅
		page.setNowPage(cPage);
		
		//현재 페이지에 표시할 게시글 시작번호(begin), 끝번호(end) 구하기
		page.setEnd(page.getNowPage() * page.getNumPerPage()); //현재페이지번호 * 페이지당게시글 수
		page.setBegin(page.getEnd() - page.getNumPerPage() + 1);
		
		//끝번호가 해당 페이지 데이터 건 수 보다 크면 데이터 건수와 동일한 번호로 설정 
		if (page.getEnd() > page.getTotalRecord()) {
			page.setEnd(page.getTotalRecord());
		}
		System.out.println(">> 시작번호(begin) : " + page.getBegin());
		System.out.println(">> 끝번호(end) : " + page.getEnd());
		
		//---- 블록(block) 계산하기 ----------------
		//4. 블록의 시작페이지, 끝페이지 구하기(현재페이지 번호 사용)
		//시작페이지 구하기
		int nowPage = page.getNowPage();
		int beginPage = (nowPage - 1) / page.getPagePerBlock() * page.getPagePerBlock() + 1;
		page.setBeginPage(beginPage);
		page.setEndPage(page.getBeginPage() + page.getPagePerBlock() - 1);
		
		//4-1. 끝페이지(endPage)가 전체페이지 수(totalPage) 보다 크면
		// 끝페이지를 전체페이지 수로 변경 처리
		if (page.getEndPage() > page.getTotalPage()) {
			page.setEndPage(page.getTotalPage());
		}
		System.out.println(">> beginPage : " + page.getBeginPage());
		System.out.println(">> endPage : " + page.getEndPage());
		
		return page;
	}
	
}

