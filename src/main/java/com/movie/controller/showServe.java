package com.movie.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.movie.dao.MovieDaoImpl;
import com.movie.dao.ShowDaoImpl;
import com.movie.pojo.Movie;
import com.movie.pojo.Show;

/**
 * Servlet implementation class showServe
 */
@WebServlet("/showServe")
public class showServe extends HttpServlet {
	private static final long serialVersionUID = 1L;
	int showId;
	int show_MovieId;
	Movie showMovie;
	MovieDaoImpl mimp=new MovieDaoImpl();
	Movie movie;
	String theatreName_loc;
	String show_Type;
	LocalDate showDate;
	LocalTime startTime;
	LocalTime endTime;
	int screen_no;
	double price;
	String process;
     List<Show> slist=new ArrayList<>();
     ShowDaoImpl simp=new ShowDaoImpl();
     RequestDispatcher rd;
     HttpSession session;
     Show show=new Show();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public showServe() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		process=request.getParameter("process");
		if(process.equals("getshow") && process!=null) {
			show_MovieId=Integer.parseInt(request.getParameter("movieId"));
			slist=simp.getShowsByMovie(show_MovieId);
			movie=mimp.getMovieById(show_MovieId); 
			if(slist.isEmpty() || slist==null) {
				
				
				
				request.setAttribute("msg", "Currently there are no Shows for  Movie : "+movie.getMovieName());
				/*
				 * session=request.getSession(); session.setAttribute("sl", slist);
				 */
				rd=request.getRequestDispatcher("AllMo.jsp");
				rd.forward(request, response);
				
				
			}
			else {
				session=request.getSession();
				session.setAttribute("sl", slist);
				response.sendRedirect("shows.jsp");
				
				
			}
		}
		else if(process.equals("updateshow") && process!=null) {
			showId=Integer.parseInt(request.getParameter("showId"));
			show=simp.getShowById(showId);
			
			session.setAttribute("showobj", show);
			response.sendRedirect("updateshows.jsp");
			
			
		}
		else if(process.equals("deleteshow") && process!=null) {
			showId=Integer.parseInt(request.getParameter("showId"));
			
			if(simp.deleteShow(showId) ){
				slist=simp.getShowsByMovie(showId);
				
				session=request.getSession();
				session.setAttribute("sl", slist);
				request.setAttribute("msg", "Show Deleted Successfully...");
				rd=request.getRequestDispatcher("shows.jsp");
				rd.forward(request, response);
				
			
				
				
			}
			else {
				request.setAttribute("msg", "Some Error Occured...");
				rd=request.getRequestDispatcher("shows.jsp");
				rd.include(request, response);
				
				
				
			}
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process=request.getParameter("process");
		if(process.equals("editshow") && process!=null) {
			showId=Integer.parseInt(request.getParameter("showId"));
			theatreName_loc=request.getParameter("theatreName_loc");
			showDate=LocalDate.parse( request.getParameter("showDate"));
			startTime=LocalTime.parse( request.getParameter("startTime"));
			endTime=LocalTime.parse( request.getParameter("endTime"));
			screen_no=Integer.parseInt(request.getParameter("screnn_no"));
			show_Type=request.getParameter("show_Type");
			price=Double.parseDouble(request.getParameter("price"));
			show_MovieId=Integer.parseInt(request.getParameter("show_MovieId"));
			show.setEndTime(endTime);
			show.setPrice(price);
			show.setScrenn_no(screen_no);
			show.setShow_MovieId(show_MovieId);
			show.setShow_Type(show_Type);
			show.setShowDate(showDate);
			show.setShowId(showId);
			show.setStartTime(startTime);
			
			if (simp.updateShow(show)) {
			
				slist=simp.getShowsByMovie(show_MovieId);
				
					
					request.setAttribute("msg", "Show Updated Successfully...");
					session=request.getSession();
					session.setAttribute("sl", slist);
					

					rd=request.getRequestDispatcher("shows.jsp");
					rd.forward(request, response);
					
					
				
				
				
				
				
				
			}
			else {
				request.setAttribute("msg", "Some Error Occured...");
				rd=request.getRequestDispatcher("shows.jsp");
				rd.include(request, response);
			}
			
		}
		else if(process.equals("Addshow") && process!=null) {
			
			theatreName_loc=request.getParameter("theatreName_loc");
			showDate=LocalDate.parse( request.getParameter("showDate"));
			startTime=LocalTime.parse( request.getParameter("startTime"));
			endTime=LocalTime.parse( request.getParameter("endTime"));
			screen_no=Integer.parseInt(request.getParameter("screnn_no"));
			show_Type=request.getParameter("show_Type");
			price=Double.parseDouble(request.getParameter("price"));
			show_MovieId=Integer.parseInt(request.getParameter("show_MovieId"));
			show.setTheatreName_loc(theatreName_loc);
			show.setShowDate(showDate);
			show.setStartTime(startTime);
			show.setEndTime(endTime);
			show.setScrenn_no(screen_no);
			show.setShow_Type(show_Type);
			show.setPrice(price);
			show.setShow_MovieId(show_MovieId);
			if (simp.addShow(show)) {
				request.setAttribute("msg", "Show Added Successfully...");
				slist=simp.getShowsByMovie(show_MovieId);
				session=request.getSession();
				session.setAttribute("sl", slist);
				rd=request.getRequestDispatcher("shows.jsp");
				rd.forward(request, response);
				
			}
			else {
				request.setAttribute("msg", "Some Error Occurred...");
				rd=request.getRequestDispatcher("shows.jsp");
				rd.forward(request, response);
				
				
			}
			
		}
		
	}

}
