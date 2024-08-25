**Movie Ticket Booking System**
---

A web-based movie ticket booking system implemented using Java Servlets, JSP, HTML, CSS, JavaScript, and jQuery. This project allows users to browse available movies, select seats, and book tickets.
Features

    User Registration and Login: Users can create an account, log in, and manage their bookings.
    Movie Listings: Displays a list of available movies with details.
    Seat Selection: Allows users to choose seats for a movie.
    Booking Confirmation: Users receive a confirmation of their booking.
    Admin Panel: Admins can add, update, and remove movies and manage bookings.

**Prerequisites**

    Java Development Kit (JDK) 8 or higher
    Apache Tomcat 9 or higher
    Maven (for project management)
    A modern web browser

Getting Started

    Clone the Repository

    bash

git clone https://github.com/Gaurav1251/MovieTicketBoooking.git <br>
cd movieticketbooking

**Build the Project**

Navigate to the project directory and use Maven to build the project.

bash

    mvn clean install

    Deploy to Tomcat
        Copy the generated WAR file from the target directory to the Tomcat webapps directory.
        Start Tomcat server.

    Access the Application

    Open a web browser and go to http://localhost:8080/movieticketbooking.

Project Structure

    src/main/java: Java source files for Servlets and business logic.
    src/main/webapp: Web resources including JSP files, HTML, CSS, JavaScript, and images.
    src/main/resources: Configuration files and properties.

Configuration

    Database: Update the database connection settings in WEB-INF/classes/db.properties.
    Admin Credentials: Default admin credentials can be found in WEB-INF/classes/admin.properties.

Development

    JSP Files: Located in src/main/webapp/WEB-INF/jsp/.
    Servlets: Located in src/main/java/com/example/servlets/.
    CSS: Located in src/main/webapp/css/.
    JavaScript: Located in src/main/webapp/js/.

Testing

To test the application, you can use any browser to interact with the UI and ensure all features work as expected.
Troubleshooting

    Deployment Issues: Ensure Tomcat is properly configured and running.
    Database Connection: Check database connectivity and credentials.

Contributing

Feel free to open issues or submit pull requests if you have improvements or bug fixes.
License

This project is licensed under the MIT License.
