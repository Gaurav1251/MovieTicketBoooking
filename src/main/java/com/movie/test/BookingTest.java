package com.movie.test;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import com.movie.dao.BookingDaoImpl;
import com.movie.pojo.Booking;
import com.movie.pojo.Show;

public class BookingTest {

	public static void main(String[] args) {
		boolean exit = false;
		int choice;
		int bookingId;
		int bookingShowId;
		Show bookingShow;
		String custEmailId;
		LocalDateTime bookingDate;
		String bookingSeats;
		double totalBill;
		char option;
		boolean flag;

		Scanner sc = new Scanner(System.in);
		BookingDaoImpl bimpl = new BookingDaoImpl();
		Booking b;

		do {

			System.out.println("1-----> Book show");
			System.out.println("2-----> Cancel my booking");
			choice = sc.nextInt();
			sc.nextLine();

			switch (choice) {
			case 1:
				System.out.println("Enter show id:-");
				bookingShowId = sc.nextInt();
				sc.nextLine();

				System.out.println("Enter your email id:-");
				custEmailId = sc.nextLine();

				System.out.println("Select your seats:- ");
				bookingSeats = sc.nextLine();

				b = bimpl.bookMyShow(bookingShowId, custEmailId, bookingSeats);
				System.out.println(b);
				if (b != null) {

					System.out.println("Your show has been booked!!Enjoy!!");
					System.out.println("Please check the details of your booking as given below:- ");

				} else
					System.out.println("Error while booking show");
				break;

			case 2:
				System.out.println("Enter the booking id for cancelation");
				bookingId = sc.nextInt();
				sc.nextLine();

				b = bimpl.getBookingById(bookingId);

				if (b != null) {
					System.out.println(b);

					System.out.println("Are you sure you want to delete? Enter y for yes and n for no");
					option = sc.next().charAt(0);
					sc.nextLine();

					if (option == 'y') {

						flag = bimpl.cancelBooking(bookingId);

						if (flag)
							System.out.println("Booking cancelled");
						else
							System.out.println("Error while cancelling your booking");
					} else if (option == 'n')
						System.out.println("Thank you");
					else
						System.out.println("Enter y for yes and n for no");
				} else
					System.out.println("No bookings of this id found");
				break;
			case 3:
				System.out.println("Enter the booking id for cancelation");
				int r = sc.nextInt();
				sc.nextLine();
				List<String> r1=new ArrayList();
				r1=bimpl.getreservedSeats(r);
				for(String r2:r1) {
					System.out.println(r2);
				}
				
			case 4:
				System.out.println("Enter your email id:-");
				custEmailId = sc.nextLine();
				
				
			}

		} while (exit == false);
		sc.close();
	}

}
