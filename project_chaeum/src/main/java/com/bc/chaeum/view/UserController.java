package com.bc.chaeum.view;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Random;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bc.chaeum.admin.service.AdminService;
import com.bc.chaeum.board.service.BoardService;
import com.bc.chaeum.board.service.BoardVO;
import com.bc.chaeum.board.service.ReplyService;
import com.bc.chaeum.board.service.ReplyVO;
import com.bc.chaeum.common.SearchCriteria;
import com.bc.chaeum.member.service.MemberVO;
import com.bc.chaeum.member.service.UserService;
import com.bc.chaeum.reservation.service.ReservationService;
import com.bc.chaeum.reservation.service.ReservationVO;

@Controller
public class UserController {
	@Autowired
	private ReservationService reservaionService;
	
	@Autowired
	private UserService userService;

	@Autowired
	private JavaMailSender mailSender;

	@Autowired
	private AdminService adminService;

	@Autowired
	private BoardService boardService;

	@Autowired
	private ReplyService replyService;
	
	@Inject
	BCryptPasswordEncoder pwdEncoder;

	// 로그인처리
	@PostMapping("/login.do")
	public String login(HttpSession session, MemberVO vo, HttpServletResponse response ) {
		System.out.println(">>> 로그인 처리 - login()");
		System.out.println("vo : " + vo);
		
		if(vo.getRememberEmail() == null) {
			vo.setRememberEmail("off");
		}
		
		String rememberEmail = vo.getRememberEmail();
		System.out.println(rememberEmail);
		
		// 쿠키 체크 검사
		Cookie cookie = new Cookie("rememberEmail", vo.getEmail());
		System.out.println(rememberEmail);
		if (rememberEmail.equals("on")) {
			response.addCookie(cookie);
			System.out.println("3단계-쿠키 아이디저장 O");
			// 쿠키 확인
			System.out.println("Service check" + cookie);
		} else {
			System.out.println("3단계-쿠키 아이디저장 X");
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}


		MemberVO user = userService.loginUser(vo);
		boolean pwdMatch = pwdEncoder.matches(vo.getM_pass(), user.getM_pass());
		
		if(user != null && pwdMatch == true) {
			session.setAttribute("user", user);
			
			if ("관리자".equals(user.getRank()) || "마스터 관리자".equals(user.getRank())) {

				return "adminhome.do";
			} else {
				String now = LocalDate.now().format(DateTimeFormatter.ofPattern("yy/MM/dd"));
				System.out.println("now 값 체크 : " + now);
				adminService.updatevisitcnt(now);
				return "redirect:index.jsp";
			}
		} else {
			System.out.println(">> 로그인실패~~");
			session.setAttribute("user", null);

			return "index.jsp?contentPage=login/loginFail.jsp";
		}
	}

	// 로그인화면 이동
	@GetMapping("/login.do")
	public String loginView(MemberVO vo) {
		System.out.println(">>> 로그인 화면이동 - loginView()");

		return "index.jsp?contentPage=login/login.jsp";
	}
	
	// 로그인 아이디비번 체크
	@PostMapping("/singinCheck.do")
	@ResponseBody
	public String singinCheck(MemberVO vo) {
		System.out.println("로그인체크");
		System.out.println(vo);
		MemberVO mvo = new MemberVO();
		mvo = userService.signinCheck(vo);
		int r = 0;
		
		boolean pwdMatch = pwdEncoder.matches(vo.getM_pass(), mvo.getM_pass());
		
		System.out.println(pwdMatch);
		
		
		if(pwdMatch == false) {
			r = 2;
		} else if(pwdMatch == true) {
			r = 3;
		}
	
		return Integer.toString(r);
	}
	
	// 카카오 로그인
	@PostMapping("/kakaologin.do")
	public String kakaoLogin(MemberVO vo, HttpSession session) {
		System.out.println("카카오로그인");
		System.out.println(vo);
		int kakaoChk = userService.loginChk(vo.getEmail());
		
		if(kakaoChk == 0) {
			vo.setM_pass("카카오계정");
			vo.setRank("카카오회원");
			userService.insertUser(vo);
			session.setAttribute("user", vo);
			
			return "index.jsp";
		} else {
			session.setAttribute("user", vo);
			return "index.jsp";
		}
		
	}

	// 로그아웃처리
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		System.out.println(">>> 로그아웃 처리");
		session.invalidate();
		return "index.jsp";
	}

	// 회원가입
	@PostMapping("/signup.do")
	public String signup(MemberVO vo) {
		System.out.println(">> 회원가입 처리");
		String email = vo.getEmail1() + "@" + vo.getEmail2();
		vo.setEmail(email);
		
		String inputPass = vo.getM_pass();
		String pwd = pwdEncoder.encode(inputPass);
		vo.setM_pass(pwd);
		vo.setRank("일반회원");
		System.out.println("userVO : " + vo);

		userService.insertUser(vo);

		return "index.jsp";
	}

	// 이메일인증
	@GetMapping("/emailCheck")
	@ResponseBody
	public String emailCheck(String email) throws Exception {
		System.out.println("이메일 넘어오니" + email);

		// 인증번호 생성 6자리
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;

		System.out.println("보낼 인증번호" + checkNum);

		String fromMail = "webjava224@gmail.com";
		String toMail = email;
		String title = "[CHAEUM] 인증 메일입니다";
		String content = "방문해주셔서 감사합니다" + "<br><br>" + "인증번호는 " + checkNum + " 입니다" + "<br>" + "인증번호 확인란에 입력해주세요";

		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(fromMail);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);
			mailSender.send(message);

		} catch (Exception e) {
			e.printStackTrace();
		}

		String num = Integer.toString(checkNum);

		return num;
	}

	// 닉네임중복체크
	@PostMapping("/checkName.do")
	@ResponseBody
	public String checkName(@RequestParam("nickname") String nickname) {
		System.out.println(nickname);
		int rs = userService.checkName(nickname);

		System.out.println("결과값 : " + rs);

		return Integer.toString(rs);
	}

	// 이메일중복체크
	@PostMapping("/checkEmail.do")
	@ResponseBody
	public String checkEmail(@RequestParam("email") String email) {
		System.out.println(email);
		int rs = userService.checkEmail(email);

		System.out.println("결과값 : " + rs);

		return Integer.toString(rs);
	}

	// 마이페이지 이동
	@GetMapping("/mypage.do")
	public String myPage( Model model, HttpSession session) {
		System.out.println(">>> 마이페이지");

		MemberVO mvo = (MemberVO) session.getAttribute("user");

		List<BoardVO> boardList = boardService.getBoardList2(mvo.getEmail());
		List<ReplyVO> rlist = replyService.getMyReply(mvo.getEmail());
		model.addAttribute("boardList", boardList);
		model.addAttribute("rlist", rlist);
		
		List<ReservationVO> revList = reservaionService.getResInfoList_E(mvo.getEmail());
		
		model.addAttribute("RevList", revList);
		return "index.jsp?contentPage=member/myPage.jsp";
	}
	
	
	

	// 회원수정
	@GetMapping("/userUpdate.do")
	public String userUpdate(HttpSession session, MemberVO vo) {
		System.out.println(">>> 회원수정 !!");
		System.out.println(">>> 회원수정컨트롤러 " + vo);
		
		MemberVO mvo = (MemberVO) session.getAttribute("user");
		
		if(vo.getEmail() == null) {
			vo.setEmail(mvo.getEmail());
		}
		
		if(vo.getM_pass() == null) {
			vo.setM_pass(mvo.getM_pass());
		}
		
		if(vo.getNickname() == null) {
			vo.setNickname(mvo.getNickname());
		}
		
		String inputPass = vo.getM_pass();
		String pwd = pwdEncoder.encode(inputPass);
		vo.setM_pass(pwd);
		
		userService.userUpdate(vo);
		session.setAttribute("user", vo);

		return "index.jsp?contentPage=member/myPage.jsp";
	}

	// 회원탈퇴
	@GetMapping("/signout.do")
	public String userSignout(HttpSession session, String email) {
		System.out.println(">>> 회원탈퇴");

		userService.userSignout(email);
		session.invalidate();

		return "index.jsp";
	}

	// 비밀번호재설정페이지
	@GetMapping("/passFindPage.do")
	public String passFindPage() {
		System.out.println("비밀번호찾기페이지이동");
		
		return "index.jsp?contentPage=member/passFind.jsp";
	}

	// 비밀번호재설정
	@GetMapping("/passFind.do")
	public String passFind(MemberVO vo) {
		System.out.println("비밀번호찾기");
		System.out.println(vo);
		
		String inputPass = vo.getM_pass();
		String pwd = pwdEncoder.encode(inputPass);
		vo.setM_pass(pwd);
		
		userService.passFind(vo);
		System.out.println("비번수정후 : " + vo);
		return "index.jsp";
	}
	
	// 비밀번호 확인
	@PostMapping("/passChk.do")
	@ResponseBody
	public int passChk(MemberVO vo) {
		System.out.println("비밀번호체크");
		System.out.println(vo);
		MemberVO user = userService.loginUser(vo);
		boolean pwdMatch = pwdEncoder.matches(vo.getM_pass(), user.getM_pass());
		
		int result = 0;
		
		if(pwdMatch == true) {
			result = 1;
		} else if(pwdMatch == false) {
			result = 0;
		}
		
//		int result = userService.passChk(vo);
		System.out.println(result);
		return result;
	}
	
}
