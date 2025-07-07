// MovieBean.java
// Package declaration to organize the code

// Yohannes Ayele

// Date: 6/22/25


package model;

// Import necessary SQL classes
import java.sql.*;

// MovieBean class used to interact with the database
public class MovieBean {
    // Database connection details
    private String dbUrl = "jdbc:mysql://localhost:3306/CSD430"; // Database URL
    private String dbUser = "student1"; // Database username
    private String dbPass = "pass";     // Database password
    private Connection conn;            // Connection object

    // Constructor - Establishes a connection when the object is created
    public MovieBean() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver"); // Load MySQL JDBC driver
        conn = DriverManager.getConnection(dbUrl, dbUser, dbPass); // Connect to DB
    }

    // Method to get all movie IDs from the database for dropdown population
    public ResultSet getAllMovieIDs() throws Exception {
        String query = "SELECT movie_id FROM yohannes_movies_data"; // SQL query
        Statement stmt = conn.createStatement(); // Create statement object
        return stmt.executeQuery(query); // Execute query and return results
    }

    // Method to get a movie record by its ID
    public ResultSet getMovieByID(int id) throws Exception {
        String query = "SELECT * FROM yohannes_movies_data WHERE movie_id=?"; // Parameterized query
        PreparedStatement ps = conn.prepareStatement(query); // PreparedStatement for security
        ps.setInt(1, id); // Set the movie ID
        return ps.executeQuery(); // Execute and return the result
    }

    // Method to close the connection
    public void close() throws Exception {
        if (conn != null) conn.close(); // Close DB connection if it exists
    }
}
