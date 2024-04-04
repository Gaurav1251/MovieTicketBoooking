package com.movie.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.movie.dao.MovieDaoImpl;
import com.movie.pojo.Movie;

/**
 * Servlet implementation class MovieServe
 */
@WebServlet("/movieServe")
public class movieServe extends HttpServlet {
	private static final long serialVersionUID = 1L;
	int movieId;
	String movieName;
	String director;
	String producer;
	String writer;
	String cast;
	LocalDate releaseDate;
	boolean flag;
	Movie m =new Movie();
	MovieDaoImpl mimpl = new MovieDaoImpl();
	List<Movie> al = null;
	RequestDispatcher rd;
	PrintWriter pw;
	HttpSession session;
	
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public movieServe() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String process=request.getParameter("process");
	
		if (process.equals("AllMo") && process!=null) {
			
			al=mimpl.getAllMovies();
			if (al.isEmpty() || al==null) {
				request.setAttribute("msg", "Sorry No Movie Added Yet...");
				rd=request.getRequestDispatcher("AllMo.jsp");
				rd.include(request, response);
			}
			else {
				session=request.getSession();
				session.setAttribute("al", al);
				rd=request.getRequestDispatcher("AllMo.jsp");
				rd.include(request, response);
			}
			
			
		}
		else if (process.equals("update") && process!=null) {
			movieId= Integer.parseInt(request.getParameter("movieId"));
			m=mimpl.getMovieById(movieId);
			session.setAttribute("updobj", m);
			rd=request.getRequestDispatcher("UpdateMo.jsp");
			rd.include(request, response);
		}
		else if (process.equals("delete") && process!=null) {
			rd=request.getRequestDispatcher("AllMo.jsp");
			
			movieId=Integer.parseInt(request.getParameter("movieId"));
			flag=mimpl.deleteMovie(movieId);
if (flag) {
				
				al=mimpl.getAllMovies();
				session.setAttribute("al", al);
				request.setAttribute("msg", "Movie Deleted  Successfully...");
				rd.include(request, response);
				
				
			}
			else {
				al=mimpl.getAllMovies();
				session.setAttribute("al", al);
				request.setAttribute("msg", "Some Error Occured...");
				rd.include(request, response);
			}
			/*
			 * m=mimpl.getMovieById(movieId); session.setAttribute("delobj", m);
			 * rd=request.getRequestDispatcher("DeleteMo.jsp"); rd.include(request,
			 * response);
			 */
		}	
		
		
		

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		pw=response.getWriter();
		response.setContentType("text/html");
		String process=request.getParameter("process");
		if (process.equals("addMovie") && process!=null) {
			rd=request.getRequestDispatcher("AddMovie.jsp");
					
			movieName=request.getParameter("movieName");
			cast=request.getParameter("cast");
			writer=request.getParameter("writer");
			producer=request.getParameter("producer");
			director=request.getParameter("director");
			releaseDate=LocalDate.parse(request.getParameter("releaseDate"));
			
			m.setReleaseDate(releaseDate);
			m.setCast(cast);
			m.setDirector(director);
			m.setMovieName(movieName);
			m.setProducer(producer);
			m.setWriter(writer);
			flag=mimpl.addMovie(m);
			if (flag) {
				request.setAttribute("msg", "Movie Added Successfully...");
				rd.include(request, response);
				
				
			}
			else {
				request.setAttribute("msg", "Some Error Occured...");
				rd.include(request, response);
			}
		}
		
		else if(process.equals("edit") && process!=null){
			rd=request.getRequestDispatcher("AllMo.jsp");
			movieId=Integer.parseInt(request.getParameter("movieId"));
			movieName=request.getParameter("movieName");
			cast=request.getParameter("cast");
			writer=request.getParameter("writer");
			producer=request.getParameter("producer");
			director=request.getParameter("director");
			releaseDate=LocalDate.parse(request.getParameter("releaseDate"));
			m=new Movie(movieId, movieName, director, producer,writer ,cast, releaseDate);
			flag=mimpl.updateMovie(m);
			if (flag) {
				
				al=mimpl.getAllMovies();
				session.setAttribute("al", al);
				request.setAttribute("msg", "Movie Updated Successfully...");
				rd.include(request, response);
				
				
			}
			else {
				al=mimpl.getAllMovies();
				session.setAttribute("al", al);
				request.setAttribute("msg", "Some Error Occured...");
				rd.include(request, response);
			}
		}
		
		else if(process.equals("delete") && process!=null){
			rd=request.getRequestDispatcher("AllMo.jsp");
			movieId=Integer.parseInt(request.getParameter("movieId"));
			flag=mimpl.deleteMovie(movieId);
			
if (flag) {
				
				al=mimpl.getAllMovies();
				session.setAttribute("al", al);
				request.setAttribute("msg", "Movie Deleted  Successfully...");
				rd.include(request, response);
				
				
			}
			else {
				al=mimpl.getAllMovies();
				session.setAttribute("al", al);
				request.setAttribute("msg", "Some Error Occured...");
				rd.include(request, response);
			}
		}
	}
}
