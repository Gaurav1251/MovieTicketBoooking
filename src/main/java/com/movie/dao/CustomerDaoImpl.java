package com.movie.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import com.movie.pojo.Customer;
import com.movie.pojo.Movie;
import com.movie.util.DBConnectivity;


public class CustomerDaoImpl implements CustomerDao{
	Connection con=null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	String sql=null;
	Customer c=null;
	List<Customer> clist=null;
	
	@Override
	public boolean addCustomer(Customer c) {
		con=DBConnectivity.getConnection();
		sql="insert into Customer_12500(firstName, lastName, emailId, contact, address, password) values (?,?,?,?,?,?)";
		
		try {
			ps=con.prepareStatement(sql);
			ps.setString(1, c.getFirstName());
			ps.setString(2, c.getLastName());
			ps.setString(3, c.getEmailId());
			ps.setString(4, c.getContact());
			ps.setString(5, c.getAddress());
			ps.setString(6, c.getPassword());
			
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
	public boolean updateCustomer(Customer c) {
		con=DBConnectivity.getConnection();
		sql="update Customer_12500 set firstName=?, lastName=?, emailId=?, contact=?, address=?, password=? where custId=?";
		
		try {
			ps=con.prepareStatement(sql);
			ps.setString(1, c.getFirstName());
			ps.setString(2, c.getLastName());
			ps.setString(3, c.getEmailId());
			ps.setString(4, c.getContact());
			ps.setString(5, c.getAddress());
			ps.setString(6, c.getPassword());
			ps.setInt(7, c.getCustId());
			
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
	public boolean deleteCustomer(int custId) {
		con=DBConnectivity.getConnection();
		sql="delete from Customer_12500 where custId=?";
		
		try {
			ps=con.prepareStatement(sql);
			ps.setInt(1, custId);
			
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
	public List<Customer> showAllCustomers() {
		con=DBConnectivity.getConnection();
		sql="select * from Customer_12500";
		
		try {
			ps=con.prepareStatement(sql);
			
			rs=ps.executeQuery();
			
			clist=new ArrayList<>();
			
			while(rs.next()) {
				
				c=new Customer();
				c.setCustId(rs.getInt(1));
				c.setFirstName(rs.getString(2));
				c.setLastName(rs.getString(3));
				c.setEmailId(rs.getString(4));
				c.setContact(rs.getString(5));
				c.setAddress(rs.getString(6));
				c.setPassword(rs.getString(7));
				
				clist.add(c);
			}
			
			Collections.sort(clist);
			return clist;
			
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
	public List<Customer> showCustomerByFirstName(String firstName) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Customer> showCustomerByLastName(String lastName) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Customer showCustomerById(int custId) {
		con=DBConnectivity.getConnection();
		sql="select * from Customer_12500 where custId=?";
		
		try {
			ps=con.prepareStatement(sql);
			ps.setInt(1, custId);
			
			rs=ps.executeQuery();
			
			while(rs.next()) {
				//(int custId, String firstName, String lastName, String emailId, String contact, String address,String password)
				c=new Customer(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), 
						rs.getString(5), rs.getString(6), rs.getString(7));
				
				return c;
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
	public Customer showCustomerByEmailId(String emailId) {
		con=DBConnectivity.getConnection();
		sql="select * from Customer_12500 where emailId=?";
		
		try {
			ps=con.prepareStatement(sql);
			ps.setString(1, emailId);
			
			rs=ps.executeQuery();
			
			while(rs.next()) {
				//(int custId, String firstName, String lastName, String emailId, String contact, String address,String password)
				c=new Customer(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), 
						rs.getString(5), rs.getString(6), rs.getString(7));
				
				return c;
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

}
