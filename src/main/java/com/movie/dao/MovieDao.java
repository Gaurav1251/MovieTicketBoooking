package com.movie.dao;

import java.util.List;

import com.movie.pojo.Movie;

public interface MovieDao {
	
	public boolean addMovie(Movie m);
	public boolean updateMovie(Movie m);
	public boolean deleteMovie(int movieId);
	
	List<Movie> getAllMovies();
	Movie getMovieById(int movieId);
	List<Movie> getMovieByName(String movieName);
	List<Movie> getMovieByProducer(String producer);
	List<Movie> getMovieByDirector(String director);

}
