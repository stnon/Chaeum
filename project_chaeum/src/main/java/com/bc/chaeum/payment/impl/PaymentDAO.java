package com.bc.chaeum.payment.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bc.chaeum.payment.service.PaymentVO;

@Repository
public class PaymentDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public PaymentDAO() {
		System.out.println(">>PaymentDAO() 객체 생성");
	}
	
	public PaymentVO getPayInfo(int payment_id) {
		return mybatis.selectOne("payment.getPayInfo", payment_id);
	}
	
	public int insertPayment(PaymentVO vo) {
		return mybatis.insert("payment.insertPayment", vo);
	}
}
