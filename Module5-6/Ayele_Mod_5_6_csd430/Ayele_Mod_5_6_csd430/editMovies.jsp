<%@ page import="dao.MovieDAO, model.Movie" %>
<%
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        int id = Integer.parseInt(request.getParameter("id"));
        String title = request.getParameter("title");
        String genre = request.getParameter("genre");
        String director = request.getParameter("director");
        int year = Integer.parseInt(request.getParameter("year"));
        
        Movie updated = new Movie(id, title, genre, director, year);
        MovieDAO.updateMovie(updated);
        out.println("<p>Movie updated!</p>");
    }
%>
<form method="post">
    ID to edit: <input type="number" name="id" required><br>
    Title: <input type="text" name="title" required><br>
    Genre: <input type="text" name="genre" required><br>
    Director: <input type="text" name="director" required><br>
    Year: <input type="number" name="year" required><br>
    <input type="submit" value="Update Movie">
</form>
