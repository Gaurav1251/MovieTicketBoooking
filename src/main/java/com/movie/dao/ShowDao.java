package com.movie.dao;

import java.util.List;

import com.movie.pojo.Show;

public interface ShowDao {
	
	public boolean addShow(Show s);
	public boolean updateShow(Show s);
	public boolean deleteShow(int showId);
	
	public List<Show> getAllShows();
	public Show getShowById(int showId);
	public List<Show> getShowsByMovie(int show_MovieId);
	public List<Show> getShowsByTheatre(String theatreName_loc);
	
}
