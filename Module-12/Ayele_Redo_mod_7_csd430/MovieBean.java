package model;

import java.sql.*;

public class MovieBean {
    private String dbUrl = "jdbc:mysql://localhost:3306/CSD430";
    private String dbUser = "student1";
    private String dbPass = "pass";
    private Connection conn;

    public MovieBean() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(dbUrl, dbUser, dbPass);
    }

    // Insert a new movie
    public void insertMovie(String title, String genre, int releaseYear, double rating, String director) throws Exception {
        String sql = "INSERT INTO yohannes_movies_data (title, genre, release_year, rating, director) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, title);
            stmt.setString(2, genre);
            stmt.setInt(3, releaseYear);
            stmt.setDouble(4, rating);
            stmt.setString(5, director);
            stmt.executeUpdate();
        }
    }

    // Generate dropdown form for deleting movies
    public String formGetPK(String actionURL) throws Exception {
        StringBuilder sb = new StringBuilder();
        String sql = "SELECT movie_id FROM yohannes_movies_data";

        try (PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            sb.append("<form method='post' action='").append(actionURL).append("'>");
            sb.append("<label for='movie_id'>Select Movie ID to Delete:</label>");
            sb.append("<select name='movie_id'>");

            while (rs.next()) {
                String id = rs.getString("movie_id");
                sb.append("<option value='").append(id).append("'>").append(id).append("</option>");
            }

            sb.append("</select>");
            sb.append("<input type='submit' value='Delete' />");
            sb.append("</form>");
        }

        return sb.toString();
    }

    // Delete a movie
    public String delete(int id) throws Exception {
        String sql = "DELETE FROM yohannes_movies_data WHERE movie_id = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            int result = stmt.executeUpdate();
            if (result > 0) {
                return "Record with ID " + id + " deleted successfully.";
            } else {
                return "No record found with ID " + id + ".";
            }
        }
    }

    // Display all movies as HTML table
    public String readAll() throws Exception {
        StringBuilder sb = new StringBuilder();
        String sql = "SELECT * FROM yohannes_movies_data";

        try (PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            sb.append("<table border='1' cellpadding='8' cellspacing='0'>");
            sb.append("<thead><tr>")
              .append("<th>ID</th><th>Title</th><th>Genre</th><th>Year</th><th>Rating</th><th>Director</th>")
              .append("</tr></thead>");
            sb.append("<tbody>");

            while (rs.next()) {
                sb.append("<tr>")
                  .append("<td>").append(rs.getInt("movie_id")).append("</td>")
                  .append("<td>").append(rs.getString("title")).append("</td>")
                  .append("<td>").append(rs.getString("genre")).append("</td>")
                  .append("<td>").append(rs.getInt("release_year")).append("</td>")
                  .append("<td>").append(rs.getString("rating")).append("</td>")
                  .append("<td>").append(rs.getString("director")).append("</td>")
                  .append("</tr>");
            }

            sb.append("</tbody></table>");
        }

        return sb.toString();
    }

    // Retrieve a single movie by ID (ResultSet must be closed in JSP)
    public ResultSet getMovieByID(int id) throws Exception {
        String sql = "SELECT * FROM yohannes_movies_data WHERE movie_id = ?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setInt(1, id);
        return stmt.executeQuery();
    }

    // Update a movie record
    public void updateMovie(int id, String title, String genre, int releaseYear, double rating, String director) throws Exception {
        String sql = "UPDATE yohannes_movies_data SET title=?, genre=?, release_year=?, rating=?, director=? WHERE movie_id=?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, title);
            stmt.setString(2, genre);
            stmt.setInt(3, releaseYear);
            stmt.setDouble(4, rating);
            stmt.setString(5, director);
            stmt.setInt(6, id);
            stmt.executeUpdate();
        }
    }

    // Get all movie IDs (ResultSet must be closed in JSP)
    public ResultSet getAllMovieIDs() throws Exception {
        String sql = "SELECT movie_id FROM yohannes_movies_data";
        PreparedStatement stmt = conn.prepareStatement(sql);
        return stmt.executeQuery();
    }

    // Close database connection
    public void close() throws Exception {
        if (conn != null && !conn.isClosed()) {
            conn.close();
        }
    }
}
