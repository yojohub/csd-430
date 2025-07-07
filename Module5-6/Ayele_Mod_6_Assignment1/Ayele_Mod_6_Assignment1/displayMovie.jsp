<%@ page import="model.MovieBean" %>  <%-- Import MovieBean class --%>
<%@ page import="java.sql.*" %>       <%-- Import JDBC classes --%>

<html>
<head>
    <title>Movie Details</title>
</head>
<body>
    <%
        // Get the selected movie ID from the request
        int id = Integer.parseInt(request.getParameter("movieID"));

        // Create a new MovieBean and fetch movie details
        MovieBean bean = new MovieBean();
        ResultSet rs = bean.getMovieByID(id);  // Get record by ID

        if (rs.next()) { // If movie record exists
    %>
        <h2>Movie Information</h2>

        <%-- Create a table to display movie information --%>
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
                <tr>
                    <td><%= rs.getInt("movie_id") %></td>
                    <td><%= rs.getString("title") %></td>
                    <td><%= rs.getString("genre") %></td>
                    <td><%= rs.getInt("year") %></td>
                    <td><%= rs.getString("director") %></td>
                </tr>
            </tbody>
        </table>
    <%
        } else {
            // Display message if no record is found
    %>
        <p>No record found for ID: <%= id %></p>
    <%
        }
        bean.close();  // Always close the connection
    %>
</body>
</html>
