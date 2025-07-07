<%@ page import="model.MovieBean" %>  <%-- Import MovieBean class --%>
<%@ page import="java.sql.*" %>       <%-- Import JDBC classes --%>

<html>
<head>
    <title>Select Movie</title>
</head>
<body>
    <h2>Select a Movie ID</h2>

    <%-- Start form to submit selected movie ID to displayMovie.jsp --%>
    <form method="post" action="displayMovie.jsp">
        <select name="movieID">  <%-- Dropdown menu to hold movie IDs --%>
            <%
                MovieBean bean = new MovieBean();           // Create MovieBean object
                ResultSet rs = bean.getAllMovieIDs();       // Get all movie IDs
                while (rs.next()) {                         // Loop through result set
                    int id = rs.getInt("movie_id");         // Get movie_id from current row
            %>
                    <option value="<%=id%>"><%=id%></option> <%-- Add option to dropdown --%>
            <%
                }
                bean.close();  // Close connection
            %>
        </select>
        <input type="submit" value="View Movie Details"/> <%-- Submit button --%>
    </form>
</body>
</html>
