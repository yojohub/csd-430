<%@ page import="dao.MovieDAO, java.util.List, model.Movie" %>
<%
    List<Movie> movies = MovieDAO.getAllMovies();
%>
<h2>All Movies</h2>
<table border="1">
    <tr><th>ID</th><th>Title</th><th>Genre</th><th>Director</th><th>Year</th></tr>
<%
    for (Movie m : movies) {
%>
    <tr>
        <td><%= m.getId() %></td>
        <td><%= m.getTitle() %></td>
        <td><%= m.getGenre() %></td>
        <td><%= m.getDirector() %></td>
        <td><%= m.getYear() %></td>
    </tr>
<% } %>
</table>
