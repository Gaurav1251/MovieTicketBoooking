package com.movie.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

import com.movie.pojo.Movie;
import com.movie.pojo.Show;
import com.movie.util.DBConnectivity;

public class ShowDaoImpl implements ShowDao{
	Connection con=null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	String sql=null;
	List<Show> slist=null;
	Show s=null;
	
	@Override
	public boolean addShow(Show s) {
		con=DBConnectivity.getConnection();
		sql="insert into Show_12500(show_MovieId,screnn_no, theatreName_loc, show_Type, showDate, startTime, endTime, price) values (?,?,?,?,?,?,?,?)";
		
		try {
			ps=con.prepareStatement(sql);
			ps.setInt(1, s.getShow_MovieId());
			System.out.println(s.getScrenn_no());
			ps.setInt(2, s.getScrenn_no());
			ps.setString(3, s.getTheatreName_loc());
			ps.setString(4 ,s.getShow_Type());
			ps.setDate(5, Date.valueOf(s.getShowDate()));
			ps.setString(6, s.getStartTime().toString());
			ps.setString(7, s.getEndTime().toString());
			ps.setDouble(8, s.getPrice());
			
			int i=ps.executeUpdate();
			
			if(i>0)
				return true;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			
			try {
				ps.close();
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		return false;
	}

	@Override
	public boolean updateShow(Show s) {
		con=DBConnectivity.getConnection();
		sql="update Show_12500 set show_MovieId=?,screnn_no=?, theatreName_loc=?, show_Type=?, showDate=?, startTime=?, endTime=?, price=? where showId=?";
		
		try {
			ps=con.prepareStatement(sql);
			ps.setInt(1, s.getShow_MovieId());
			ps.setInt(2, s.getScrenn_no());
			ps.setString(3, s.getTheatreName_loc());
			ps.setString(4, s.getShow_Type());
			ps.setDate(5, Date.valueOf(s.getShowDate()));
			ps.setString(6, s.getStartTime().toString());
			ps.setString(7, s.getEndTime().toString());
			ps.setDouble(8, s.getPrice());
			ps.setInt(9, s.getShowId());
			
			int i=ps.executeUpdate();
			
			if(i>0)
				return true;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			
			try {
				ps.close();
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		return false;
	}

	@Override
	public boolean deleteShow(int showId) {
		con=DBConnectivity.getConnection();
		sql="delete from Show_12500 where showId=?";
		
		try {
			ps=con.prepareStatement(sql);
			ps.setInt(1, showId);
			
			int i=ps.executeUpdate();
			
			if(i>0)
				return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
finally {
			
			try {
				ps.close();
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		return false;
	}

	@Override
	public List<Show> getAllShows() {
		con=DBConnectivity.getConnection();
		sql="select * from Show_12500";
		
		try {
			ps=con.prepareStatement(sql);
			
			rs=ps.executeQuery();
			slist=new ArrayList<>();
			
			while(rs.next()) {
				s=new Show();
				s.setShowId(rs.getInt(1));
				
				s.setShow_MovieId(rs.getInt(2));
				s.setScrenn_no(rs.getInt(3));
				s.setTheatreName_loc(rs.getString(4));
				s.setShow_Type(rs.getString(5));
				s.setShowDate(rs.getDate(6).toLocalDate());
				s.setStartTime(LocalTime.parse(rs.getString(7)));
				s.setEndTime(LocalTime.parse(rs.getString(8)));
				s.setPrice(rs.getDouble(9));
				
				Movie m=new MovieDaoImpl().getMovieById(rs.getInt(2));
				s.setShowMovie(m);
				
				slist.add(s);
			}
			
			return slist;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			
			try {
				ps.close();
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		return null;
	}

	@Override
	public Show getShowById(int showId) {
		con=DBConnectivity.getConnection();
		sql="select * from Show_12500 where showId=?";
		
		try {
			ps=con.prepareStatement(sql);
			ps.setInt(1, showId);
			
			rs=ps.executeQuery();
			
			while(rs.next()) {
				s=new Show();
				s.setShowId(rs.getInt(1));
				s.setScrenn_no(rs.getInt(3));
				s.setShow_MovieId(rs.getInt(2));
				s.setTheatreName_loc(rs.getString(4));
				s.setShow_Type(rs.getString(5));
				s.setShowDate(rs.getDate(6).toLocalDate());
				s.setStartTime(LocalTime.parse(rs.getString(7)));
				s.setEndTime(LocalTime.parse(rs.getString(8)));
				s.setPrice(rs.getDouble(9));
				
				Movie m=new MovieDaoImpl().getMovieById(rs.getInt(2));
				s.setShowMovie(m);
				
				return s;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			
			try {
				ps.close();
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		return null;
	}

	@Override
	public List<Show> getShowsByMovie(int show_MovieId) {
		con=DBConnectivity.getConnection();
		sql="select * from Show_12500 where show_MovieId=?";
		
		try {
			ps=con.prepareStatement(sql);
			ps.setInt(1, show_MovieId);
			
			rs=ps.executeQuery();
			slist=new ArrayList<>();
			
			while(rs.next()) {
				s=new Show();
				s.setShowId(rs.getInt(1));
				s.setScrenn_no(rs.getInt(3));
				s.setShow_MovieId(rs.getInt(2));
				s.setTheatreName_loc(rs.getString(4));
				s.setShow_Type(rs.getString(5));
				s.setShowDate(rs.getDate(6).toLocalDate());
				s.setStartTime(LocalTime.parse(rs.getString(7)));
				s.setEndTime(LocalTime.parse(rs.getString(8)));
				s.setPrice(rs.getDouble(9));
				
				Movie m=new MovieDaoImpl().getMovieById(rs.getInt(2));
				s.setShowMovie(m);
				
				slist.add(s);
			}
			
			return slist;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			
			try {
				ps.close();
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		return null;
	}

	@Override
	public List<Show> getShowsByTheatre(String theatreName_loc) {
		con=DBConnectivity.getConnection();
		sql="select * from Show_12500 where theatreName_loc=?";
		try {
		ps=con.prepareStatement(sql);
		ps.setString(1, theatreName_loc);
		
		rs=ps.executeQuery();
		slist=new ArrayList<>();
		
		while(rs.next()) {
			s=new Show();
			s.setShowId(rs.getInt(1));
			s.setScrenn_no(rs.getInt(2));
			s.setShow_MovieId(rs.getInt(3));
			s.setTheatreName_loc(rs.getString(4));
			s.setShow_Type(rs.getString(5));
			s.setShowDate(rs.getDate(6).toLocalDate());
			s.setStartTime(LocalTime.parse(rs.getString(7)));
			s.setEndTime(LocalTime.parse(rs.getString(7)));
			s.setPrice(rs.getDouble(9));
			
			Movie m=new MovieDaoImpl().getMovieById(rs.getInt(2));
			s.setShowMovie(m);
			
			slist.add(s);
		}
		
		return slist;
		}
		catch(Exception e) {
			
			e.printStackTrace();
		}
		
		finally {
			
			try {
				ps.close();
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		return null;
	}

}
