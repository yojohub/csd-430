<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>DeleteMovie</title>
</head>
<body>

  <h1>DeleteMovie</h1>

  <jsp:useBean id="myDB" class="model.MovieBean" />

  <br /> <a href="index.jsp">index.jsp</a> <br />
  
  <%
    if (request.getMethod().equals("GET")) {
        String value = myDB.formGetPK("deleteMovie.jsp");
        out.print(value);
        out.print("<br />" + myDB.readAll());
    }
  %>

  <%
    if (request.getMethod().equals("POST")) {
        String idStr = request.getParameter("movie_id");
        try {
            int id = Integer.parseInt(idStr);
            out.println(myDB.delete(id));
        } catch (Exception e) {
            out.println("Invalid ID: " + idStr);
        }

        out.println("<br />");
        out.print(myDB.formGetPK("deleteMovie.jsp"));
        out.print("<br />");
        out.print(myDB.readAll());
    }
  %>

</body>
</html>
