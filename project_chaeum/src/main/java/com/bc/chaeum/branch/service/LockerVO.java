package com.bc.chaeum.branch.service;

public class LockerVO {
	private int locker_id;
	private String locker_check;
	private String locker_price;
	public int getLocker_id() {
		return locker_id;
	}
	public void setLocker_id(int locker_id) {
		this.locker_id = locker_id;
	}
	public String getLocker_check() {
		return locker_check;
	}
	public void setLocker_check(String locker_check) {
		this.locker_check = locker_check;
	}
	public String getLocker_price() {
		return locker_price;
	}
	public void setLocker_price(String locker_price) {
		this.locker_price = locker_price;
	}
	@Override
	public String toString() {
		return "LockerVO [locker_id=" + locker_id + ", locker_check=" + locker_check + ", locker_price=" + locker_price
				+ "]";
	}
	
	
}
