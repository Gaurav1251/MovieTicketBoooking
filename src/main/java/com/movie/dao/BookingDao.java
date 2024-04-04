package com.movie.dao;

import java.util.List;

import com.movie.pojo.Booking;

public interface BookingDao {
	
	public Booking bookMyShow(int bookingShowId, String custEmailId, String bookingSeats);
	boolean cancelBooking(int bookingId);
	List<Booking> getMyBookings(String custEmailId);
	List<Booking> getAllBookings();
	List<String> getreservedSeats(int showId);
}
