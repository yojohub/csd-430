/**
 * 
 */
/**
 * 
 */
package model;


import java.sql.*;
import java.util.*;

public class MovieBean {
    private String dbUrl = "jdbc:mysql://localhost:3306/CSD430";
    private String dbUser = "student1";
    private String dbPass = "pass";
    private Connection conn;

    public MovieBean() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(dbUrl, dbUser, dbPass);
    }

    public String formGetPK(String actionURL) throws Exception {
        StringBuilder sb = new StringBuilder();
        String sql = "SELECT movie_id FROM yohannes_movies_data";
        PreparedStatement stmt = conn.prepareStatement(sql);
        ResultSet rs = stmt.executeQuery();

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

        return sb.toString();
    }

    public String delete(int id) throws Exception {
        String sql = "DELETE FROM yohannes_movies_data WHERE movie_id = ?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setInt(1, id);
        int result = stmt.executeUpdate();
        if (result > 0) {
            return "Record with ID " + id + " deleted successfully.";
        } else {
            return "No record found with ID " + id + ".";
        }
    }

    public String readAll() throws Exception {
        StringBuilder sb = new StringBuilder();
        String sql = "SELECT * FROM yohannes_movies_data";
        PreparedStatement stmt = conn.prepareStatement(sql);
        ResultSet rs = stmt.executeQuery();

        sb.append("<table border='1'>");
        sb.append("<thead><tr><th>ID</th><th>Title</th><th>Genre</th><th>Year</th><th>Rating</th><th>Director</th></tr></thead>");
        sb.append("<tbody>");
        while (rs.next()) {
            sb.append("<tr>");
            sb.append("<td>").append(rs.getInt("movie_id")).append("</td>");
            sb.append("<td>").append(rs.getString("title")).append("</td>");
            sb.append("<td>").append(rs.getString("genre")).append("</td>");
            sb.append("<td>").append(rs.getInt("release_year")).append("</td>");
            sb.append("<td>").append(rs.getString("rating")).append("</td>");
            sb.append("<td>").append(rs.getString("director")).append("</td>");
            sb.append("</tr>");
        }
        sb.append("</tbody></table>");

        return sb.toString();
    }
}
