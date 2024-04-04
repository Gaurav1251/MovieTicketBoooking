package com.movie.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.movie.pojo.login;
import com.movie.util.DBConnectivity;

public class logindaoimpl implements logindao {
	Connection con=null;
	PreparedStatement pst=null;
	ResultSet rs=null;
	String sql=null;
	login obj;
	@Override
	public boolean checkAdmin(String userName, String password) {
		// TODO Auto-generated method stub
		try {
			con=DBConnectivity.getConnection();
			sql="select * from Admin where A_user=? AND A_pass=?";
			pst=con.prepareStatement(sql);
			pst.setString(1, userName);
			pst.setString(2, password);
			rs=pst.executeQuery();
			if(rs.next())
			{
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return false;
	}
@Override
	public boolean checkCustmor(String userName, String password) {
		// TODO Auto-generated method stub
	try {
		con=DBConnectivity.getConnection();
		sql="select * from Customer_12500 where emailId=? AND password=?";
		pst=con.prepareStatement(sql);
		pst.setString(1, userName);
		pst.setString(2, password);
		rs=pst.executeQuery();
		if(rs.next())
		{
			return true;
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	
	return false;

	}
@Override
public login getAdmin(String userName) {
	
	try {
		con=DBConnectivity.getConnection();
		sql="select * from Admin where A_user=?";
		pst=con.prepareStatement(sql);
		pst.setString(1, userName);
		
		rs=pst.executeQuery();
		if(rs.next())
		{
			obj=new login(rs.getInt(1), rs.getString(2), rs.getString(3));
		}
		return obj;
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	return null;
}
@Override
public boolean updateAdmin(login Admin) {
	// TODO Auto-generated method stub
	try {
		con=DBConnectivity.getConnection();
		sql="update Admin set A_user=?,A_pass=? where id=?";
		pst=con.prepareStatement(sql);
		pst.setString(1, Admin.getUser());
		pst.setString(2, Admin.getPass());
		pst.setInt(3, Admin.getId());
		
		int i=pst.executeUpdate();
		if(i>0)
		{
			return true;
		}
		else {
			return false;
		}
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	
	return false;
}
@Override
public login getAdmin(int id) {
	try {
		con=DBConnectivity.getConnection();
		sql="select * from Admin where  id=?";
		pst=con.prepareStatement(sql);
		pst.setInt(1, id);
		
		rs=pst.executeQuery();
		if(rs.next())
		{
			obj=new login(rs.getInt(1), rs.getString(2), rs.getString(3));
		}
		return obj;
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return null;
}

}
