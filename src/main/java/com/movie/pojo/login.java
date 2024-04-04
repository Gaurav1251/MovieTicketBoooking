package com.movie.pojo;

public class login {
	int id;
	String user;
	String pass;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public login() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getUser() {
		return user;
	}
	public login(int id, String user, String pass) {
		super();
		this.id = id;
		this.user = user;
		this.pass = pass;
	}
	@Override
	public String toString() {
		return "id=" + id + ", user=" + user + ", pass=" + pass ;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	

}
