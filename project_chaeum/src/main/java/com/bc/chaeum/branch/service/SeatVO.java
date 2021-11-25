package com.bc.chaeum.branch.service;

public class SeatVO {
	private int seat_id;
	private String seat_check;
	private String seat_info;
	private String seat_price;
	public int getSeat_id() {
		return seat_id;
	}
	public void setSeat_id(int seat_id) {
		this.seat_id = seat_id;
	}
	public String getSeat_check() {
		return seat_check;
	}
	public void setSeat_check(String seat_check) {
		this.seat_check = seat_check;
	}
	public String getSeat_info() {
		return seat_info;
	}
	public void setSeat_info(String seat_info) {
		this.seat_info = seat_info;
	}
	public String getSeat_price() {
		return seat_price;
	}
	public void setSeat_price(String seat_price) {
		this.seat_price = seat_price;
	}
	@Override
	public String toString() {
		return "SeatVO [seat_id=" + seat_id + ", seat_check=" + seat_check + ", seat_info=" + seat_info
				+ ", seat_price=" + seat_price + "]";
	}
	
	
}
