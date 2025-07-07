<%@ page import="dao.MovieDAO" %>
<%
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        int id = Integer.parseInt(request.getParameter("id"));
        MovieDAO.deleteMovie(id);
        out.println("<p>Movie deleted!</p>");
    }
%>
<form method="post">
    Movie ID to delete: <input type="number" name="id" required><br>
    <input type="submit" value="Delete Movie">
</form>
