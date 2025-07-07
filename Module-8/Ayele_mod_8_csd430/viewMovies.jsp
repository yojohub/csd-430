<%@ page import="MovieBean, java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head><title>All Movies</title></head>
<body>
<h2>Movie List</h2>
<table border="1">
    <thead>
        <tr>
            <th>ID</th><th>Title</th><th>Genre</th><th>Year</th><th>Rating</th><th>Director</th>
        </tr>
    </thead>
    <tbody>
        <%
            MovieBean bean = new MovieBean();
            ResultSet rs = bean.getAllMovies();
            while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("movie_id") %></td>
            <td><%= rs.getString("title") %></td>
            <td><%= rs.getString("genre") %></td>
            <td><%= rs.getInt("release_year") %></td>
            <td><%= rs.getDouble("rating") %></td>
            <td><%= rs.getString("director") %></td>
        </tr>
        <% } bean.close(); %>
    </tbody>
</table>
</body>
</html>
