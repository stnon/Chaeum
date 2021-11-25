package com.bc.chaeum.reservation.service;

import java.sql.Date;

public class ReservationVO {
	
	private int reservation_id;
	private int reservation_checkin;
	private int reservation_checkout;
	private String reservation_status;
	private int reservation_price;
	private Date reservation_date;
	
	private int payment_id;
	private String email;
	private int studyroom_id;
	private int seat_id;
	private int locker_id;
	

	
	/*
	public ReservationVO(int reservation_id, int reservation_checkin, int reservation_checkout,
			String reservation_status, int reservation_price, Date reservation_date, String email, int studyroom_id) {
	
		this.reservation_id = reservation_id;
		this.reservation_checkin = reservation_checkin;
		this.reservation_checkout = reservation_checkout;
		this.reservation_status = reservation_status;
		this.reservation_price = reservation_price;
		this.reservation_date = reservation_date;
		this.email = email;
		this.studyroom_id = studyroom_id;
	}
	
	
	
	public ReservationVO(int reservation_id, int reservation_checkin, int reservation_checkout,
			String reservation_status, int reservation_price, Date reservation_date, int payment_id, String email,
			int studyroom_id) {

		this.reservation_id = reservation_id;
		this.reservation_checkin = reservation_checkin;
		this.reservation_checkout = reservation_checkout;
		this.reservation_status = reservation_status;
		this.reservation_price = reservation_price;
		this.reservation_date = reservation_date;
		this.payment_id = payment_id;
		this.email = email;
		this.studyroom_id = studyroom_id;
	}
*/


	public int getReservation_id() {
		return reservation_id;
	}
	public void setReservation_id(int reservation_id) {
		this.reservation_id = reservation_id;
	}
	
	public int getReservation_checkin() {
		return reservation_checkin;
	}
	public void setReservation_checkin(int reservation_checkin) {
		this.reservation_checkin = reservation_checkin;
	}
	public int getReservation_checkout() {
		return reservation_checkout;
	}
	public void setReservation_checkout(int reservation_checkout) {
		this.reservation_checkout = reservation_checkout;
	}
	public String getReservation_status() {
		return reservation_status;
	}
	public void setReservation_status(String reservation_status) {
		this.reservation_status = reservation_status;
	}
	public int getReservation_price() {
		return reservation_price;
	}
	public void setReservation_price(int reservation_price) {
		this.reservation_price = reservation_price;
	}
	public int getPayment_id() {
		return payment_id;
	}
	public void setPayment_id(int payment_id) {
		this.payment_id = payment_id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getStudyroom_id() {
		return studyroom_id;
	}
	public void setStudyroom_id(int studyroom_id) {
		this.studyroom_id = studyroom_id;
	}
	public int getSeat_id() {
		return seat_id;
	}
	public void setSeat_id(int seat_id) {
		this.seat_id = seat_id;
	}
	public int getLocker_id() {
		return locker_id;
	}
	public void setLocker_id(int locker_id) {
		this.locker_id = locker_id;
	}
	public Date getReservation_date() {
		return reservation_date;
	}
	public void setReservation_date(Date reservation_date) {
		this.reservation_date = reservation_date;
	}
	
	
	/*
	private long revNum;		// KEY
	private long startTime;		// 시작시간
	private long endTime;		// 끝 시간
	private int roomTime;		// 
	private int roomUser;		// 이메일
	private String roomDate;	// 사용할 예약일(달력에서 고른)
	private int roomType;		// 방타입
	private int roomPrice;		// 방가격
	private String payment;		// 결제수단
	private Date bookDate;		// 예약일
	
	private StudyRoomsVO studyRoomsVO;	
	*/
}
