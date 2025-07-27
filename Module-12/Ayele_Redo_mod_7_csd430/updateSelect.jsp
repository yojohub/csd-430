<%@ page import="model.MovieBean, java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Select Movie to Update</title>
</head>
<body>

<h2>Select Movie to Update</h2>

<form action="updateMovie.jsp" method="post">
    <label for="movie_id">Select Movie ID:</label>
    <select name="movie_id" id="movie_id">
        <%
            MovieBean bean = new MovieBean();
            ResultSet rs = bean.getAllMovieIDs();

            while (rs.next()) {
                int id = rs.getInt("movie_id");
        %>
                <option value="<%= id %>"><%= id %></option>
        <%
            }

            rs.close();   // Close ResultSet
            bean.close(); // Close connection
        %>
    </select>

    <input type="submit" value="Edit Movie">
</form>

</body>
</html>
