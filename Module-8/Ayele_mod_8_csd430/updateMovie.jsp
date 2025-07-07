<%@ page import="MovieBean, java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int movieId = Integer.parseInt(request.getParameter("movie_id"));
    MovieBean bean = new MovieBean();
    ResultSet rs = bean.getMovieByID(movieId);

    if (request.getMethod().equals("POST") && request.getParameter("updated") != null) {
        String title = request.getParameter("title");
        String genre = request.getParameter("genre");
        int releaseYear = Integer.parseInt(request.getParameter("release_year"));
        double rating = Double.parseDouble(request.getParameter("rating"));
        String director = request.getParameter("director");

        bean.updateMovie(movieId, title, genre, releaseYear, rating, director);
        rs = bean.getMovieByID(movieId);
%>
    <p>Movie updated successfully!</p>
<% } %>

<h2>Update Movie Details</h2>
<%
    if (rs.next()) {
%>
<form method="post">
    Movie ID: <strong><%= rs.getInt("movie_id") %></strong><br/>
    <input type="hidden" name="movie_id" value="<%= rs.getInt("movie_id") %>">
    <input type="hidden" name="updated" value="true">
    Title: <input type="text" name="title" value="<%= rs.getString("title") %>"><br/>
    Genre: <input type="text" name="genre" value="<%= rs.getString("genre") %>"><br/>
    Release Year: <input type="number" name="release_year" value="<%= rs.getInt("release_year") %>"><br/>
    Rating: <input type="number" step="0.1" name="rating" value="<%= rs.getDouble("rating") %>"><br/>
    Director: <input type="text" name="director" value="<%= rs.getString("director") %>"><br/>
    <input type="submit" value="Update">
</form>
<% } bean.close(); %>
</body>
</html>
