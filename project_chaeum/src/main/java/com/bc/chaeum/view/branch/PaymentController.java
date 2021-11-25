package com.bc.chaeum.view.branch;

import java.sql.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.bc.chaeum.payment.service.PaymentService;
import com.bc.chaeum.payment.service.PaymentVO;

@Controller
@SessionAttributes("Payment")
public class PaymentController {
	@Autowired
	private PaymentService paymentService;
	
	public PaymentController() {
		System.out.println(">> PaymentContorller() 객체 생성");
	}
	
	@PostMapping("/setPayment.do")
	@ResponseBody
	public void setPayment(PaymentVO vo, @RequestParam(value="merchant_uid") String merchant_uid,
			@RequestParam(value="payment_method") String payment_method, @RequestParam(value="payment_price") String payment_price, 
			Model model) {
		
		
		vo.setMerchant_uid(merchant_uid);
		vo.setPayment_method(payment_method);
		vo.setPayment_price(payment_price);
		
		paymentService.insertPayment(vo);
		
		model.addAttribute("Payment", vo);
		
		
	}
}
