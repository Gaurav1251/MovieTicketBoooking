package com.movie.test;


import java.util.List;
import java.util.Scanner;

import com.movie.dao.CustomerDaoImpl;
import com.movie.pojo.Customer;


public class CustomerTest {

	public static void main(String[] args) {
		Scanner sc=new Scanner(System.in);
		Customer c;
		CustomerDaoImpl cimpl=new CustomerDaoImpl();
		List<Customer> al=null;
		
		System.out.println("-------------------Welcome to Customer Unit Testing--------------------");
		boolean exit=false;
		int custId;
		String firstName;
		String lastName;
		String emailId;
		String contact;
		String address;
		String password;
		boolean flag;
		
		
		do {
			
			System.out.println("Please select one of the below and enter the number according to your selection");
			System.out.println("1----> Add Customer Details");
			System.out.println("2----> Show all Customer");
			System.out.println("3----> Update Customer");
			System.out.println("4----> Delete Customer");
			System.out.println("5----> Show Customer by email id");
			System.out.println("6----> Exit");
			
			int choice=sc.nextInt();
			sc.nextLine();
			
			switch(choice) {
			
			case 1: System.out.println("Enter first name:-");
					firstName=sc.nextLine();
					
					System.out.println("Enter last name:- ");
					lastName=sc.nextLine();
					
					System.out.println("Enter email id:-");
					emailId=sc.nextLine();
					
					System.out.println("Enter contact:- ");
					contact=sc.nextLine();
					
					System.out.println("Enter address");
					address=sc.nextLine();
					
					System.out.println("Enter password:-");
					password=sc.nextLine();
					
					c=new Customer();
					c.setAddress(address);
					c.setContact(contact);
					c.setEmailId(emailId);
					c.setFirstName(firstName);
					c.setLastName(lastName);
					c.setPassword(password);
					
					
					flag=cimpl.addCustomer(c);
					
					if(flag)
						System.out.println("Customer details added successfully!!!");
					else
						System.out.println("Error while adding details");
					
			break;
			
			case 2: System.out.println("-----------------Customer List---------------------------");
						al=cimpl.showAllCustomers();
						
						if(al.isEmpty()||al==null)
							System.out.println("No Customer have been added yet...");
						else {
							
							for(Customer c1:al) {
								
								if(c1!=null) {
									System.out.println(c1);
									System.out.println("*******************************************");
								}
							}
						}
							
				break;
				
			case 3:
				System.out.println("Enter Id of Customer to be updated...");
				custId=sc.nextInt();
				sc.nextLine();
				
				c=cimpl.showCustomerById(custId);
				
				if(c==null)
					System.out.println("No customers with this id found! Please try again.");
				else {
					
					System.out.println("-------Customer------");
					System.out.println(c);
					
					System.out.println("\nDo you want to continue updating?Enter y for yes and n for no");
					char option=sc.next().charAt(0);
					sc.nextLine();
					
					if(option=='y') {
						
						System.out.println("Enter first name:-");
						firstName=sc.nextLine();
						
						System.out.println("Enter last name:- ");
						lastName=sc.nextLine();
						
						System.out.println("Enter email id:-");
						emailId=sc.nextLine();
						
						System.out.println("Enter contact:- ");
						contact=sc.nextLine();
						
						System.out.println("Enter address");
						address=sc.nextLine();
						
						System.out.println("Enter password:-");
						password=sc.nextLine();
						
						
						c.setAddress(address);
						c.setContact(contact);
						c.setEmailId(emailId);
						c.setFirstName(firstName);
						c.setLastName(lastName);
						c.setPassword(password);
						
						flag=cimpl.updateCustomer(c);
						
						if(flag)
							System.out.println("Customer updated successfully!!!");
						else
							System.out.println("Error while updating movie details.");
						
					}
					else if(option=='n') {
						
						System.out.println("Thank you!!");
					}
					else
						System.out.println("Please enter y for yes and n for no");
					
				}
				
				break;
				
			case 4:
				System.out.println("Enter Id of Customer to be deleted...");
				custId=sc.nextInt();
				sc.nextLine();
				
				c=cimpl.showCustomerById(custId);
				
				if(c==null)
					System.out.println("No customer with this id found! Please try again.");
				else {
					
					System.out.println("-------Customer------");
					System.out.println(c);
					
					System.out.println("\nAre you sure you want to delete?Enter y for yes and n for no");
					char option=sc.next().charAt(0);
					sc.nextLine();
					
					if(option=='y') {
						
						flag=cimpl.deleteCustomer(custId);
						
						if(flag)
							System.out.println("Customer deleted successfully!!!");
						else
							System.out.println("Error while deleting movie ");
						
					}
					else if(option=='n') {
						
						System.out.println("Thank you!!");
					}
					else
						System.out.println("Please enter y for yes and n for no");
					
				}
				
				break;
				
			case 5:
				System.out.println("Enter email id of customer to be searched...");
				emailId=sc.nextLine();
				
				c=cimpl.showCustomerByEmailId(emailId);
				
				if(c==null)
					System.out.println("No customer with this name found");
				else {
					System.out.println("------------Customer---------------");
					System.out.println(c);
				}
				break;
				
			case 6: exit=true;
			System.out.println("-----------------Thank you-------------------");
			break;
			
			
			default: System.out.println("Please enter number between 1 to 6 according to the options in menu.");
			}
		}while(exit==false);

		sc.close();

	}

}
