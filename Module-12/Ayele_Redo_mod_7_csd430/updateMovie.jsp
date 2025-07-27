<%@ page import="model.MovieBean, java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head><title>Update Movie</title></head>
<body>

<%
    String message = "";
    int movieId = Integer.parseInt(request.getParameter("movie_id"));
    MovieBean bean = new MovieBean();

    if ("POST".equalsIgnoreCase(request.getMethod()) && request.getParameter("updated") != null) {
        String title = request.getParameter("title");
        String genre = request.getParameter("genre");
        int releaseYear = Integer.parseInt(request.getParameter("release_year"));
        double rating = Double.parseDouble(request.getParameter("rating"));
        String director = request.getParameter("director");

        try {
            bean.updateMovie(movieId, title, genre, releaseYear, rating, director);
            message = "<p style='color:green;'>Movie updated successfully!</p>";
        } catch (Exception e) {
            message = "<p style='color:red;'>Error updating movie: " + e.getMessage() + "</p>";
        }
    }

    ResultSet rs = bean.getMovieByID(movieId);
%>

<h2>Update Movie Details</h2>

<%= message %>

<%
    if (rs.next()) {
%>
<form method="post">
    <input type="hidden" name="movie_id" value="<%= movieId %>">
    <input type="hidden" name="updated" value="true">

    Title: <input type="text" name="title" value="<%= rs.getString("title") %>" required><br/>
    Genre: <input type="text" name="genre" value="<%= rs.getString("genre") %>" required><br/>
    Release Year: <input type="number" name="release_year" value="<%= rs.getInt("release_year") %>" required><br/>
    Rating: <input type="number" step="0.1" name="rating" value="<%= rs.getDouble("rating") %>" required><br/>
    Director: <input type="text" name="director" value="<%= rs.getString("director") %>" required><br/>

    <input type="submit" value="Update Movie">
</form>
<%
    } else {
%>
    <p style='color:red;'>Movie ID not found.</p>
<%
    }

    rs.close();
    bean.close();
%>

<p><a href="updateSelect.jsp">Back to Select Page</a></p>

</body>
</html>
