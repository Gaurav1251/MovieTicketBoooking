package com.movie.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.movie.pojo.Booking;
import com.movie.util.DBConnectivity;

public class BookingDaoImpl implements BookingDao {
	Connection con = null;
	PreparedStatement ps, ps2;
	ResultSet rs = null;
	String sql = null, sql2 = null;
	Booking b = null;
	List<String> reservedSeats = new ArrayList();

	String arr[];

	@Override
	public Booking bookMyShow(int bookingShowId, String custEmailId, String bookingSeats) {
		con = DBConnectivity.getConnection();
		sql = "insert into Booking_12500(bookingShowId, custEmailId, bookingDate, bookingSeats, totalBill) values (?,?,?,?,?)";
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, bookingShowId);
			ps.setString(2, custEmailId);

			DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
			String bookingDate = LocalDateTime.now().format(format);
			ps.setTimestamp(3, Timestamp.valueOf(bookingDate));

			ps.setString(4, bookingSeats);

			double price = new ShowDaoImpl().getShowById(bookingShowId).getPrice();
			int noOfSeats = bookingSeats.split(",").length;

			double totalBill = price * noOfSeats;
			ps.setDouble(5, totalBill);

			int i = ps.executeUpdate();

			if (i > 0) {
				sql2 = "select * from Booking_12500 where custEmailId=? and bookingDate=?";
				ps2 = con.prepareStatement(sql2);

				ps2.setString(1, custEmailId);
				ps2.setTimestamp(2, Timestamp.valueOf(bookingDate));

				rs = ps2.executeQuery();

				while (rs.next()) {

					b = new Booking();
					b.setBookingId(rs.getInt(1));
					b.setBookingShowId(rs.getInt(2));
					b.setBookingShow(new ShowDaoImpl().getShowById(rs.getInt(2)));
					b.setCustEmailId(rs.getString(3));
					b.setBookingDate(rs.getTimestamp(4).toLocalDateTime());
					b.setBookingSeats(rs.getString(5));
					b.setTotalBill(rs.getDouble(6));

					return b;
				}
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return null;
	}

	@Override
	public boolean cancelBooking(int bookingId) {
		con = DBConnectivity.getConnection();
		sql = "delete from Booking_12500 where bookingId=?";
		try {
			ps = con.prepareStatement(sql);

			ps.setInt(1, bookingId);

			int i = ps.executeUpdate();
			if (i > 0)
				return true;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return false;
	}

	@Override
	public List<Booking> getMyBookings(String custEmailId) {
		// TODO Auto-generated method stub
		con=DBConnectivity.getConnection();
		sql="select * from Booking_12500 where custEmailId=? ";
		try {
			ps=con.prepareStatement(sql);
			ps.setString(1, custEmailId);
			rs=ps.executeQuery();
			List<Booking> mytick=new ArrayList();
			while(rs.next()) {
				b=new Booking();
				b.setBookingId(rs.getInt(1));
				b.setBookingShowId(rs.getInt(2));
				b.setCustEmailId(rs.getString(3));
				b.setBookingDate(rs.getTimestamp(4).toLocalDateTime());
				b.setBookingSeats(rs.getString(5));
				b.setTotalBill(rs.getDouble(6));

				b.setBookingShow(new ShowDaoImpl().getShowById(rs.getInt(2)));
				
				mytick.add(b);
				/* System.out.println(mytick); */
				
			}
			
			return mytick;
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return null;
	}

	@Override
	public List<Booking> getAllBookings() {
		
		
		con=DBConnectivity.getConnection();
		sql="select * from Booking_12500";
		try {
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			
			List<Booking> Allbook=new ArrayList<Booking>();
			while (rs.next()) {
				
				b=new Booking();
				b.setBookingId(rs.getInt(1));
				b.setBookingShowId(rs.getInt(2));
				b.setCustEmailId(rs.getString(3));
				b.setBookingDate(rs.getTimestamp(4).toLocalDateTime());
				b.setBookingSeats(rs.getString(5));
				b.setTotalBill(rs.getDouble(6));

				b.setBookingShow(new ShowDaoImpl().getShowById(rs.getInt(2)));
				
				Allbook.add(b);
			}
		
			return Allbook;
			
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		
		
		return null;
	}

	public Booking getBookingById(int bookingId) {
		con = DBConnectivity.getConnection();
		sql = "select * from Booking_12500 where bookingId=?";
		try {
			ps = con.prepareStatement(sql);

			ps.setInt(1, bookingId);

			rs = ps.executeQuery();

			while (rs.next()) {

				b = new Booking();
				b.setBookingId(rs.getInt(1));
				b.setBookingShowId(rs.getInt(2));
				b.setBookingShow(new ShowDaoImpl().getShowById(rs.getInt(2)));
				b.setCustEmailId(rs.getString(3));
				b.setBookingDate(rs.getTimestamp(4).toLocalDateTime());
				b.setBookingSeats(rs.getString(5));
				b.setTotalBill(rs.getDouble(6));

				return b;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return null;
	}

	@Override
	public List<String> getreservedSeats(int showId) {
		con = DBConnectivity.getConnection();
		sql = "select bookingSeats from Booking_12500 where bookingShowId=? ";

		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, showId);
			rs = ps.executeQuery();
			while (rs.next()) {
				String s = rs.getString(1);
				
				arr = s.split(",");

				for (String s1 : arr) {

					reservedSeats.add(s1);
				}

			}
			
			return reservedSeats;

		} catch (Exception e) {
			// TODO: handle exception
		}

		return null;
	}
}
