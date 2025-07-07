<%@ page import="model.MovieBean" %>
<%@ page import="java.util.*" %>
<%@ page import="model.MovieBean.Movie" %>

<html>
<head>
    <title>All Movies</title>
</head>
<body>
    <h2>All Movies in the Database</h2>
    <%
        // Read input parameters
        String title = request.getParameter("title");
        String genre = request.getParameter("genre");
        int year = Integer.parseInt(request.getParameter("year"));
        String director = request.getParameter("director");

        // Use JavaBean to insert and get all movies
        MovieBean bean = new MovieBean();
        bean.insertMovie(title, genre, year, director);
        List<Movie> movieList = bean.getAllMovies();
    %>

    <table border="1">
        <thead>
            <tr>
                <th>ID</th>
                <th>Title</th>
                <th>Genre</th>
                <th>Year</th>
                <th>Director</th>
            </tr>
        </thead>
        <tbody>
        <%
            for (Movie m : movieList) {
        %>
            <tr>
                <td><%= m.id %></td>
                <td><%= m.title %></td>
                <td><%= m.genre %></td>
                <td><%= m.year %></td>
                <td><%= m.director %></td>
            </tr>
        <%
            }
            bean.close();
        %>
        </tbody>
    </table>
</body>
</html>
