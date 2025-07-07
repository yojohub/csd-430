<%@ page import="dao.MovieDAO, model.Movie" %>
<%
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String title = request.getParameter("title");
        String genre = request.getParameter("genre");
        String director = request.getParameter("director");
        int year = Integer.parseInt(request.getParameter("year"));
        
        Movie m = new Movie(0, title, genre, director, year);
        MovieDAO.addMovie(m);
        out.println("<p>Movie added successfully!</p>");
    }
%>
<form method="post">
    Title: <input type="text" name="title" required><br>
    Genre: <input type="text" name="genre" required><br>
    Director: <input type="text" name="director" required><br>
    Year: <input type="number" name="year" required><br>
    <input type="submit" value="Add Movie">
</form>
