package com.bc.chaeum.view.branch;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Calendar;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.bc.chaeum.branch.service.BranchService;
import com.bc.chaeum.branch.service.BranchVO;
import com.bc.chaeum.branch.service.StudyroomVO;
import com.bc.chaeum.member.service.MemberVO;
import com.bc.chaeum.payment.service.PaymentService;
import com.bc.chaeum.payment.service.PaymentVO;
import com.bc.chaeum.reservation.service.ReservationService;
import com.bc.chaeum.reservation.service.ReservationVO;

@Controller
@SessionAttributes({"Reservation","Payment"})
public class ReservationController {
	@Autowired
	private ReservationService reservaionService;
	@Autowired
	private PaymentService paymentService;
	@Autowired
	private BranchService branchService;
	
	
	public ReservationController() {
		System.out.println(">> ReservaionController() 객체 생성");
	}
	
	@RequestMapping("/getReservaionList.do")
	public List<ReservationVO> getReservationList(Model model, HttpSession session) {
		
		MemberVO member = (MemberVO)session.getAttribute("user");
		String email = member.getEmail();
		List<ReservationVO> revList = reservaionService.getResInfoList_E(email);
		
		model.addAttribute("ReservationList", revList);
		return revList;
	}
	
	@RequestMapping("/getReservation.do")
	public String getBranch(ReservationVO vo, Model model, HttpSession session) {
		MemberVO member = (MemberVO)session.getAttribute("user");
		String email = member.getEmail();
		System.out.println(vo.getReservation_id());
		ReservationVO resVO = reservaionService.getResInfo(vo);
		System.out.println(resVO.getReservation_date());
		model.addAttribute("Reservation", resVO); //Model 객체 사용 View로 데이터 전달
		
		PaymentVO pvo = paymentService.getPayInfo(resVO.getPayment_id());
		model.addAttribute("Payment", pvo);
		
		Pattern pattern = Pattern.compile("[b](.*?)[_]");
		Matcher matcher = pattern.matcher(pvo.getMerchant_uid());
		
		String matchBid="";
		while (matcher.find()) {
		    matchBid=matcher.group(1);
		    
		    if(matcher.group(1) ==  null)
		    	break;
		}
		System.out.println(matchBid);

		int branch_id = Integer.parseInt(matchBid);
		BranchVO branch = new BranchVO();
		branch.setBranch_id(branch_id);
		BranchVO bvo = branchService.getBranch(branch);
		model.addAttribute("branch", bvo);
		return "index.jsp?contentPage=reservation/confirmRes.jsp";
	}
	
	
	
	
	@PostMapping(value="/Reservation.do")
	@ResponseBody
	public void setReservation(ReservationVO vo, @RequestParam(value = "payment") String payment,@RequestParam(value = "revNum") int revNum,
			@RequestParam(value = "startTime") int startTime,@RequestParam(value = "endTime") int endTime,
			@RequestParam(value = "roomTime") int roomTime,@RequestParam(value = "roomPrice") int roomPrice,
			@RequestParam(value = "roomDate") Date roomDate,@RequestParam(value = "roomType") int roomType, PaymentVO pvo, @RequestParam(value="merchant_uid") String merchant_uid,
			@RequestParam(value="payment_method") String payment_method, @RequestParam(value="payment_price") String payment_price,
			Model model,HttpSession session) {
		
		//BranchVO branch = (BranchVO) session.getAttribute("branch");
		MemberVO member = (MemberVO)session.getAttribute("user");
		System.out.println("################################################################"+member.getEmail());
		//model.addAttribute("payment", payment);
		
		
        long miliseconds = System.currentTimeMillis();
        Date pdate = new Date(miliseconds);
		
		pvo.setMerchant_uid(merchant_uid);
		pvo.setPayment_method(payment_method);
		pvo.setPayment_price(payment_price);
		pvo.setPayment_date(pdate);
		paymentService.insertPayment(pvo);
		
		model.addAttribute("Payment", pvo);
		
		vo.setReservation_checkin(startTime);
		vo.setReservation_checkout(endTime);
		vo.setReservation_price(roomPrice);
		vo.setReservation_status(payment);
		vo.setReservation_date(roomDate);
		vo.setStudyroom_id(roomType);
		vo.setEmail(member.getEmail());
		vo.setReservation_id(revNum);
		reservaionService.insertReservation(vo);
	
		
		
		model.addAttribute("Reservation", vo);
		
	}
}
