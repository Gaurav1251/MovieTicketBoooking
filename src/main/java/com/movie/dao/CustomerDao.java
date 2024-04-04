package com.movie.dao;

import java.util.List;

import com.movie.pojo.Customer;

public interface CustomerDao {
	
	public boolean addCustomer(Customer c);
	public boolean updateCustomer(Customer c);
	public boolean deleteCustomer(int custId);
	
	public List<Customer> showAllCustomers();
	public List<Customer> showCustomerByFirstName(String firstName);
	public List<Customer> showCustomerByLastName(String lastName);
	public Customer showCustomerById(int custId);
	public Customer showCustomerByEmailId(String emailId);
	

}
