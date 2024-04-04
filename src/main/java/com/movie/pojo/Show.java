package com.movie.pojo;

import java.time.LocalDate;
import java.time.LocalTime;

public class Show {
	
	int showId;
	int show_MovieId;
	Movie showMovie;
	String theatreName_loc;
	String show_Type;
	LocalDate showDate;
	LocalTime startTime;
	LocalTime endTime;
	double price;
	int screnn_no;
	
	public int getScrenn_no() {
		return screnn_no;
	}
	public void setScrenn_no(int screnn_no) {
		this.screnn_no = screnn_no;
	}
	public Show() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Show(int showId, int show_MovieId, Movie showMovie, String theatreName_loc, String show_Type,
			LocalDate showDate, LocalTime startTime, LocalTime endTime, double price, int screnn_no) {
		super();
		this.showId = showId;
		this.show_MovieId = show_MovieId;
		this.showMovie = showMovie;
		this.theatreName_loc = theatreName_loc;
		this.show_Type = show_Type;
		this.showDate = showDate;
		this.startTime = startTime;
		this.endTime = endTime;
		this.price = price;
		this.screnn_no = screnn_no;
	}
	@Override
	public String toString() {
		return "\nMovie Details...." + showMovie
				+"\n\nShowId=" + showId +  "\nTheatre=" + theatreName_loc + "\nScreen No=" +screnn_no+ "\nShow Type=" + show_Type + "\nDate=" + showDate
				+ "\nStart Time=" + startTime + "\nEnd Time=" + endTime + "\nPrice=" + price;
	}
	public int getShowId() {
		return showId;
	}
	public void setShowId(int showId) {
		this.showId = showId;
	}
	public int getShow_MovieId() {
		return show_MovieId;
	}
	public void setShow_MovieId(int show_MovieId) {
		this.show_MovieId = show_MovieId;
	}
	public Movie getShowMovie() {
		return showMovie;
	}
	public void setShowMovie(Movie showMovie) {
		this.showMovie = showMovie;
	}
	public String getTheatreName_loc() {
		return theatreName_loc;
	}
	public void setTheatreName_loc(String theatreName_loc) {
		this.theatreName_loc = theatreName_loc;
	}
	public String getShow_Type() {
		return show_Type;
	}
	public void setShow_Type(String show_Type) {
		this.show_Type = show_Type;
	}
	public LocalDate getShowDate() {
		return showDate;
	}
	public void setShowDate(LocalDate showDate) {
		this.showDate = showDate;
	}
	public LocalTime getStartTime() {
		return startTime;
	}
	public void setStartTime(LocalTime startTime) {
		this.startTime = startTime;
	}
	public LocalTime getEndTime() {
		return endTime;
	}
	public void setEndTime(LocalTime endTime) {
		this.endTime = endTime;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	
	

}
