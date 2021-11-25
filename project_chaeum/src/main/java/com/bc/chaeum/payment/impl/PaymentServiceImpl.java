package com.bc.chaeum.payment.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bc.chaeum.payment.service.PaymentService;
import com.bc.chaeum.payment.service.PaymentVO;

@Service("paymentService")
public class PaymentServiceImpl implements PaymentService{
	@Autowired
	private PaymentDAO paymentDAO;
	
	public PaymentServiceImpl() {
		System.out.println(">> PaymentServiceImpl() 객체생성");
	}

	@Override
	public PaymentVO getPayInfo(int payment_id) {
		
		return paymentDAO.getPayInfo(payment_id);
	}

	@Override
	public int insertPayment(PaymentVO vo) {
		return paymentDAO.insertPayment(vo);
	}
	
}
