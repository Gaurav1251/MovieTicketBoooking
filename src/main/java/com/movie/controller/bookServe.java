package com.movie.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.movie.dao.BookingDaoImpl;
import com.movie.dao.MovieDaoImpl;
import com.movie.dao.ShowDaoImpl;
import com.movie.pojo.Booking;
import com.movie.pojo.Movie;
import com.movie.pojo.Show;

/**
 * Servlet implementation class bookServe
 */
@WebServlet("/bookServe")
public class bookServe extends HttpServlet {
	private static final long serialVersionUID = 1L;
      String process;
      int showId;
      RequestDispatcher rd;
      BookingDaoImpl book=new BookingDaoImpl();
      int bookingShowId;
      String custEmailId;
      String bookingSeats;
      HttpSession session;
      Booking bk;
      List<Show> slist;
      ShowDaoImpl simp=new ShowDaoImpl();
      Show s;
      Movie movie;
      int BookingId;
  	MovieDaoImpl mimpl = new MovieDaoImpl();
  	List<Movie> al = null;
      List<String> reservedSeats ;
      
      
      List<Booking> mytick;
  	Booking b;
  	BookingDaoImpl bimp = new BookingDaoImpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public bookServe() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process=request.getParameter("process");
		if(process!=null && process.equals("bookshow"))
		{
			int showIdd=Integer.parseInt(request.getParameter("showId"));
			reservedSeats=book.getreservedSeats(showIdd);
			request.setAttribute("showId", showIdd);
			request.setAttribute("seats", reservedSeats);
			
			rd=request.getRequestDispatcher("selectseats.jsp");
			rd.include(request, response);
		}
		else if(process!=null && process.equals("AllBook"))
		{
			List<Booking> Allbook;
			
	Allbook=bimp.getAllBookings();
//			System.out.println(Allbook.size());
			if(Allbook!=null)
			{
				
				session=request.getSession();
				session.setAttribute("AllBooks", Allbook);
				rd=request.getRequestDispatcher("AllBooks.jsp");
				rd.include(request, response);
			}
			else{
				request.setAttribute("msg", "Sorry No Bookings Are Done Yet...");
				
				rd=request.getRequestDispatcher("AllBooks.jsp");
				rd.include(request, response);
				
			}
			
		}
		else if(process!=null && process.equals("cancel")) {
			BookingId =Integer.parseInt(request.getParameter("bookingId"));
			if(bimp.cancelBooking(BookingId)) {
				session=request.getSession();
				String email = (String) session.getAttribute("user");
				mytick = bimp.getMyBookings(email);
				session.setAttribute("mytick", mytick);
				request.setAttribute("msg", "Your Booking Cancelled Successfully");
				rd=request.getRequestDispatcher("tickets.jsp");
				rd.include(request, response);
				
				
			}
			else {
				request.setAttribute("msg", "Some Error Occured");
				rd=request.getRequestDispatcher("tickets.jsp");
				rd.include(request, response);
				
			}
			
			
		}
		
		
			
			
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process=request.getParameter("process");
		if(process!=null && process.equals("payment"));
		{
			session =request.getSession();
			bookingShowId=Integer.parseInt(request.getParameter("showId"));
			 custEmailId=(String )session.getAttribute("user");
			
			 bookingSeats=request.getParameter("bookedseats");
			
			bk=book.bookMyShow(bookingShowId, custEmailId, bookingSeats);
			s=simp.getShowById(bookingShowId);
			movie=s.getShowMovie();
			
			if(bk!=null) {
				
				slist=simp.getShowsByMovie(s.getShow_MovieId());
				
				session.setAttribute("sl", slist);
				session.setAttribute("bk", bk);
				request.setAttribute("msg", "Congrats Your Tickets Are Successfully Booked...");
				
				rd=request.getRequestDispatcher("presentbook.jsp");
				rd.include(request, response);
				
			}
			else {
				request.setAttribute("msg", "Some Error Occured...");
				rd=request.getRequestDispatcher("index.jsp");
				rd.include(request, response);
				
				
			}
			
		}
	}

}
