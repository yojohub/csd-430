<%@ page import="MovieBean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head><title>Add Movie</title></head>
<body>
<%
    if (request.getMethod().equals("POST")) {
        String title = request.getParameter("title");
        String genre = request.getParameter("genre");
        int releaseYear = Integer.parseInt(request.getParameter("release_year"));
        double rating = Double.parseDouble(request.getParameter("rating"));
        String director = request.getParameter("director");

        MovieBean bean = new MovieBean();
        bean.insertMovie(title, genre, releaseYear, rating, director);
        bean.close();
        out.println("<p>Movie added successfully!</p>");
    }
%>

<h2>Add New Movie</h2>
<form method="post">
    Title: <input type="text" name="title" required><br/>
    Genre: <input type="text" name="genre" required><br/>
    Release Year: <input type="number" name="release_year" required><br/>
    Rating: <input type="number" step="0.1" name="rating" required><br/>
    Director: <input type="text" name="director" required><br/>
    <input type="submit" value="Add Movie">
</form>
</body>
</html>
