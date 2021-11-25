package com.bc.chaeum.payment.service;

import java.util.List;

public interface PaymentService {
	public PaymentVO getPayInfo(int payment_id);
	public int insertPayment(PaymentVO vo);
}
