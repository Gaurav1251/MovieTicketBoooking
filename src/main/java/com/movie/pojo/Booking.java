package com.movie.pojo;

import java.time.LocalDateTime;

public class Booking {
	
	int bookingId;
	int bookingShowId;
	Show bookingShow;
	String custEmailId;
	LocalDateTime bookingDate;
	String bookingSeats;
	double totalBill;
	
	public Booking() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Booking(int bookingId, int bookingShowId, Show bookingShow, String custEmailId, LocalDateTime bookingDate,
			String bookingSeats, double totalBill) {
		super();
		this.bookingId = bookingId;
		this.bookingShowId = bookingShowId;
		this.bookingShow = bookingShow;
		this.custEmailId = custEmailId;
		this.bookingDate = bookingDate;
		this.bookingSeats = bookingSeats;
		this.totalBill = totalBill;
	}
	@Override
	public String toString() {
		return "Booking Id: " + bookingId + "\nShow details:-" + bookingShow
				+ "\nEmail Id=" + custEmailId + "\nDate of Booking : " + bookingDate + "\nSeats: " + bookingSeats
				+ "\nBill: " + totalBill;
	}
	public int getBookingId() {
		return bookingId;
	}
	public void setBookingId(int bookingId) {
		this.bookingId = bookingId;
	}
	public int getBookingShowId() {
		return bookingShowId;
	}
	public void setBookingShowId(int bookingShowId) {
		this.bookingShowId = bookingShowId;
	}
	public Show getBookingShow() {
		return bookingShow;
	}
	public void setBookingShow(Show bookingShow) {
		this.bookingShow = bookingShow;
	}
	public String getCustEmailId() {
		return custEmailId;
	}
	public void setCustEmailId(String custEmailId) {
		this.custEmailId = custEmailId;
	}
	public LocalDateTime getBookingDate() {
		return bookingDate;
	}
	public void setBookingDate(LocalDateTime bookingDate) {
		this.bookingDate = bookingDate;
	}
	public String getBookingSeats() {
		return bookingSeats;
	}
	public void setBookingSeats(String bookingSeats) {
		this.bookingSeats = bookingSeats;
	}
	public double getTotalBill() {
		return totalBill;
	}
	public void setTotalBill(double totalBill) {
		this.totalBill = totalBill;
	}
	
	

}
