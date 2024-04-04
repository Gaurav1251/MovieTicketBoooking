package com.movie.dao;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.sql.*;
import com.movie.pojo.Movie;
import com.movie.util.DBConnectivity;

public class MovieDaoImpl implements MovieDao{
	
	Connection con=null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	String sql=null;
	Movie m=null;
	List<Movie> mlist=null;
	@Override
	public boolean addMovie(Movie m) {
		
		con=DBConnectivity.getConnection();
		sql="insert into Movie_12500(movieName, director, producer, writer, cast, releaseDate) values (?,?,?,?,?,?)";
		
		try {
			ps=con.prepareStatement(sql);
			ps.setString(1, m.getMovieName());
			ps.setString(2, m.getDirector());
			ps.setString(3, m.getProducer());
			ps.setString(4, m.getWriter());
			ps.setString(5, m.getCast());
			
			Date d=Date.valueOf(m.getReleaseDate());
			
			ps.setDate(6, d);
			
			int i=ps.executeUpdate();
			
			if(i>0)
				return true;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			try {
				con.close();
				ps.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		return false;
	}

	@Override
	public boolean updateMovie(Movie m) {
		
		con=DBConnectivity.getConnection();
		sql="update Movie_12500 set movieName=?, director=?, producer=?, writer=?, cast=?, releaseDate=? where movieId=?";
		
		try {
			ps=con.prepareStatement(sql);
			ps.setString(1, m.getMovieName());
			ps.setString(2, m.getDirector());
			ps.setString(3, m.getProducer());
			ps.setString(4, m.getWriter());
			ps.setString(5, m.getCast());
			ps.setDate(6, Date.valueOf(m.getReleaseDate()));
			ps.setInt(7, m.getMovieId());
			
			int i=ps.executeUpdate();
			
			if(i>0)
				return true;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			try {
				con.close();
				ps.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		return false;
	}

	@Override
	public boolean deleteMovie(int movieId) {
		con=DBConnectivity.getConnection();
		sql="delete from Movie_12500 where movieId=?";
		
		try {
			ps=con.prepareStatement(sql);
			ps.setInt(1, movieId);
			
			int i=ps.executeUpdate();
			
			if(i>0)
				return true;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			try {
				con.close();
				ps.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		return false;
	}

	@Override
	public List<Movie> getAllMovies() {
		
		con=DBConnectivity.getConnection();
		sql="select * from Movie_12500";
		
		try {
			ps=con.prepareStatement(sql);
			
			rs=ps.executeQuery();
			
			mlist=new ArrayList<>();
			
			while(rs.next()) {
				
				m=new Movie();
				m.setMovieId(rs.getInt(1));
				m.setMovieName(rs.getString(2));
				m.setDirector(rs.getString(3));
				m.setProducer(rs.getString(4));
				m.setWriter(rs.getString(5));
				m.setCast(rs.getString(6));
				m.setReleaseDate(rs.getDate(7).toLocalDate());
				
				mlist.add(m);
			}
			
			Collections.sort(mlist);
			
			return mlist;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			try {
				con.close();
				ps.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		return null;
	}

	@Override
	public Movie getMovieById(int movieId) {
		con=DBConnectivity.getConnection();
		sql="select * from Movie_12500 where movieId=?";
		
		try {
			ps=con.prepareStatement(sql);
			ps.setInt(1, movieId);
			
			rs=ps.executeQuery();
			
			while(rs.next()) {
				
				m=new Movie(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), 
						rs.getString(5), rs.getString(6), rs.getDate(7).toLocalDate());
				
				return m;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			
			try {
				con.close();
				ps.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return null;
	}

	@Override
	public List<Movie> getMovieByName(String movieName) {
		
		con=DBConnectivity.getConnection();
		sql="select * from Movie_12500 where movieName=?";
		
		try {
			ps=con.prepareStatement(sql);
			ps.setString(1, movieName);
			
			rs=ps.executeQuery();
			
			mlist=new ArrayList<>();
			
			while(rs.next()) {
				
				m=new Movie();
				m.setMovieId(rs.getInt(1));
				m.setMovieName(rs.getString(2));
				m.setDirector(rs.getString(3));
				m.setProducer(rs.getString(4));
				m.setWriter(rs.getString(5));
				m.setCast(rs.getString(6));
				m.setReleaseDate(rs.getDate(7).toLocalDate());
				
				mlist.add(m);
			}
			
			return mlist;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			try {
				con.close();
				ps.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		return null;
	}

	@Override
	public List<Movie> getMovieByProducer(String producer) {
		con=DBConnectivity.getConnection();
		sql="select * from Movie_12500 where producer=?";
		
		try {
			ps=con.prepareStatement(sql);
			ps.setString(1, producer);
			
			rs=ps.executeQuery();
			
			mlist=new ArrayList<>();
			
			while(rs.next()) {
				
				m=new Movie();
				m.setMovieId(rs.getInt(1));
				m.setMovieName(rs.getString(2));
				m.setDirector(rs.getString(3));
				m.setProducer(rs.getString(4));
				m.setWriter(rs.getString(5));
				m.setCast(rs.getString(6));
				m.setReleaseDate(rs.getDate(7).toLocalDate());
				
				mlist.add(m);
			}
			
			Collections.sort(mlist);
			
			return mlist;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}

	@Override
	public List<Movie> getMovieByDirector(String director) {
		// TODO Auto-generated method stub
		return null;
	}

}
