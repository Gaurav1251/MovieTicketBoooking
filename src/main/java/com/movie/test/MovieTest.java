package com.movie.test;

import java.time.LocalDate;
import java.util.List;
import java.util.Scanner;

import com.movie.dao.MovieDaoImpl;
import com.movie.pojo.Movie;

public class MovieTest {

	public static void main(String[] args) {
		Scanner sc=new Scanner(System.in);
		Movie m;
		MovieDaoImpl mimpl=new MovieDaoImpl();
		List<Movie> al=null;
		
		System.out.println("-------------------Welcome to Movie Unit Testing--------------------");
		boolean exit=false;
		int movieId;
		String movieName;
		String director;
		String producer;
		String writer;
		String cast;
		LocalDate releaseDate;
		boolean flag;
		int year;
		int month;
		int dayOfMonth;
		
		do {
			
			System.out.println("Please select one of the below and enter the number according to your selection");
			System.out.println("1----> Add Movie Details");
			System.out.println("2----> Show all movies");
			System.out.println("3----> Update movie");
			System.out.println("4----> Delete movie");
			System.out.println("5----> Show movie by name");
			System.out.println("6----> Exit");
			
			int choice=sc.nextInt();
			sc.nextLine();
			
			switch(choice) {
			
			case 1: System.out.println("Enter movie name:-");
					movieName=sc.nextLine();
					
					System.out.println("Enter director:-");
					director=sc.nextLine();
					
					System.out.println("Enter producer:- ");
					producer=sc.nextLine();
					
					System.out.println("Enter Writer");
					writer=sc.nextLine();
					
					System.out.println("Enter cast:-");
					cast=sc.nextLine();
					
					System.out.println("Enter year of release:-");
					year=sc.nextInt();
					sc.nextLine();
					
					System.out.println("Enter month of release:- Number between 1 to 12");
					month=sc.nextInt();
					sc.nextLine();
					
					System.out.println("Enter day of month:-Number between 1 to 31");
					dayOfMonth=sc.nextInt();
					sc.nextLine();
					
					releaseDate=LocalDate.of(year, month, dayOfMonth);
					
					m=new Movie();
					m.setCast(cast);
					m.setDirector(director);
					m.setMovieName(movieName);
					m.setProducer(producer);
					m.setReleaseDate(releaseDate);
					m.setWriter(writer);
					
					flag=mimpl.addMovie(m);
					
					if(flag)
						System.out.println("Movie details added successfully!!!");
					else
						System.out.println("Error while adding details");
					
			break;
			
			case 2: System.out.println("-----------------Movie List---------------------------");
						al=mimpl.getAllMovies();
						
						if(al.isEmpty()||al==null)
							System.out.println("No movies have been added yet...");
						else {
							
							for(Movie m1:al) {
								
								if(m1!=null) {
									System.out.println(m1);
									System.out.println("*******************************************");
								}
							}
						}
							
				break;
				
			case 3:
				System.out.println("Enter Id of Movie to be updated...");
				movieId=sc.nextInt();
				sc.nextLine();
				
				m=mimpl.getMovieById(movieId);
				
				if(m==null)
					System.out.println("No movies with this id found! Please try again.");
				else {
					
					System.out.println("-------Movie------");
					System.out.println(m);
					
					System.out.println("\nDo you want to continue updating?Enter y for yes and n for no");
					char option=sc.next().charAt(0);
					sc.nextLine();
					
					if(option=='y') {
						
						System.out.println("Enter movie name:-");
						movieName=sc.nextLine();
						
						System.out.println("Enter director:-");
						director=sc.nextLine();
						
						System.out.println("Enter producer:- ");
						producer=sc.nextLine();
						
						System.out.println("Enter Writer");
						writer=sc.nextLine();
						
						System.out.println("Enter cast:-");
						cast=sc.nextLine();
						
						System.out.println("Enter year of release:-");
						year=sc.nextInt();
						sc.nextLine();
						
						System.out.println("Enter month of release:- Number between 1 to 12");
						month=sc.nextInt();
						sc.nextLine();
						
						System.out.println("Enter day of month:-Number between 1 to 31");
						dayOfMonth=sc.nextInt();
						sc.nextLine();
						
						releaseDate=LocalDate.of(year, month, dayOfMonth);
						
						m.setCast(cast);
						m.setDirector(director);
						m.setMovieName(movieName);
						m.setProducer(producer);
						m.setReleaseDate(releaseDate);
						m.setWriter(writer);
						
						flag=mimpl.updateMovie(m);
						
						if(flag)
							System.out.println("Movie updated successfully!!!");
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
				System.out.println("Enter Id of Movie to be deleted...");
				movieId=sc.nextInt();
				sc.nextLine();
				
				m=mimpl.getMovieById(movieId);
				
				if(m==null)
					System.out.println("No movies with this id found! Please try again.");
				else {
					
					System.out.println("-------Movie------");
					System.out.println(m);
					
					System.out.println("\nAre you sure you want to delete?Enter y for yes and n for no");
					char option=sc.next().charAt(0);
					sc.nextLine();
					
					if(option=='y') {
						
						flag=mimpl.deleteMovie(movieId);
						
						if(flag)
							System.out.println("Movie deleted successfully!!!");
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
				System.out.println("Enter name of movie to be searched...");
				movieName=sc.nextLine();
				
				al=mimpl.getMovieByName(movieName);
				
				if(al.isEmpty()||al==null)
					System.out.println("No movies with this name found");
				else {
					System.out.println("------------Movie List---------------");
					for(Movie m1:al) {
						
						if(m1!=null) {
							System.out.println(m1);
							System.out.println("*******************************************");
						}
					}
				}
				break;
				
			case 6: exit=true;
			System.out.println("-----------------Thank you-------------------");
			break;
			
			
			default: System.out.println("Please enter number between 1 to 6 according to the options in menu.");
			}
			try {
				Thread.sleep(3000);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}while(exit==false);

		sc.close();
	}

}
