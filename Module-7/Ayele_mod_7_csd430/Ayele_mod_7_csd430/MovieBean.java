package model;

import java.io.Serializable;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

// JavaBean class to interact with MySQL for movie data
public class MovieBean implements Serializable {
    private static final long serialVersionUID = 1L;
    private Connection conn;

    // Movie class for holding data records
    public static class Movie {
        public int id;
        public String title;
        public String genre;
        public int year;
        public String director;

        public Movie(int id, String title, String genre, int year, String director) {
            this.id = id;
            this.title = title;
            this.genre = genre;
            this.year = year;
            this.director = director;
        }
    }

    // Constructor: connect to DB
    public MovieBean() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/CSD430", "student1", "pass");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Method to insert a movie record
    public void insertMovie(String title, String genre, int year, String director) {
        String sql = "INSERT INTO yohannes_movies_data (title, genre, year, director) VALUES (?, ?, ?, ?)";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, title);
            ps.setString(2, genre);
            ps.setInt(3, year);
            ps.setString(4, director);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Method to return all movies
    public List<Movie> getAllMovies() {
        List<Movie> movieList = new ArrayList<>();
        String sql = "SELECT * FROM yohannes_movies_data";
        try (Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                Movie m = new Movie(
                    rs.getInt("movie_id"),
                    rs.getString("title"),
                    rs.getString("genre"),
                    rs.getInt("year"),
                    rs.getString("director")
                );
                movieList.add(m);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return movieList;
    }

    // Close DB connection
    public void close() {
        try {
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
