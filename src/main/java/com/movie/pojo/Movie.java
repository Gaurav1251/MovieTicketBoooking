package com.movie.pojo;

import java.time.LocalDate;

public class Movie implements Comparable<Movie>{
	
	int movieId;
	String movieName;
	String director;
	String producer;
	String writer;
	String cast;
	LocalDate releaseDate;
	
	public Movie() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Movie(int movieId, String movieName, String director, String producer, String writer, String cast,
			LocalDate releaseDate) {
		super();
		this.movieId = movieId;
		this.movieName = movieName;
		this.director = director;
		this.producer = producer;
		this.writer = writer;
		this.cast = cast;
		this.releaseDate = releaseDate;
	}
	@Override
	public String toString() {
		return "\nId=" + movieId + "\nMovie Name=" + movieName + "\nDirector=" + director + "\nProducer="
				+ producer + "\nWriter=" + writer + "\nCast=" + cast + "\nRelease Date=" + releaseDate;
	}
	public int getMovieId() {
		return movieId;
	}
	public void setMovieId(int movieId) {
		this.movieId = movieId;
	}
	public String getMovieName() {
		return movieName;
	}
	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	public String getProducer() {
		return producer;
	}
	public void setProducer(String producer) {
		this.producer = producer;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getCast() {
		return cast;
	}
	public void setCast(String cast) {
		this.cast = cast;
	}
	public LocalDate getReleaseDate() {
		return releaseDate;
	}
	public void setReleaseDate(LocalDate releaseDate) {
		this.releaseDate = releaseDate;
	}
	@Override
	public int compareTo(Movie o) {
		
		return this.movieName.compareTo(o.movieName);
	}
	
	

}
