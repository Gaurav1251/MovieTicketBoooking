package com.movie.dao;

import com.movie.pojo.login;

public interface logindao {
	public boolean checkAdmin(String userName,String password );
	public boolean checkCustmor(String userName, String password);
	public login getAdmin(String userName);
	public boolean updateAdmin(login Admin);
	public login getAdmin(int id);
	
}
