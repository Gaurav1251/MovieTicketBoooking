package com.movie.test;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;
import java.util.Scanner;

import com.movie.dao.ShowDaoImpl;
import com.movie.pojo.Movie;
import com.movie.pojo.Show;

public class ShowTest {

	public static void main(String[] args) {
		Scanner sc=new Scanner(System.in);
		Movie showMovie;
		Show s;
		ShowDaoImpl simpl=new ShowDaoImpl();
		List<Show> slist=null;
		int screnn_no;
		boolean exit=false, flag;
		int showId;
		int show_MovieId;
		String theatreName_loc;
		String show_Type;
		LocalDate showDate;
		LocalTime startTime;
		LocalTime endTime;
		double price;
		int year;
		int month;
		int dayOfMonth;
		int hour;
		int minute;
		char option;
		System.out.println("Welcome to show unit testing................");
		do {
			System.out.println("Please enter one of the below given options....");
			System.out.println("1-------> Add show details");
			System.out.println("2-------> Display all shows");
			System.out.println("3-------> Update show");
			System.out.println("4-------> Delete show");
			
			int choice=sc.nextInt();
			sc.nextLine();
			
			switch(choice) {
			
			case 1: System.out.println("Enter movie id:-");
			show_MovieId=sc.nextInt();
			sc.nextLine();
			
			
			
			System.out.println("Enter Screen_no:-");
			screnn_no=sc.nextInt();
			sc.nextLine();
			
			System.out.println("Enter theatre name and location");
			theatreName_loc=sc.nextLine();
			
			System.out.println("Enter show type:-");
			show_Type=sc.nextLine();
			
			System.out.println("Enter year of show:-");
			year=sc.nextInt();
			sc.nextLine();
			
			System.out.println("Enter month of show:- Number between 1 to 12");
			month=sc.nextInt();
			sc.nextLine();
			
			System.out.println("Enter day of show:-Number between 1 to 31");
			dayOfMonth=sc.nextInt();
			sc.nextLine();
			
			showDate=LocalDate.of(year, month, dayOfMonth);
			
			System.out.println("Enter start hour:- Number between 0 to 23");
			hour=sc.nextInt();
			sc.nextLine();
			
			System.out.println("Enter start minute:- Number between 0 to 59");
			minute=sc.nextInt();
			sc.nextLine();
			
			startTime=LocalTime.of(hour, minute);
			
			System.out.println("Enter end hour:- Number between 0 to 23");
			hour=sc.nextInt();
			sc.nextLine();
			
			System.out.println("Enter end minute:- Number between 0 to 59");
			minute=sc.nextInt();
			sc.nextLine();
			
			endTime=LocalTime.of(hour, minute);
			
			System.out.println("Enter price:-");
			price=sc.nextDouble();
			sc.nextLine();
			
			s=new Show();
			s.setEndTime(endTime);
			s.setPrice(price);
			s.setShow_MovieId(show_MovieId);
			s.setScrenn_no(screnn_no);
			s.setShow_Type(show_Type);
			s.setShowDate(showDate);
			s.setStartTime(startTime);
			s.setTheatreName_loc(theatreName_loc);
			
			flag=simpl.addShow(s);
			
			if(flag)
				System.out.println("Show added successfully");
			else
				System.out.println("Error while adding show details");
			break;
			
			case 2: slist=simpl.getAllShows();
			
			if(slist.isEmpty()|| slist==null) {
				System.out.println("No shows yet to display!!!");
			}
			
			else {
				
				System.out.println("------------------------Show List-----------------------");
				for(Show s1: slist) {
					System.out.println(s1);
					System.out.println("________________________________________________________________________________");
				}
			}
			break;
			
			case 3: 
					System.out.println("Enter show id:-");
					showId=sc.nextInt();
					sc.nextLine();
					
					s=simpl.getShowById(showId);
					System.out.println(s);
					
					System.out.println("Do you want to continue?Enter y for yes and n for no");
					option=sc.next().charAt(0);
					sc.nextLine();
					
					if(option=='y') {
						
						System.out.println("Enter movie id:-");
						show_MovieId=sc.nextInt();
						sc.nextLine();
						
						System.out.println("Enter theatre name and location");
						theatreName_loc=sc.nextLine();
						
						System.out.println("Enter show type:-");
						show_Type=sc.nextLine();
						
						System.out.println("Enter year of show:-");
						year=sc.nextInt();
						sc.nextLine();
						
						System.out.println("Enter month of show:- Number between 1 to 12");
						month=sc.nextInt();
						sc.nextLine();
						
						System.out.println("Enter day of show:-Number between 1 to 31");
						dayOfMonth=sc.nextInt();
						sc.nextLine();
						
						showDate=LocalDate.of(year, month, dayOfMonth);
						
						System.out.println("Enter start hour:- Number between 0 to 23");
						hour=sc.nextInt();
						sc.nextLine();
						
						System.out.println("Enter start minute:- Number between 0 to 59");
						minute=sc.nextInt();
						sc.nextLine();
						
						startTime=LocalTime.of(hour, minute);
						
						System.out.println("Enter end hour:- Number between 0 to 23");
						hour=sc.nextInt();
						sc.nextLine();
						
						System.out.println("Enter end minute:- Number between 0 to 59");
						minute=sc.nextInt();
						sc.nextLine();
						
						endTime=LocalTime.of(hour, minute);
						
						System.out.println("Enter price:-");
						price=sc.nextDouble();
						sc.nextLine();
						
						s.setEndTime(endTime);
						s.setPrice(price);
						s.setShow_MovieId(show_MovieId);
						s.setShow_Type(show_Type);
						s.setShowDate(showDate);
						s.setStartTime(startTime);
						s.setTheatreName_loc(theatreName_loc);
						
						flag=simpl.updateShow(s);
						
						if(flag)
							System.out.println("Show updated");
						else
							System.out.println("Error while updating show details");
					}
					else if(option=='n') {
						
						System.out.println("Thank you");
					}
					else {
						
						System.out.println("Please enter y for yes or n for no");
					}
					
				break;
				
			case 4:
				
				System.out.println("Enter show id");
				showId=sc.nextInt();
				sc.nextLine();
				
				s=simpl.getShowById(showId);
				System.out.println(s);
				
				System.out.println("Do you want to continue?Enter y for yes and n for no");
				option=sc.next().charAt(0);
				sc.nextLine();
				
				if(option=='y') {
					
					flag=simpl.deleteShow(showId);
					
					if(flag)
						System.out.println("Show deleted");
					else
						System.out.println("Error while deleting show details");
				}
				else if(option=='n') {
					
					System.out.println("Thank you");
				}
				else {
					
					System.out.println("Please enter y for yes or n for no");
				}
				
			break;
			}
			
		}while(exit==false);
sc.close();
	}

}
