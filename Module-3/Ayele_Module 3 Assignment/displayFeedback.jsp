<!-- displayFeedback.jsp -->

<!--
  6/8/2025
  -- Important --
-->
<!--
  Yohannes Ayele
  Module 3 assignment

-->

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Submitted Feedback</title>
</head>
<body>
    <h2>Thank You for Your Feedback!</h2>

    <!-- JSP expressions to retrieve and display form data using request.getParameter() -->
    <p><strong>Name:</strong> <%= request.getParameter("name") %></p>
    <p><strong>Phone Model:</strong> <%= request.getParameter("phoneModel") %></p>
    <p><strong>Overall Satisfaction:</strong> <%= request.getParameter("satisfaction") %></p>
    <p><strong>Issue Category:</strong> <%= request.getParameter("issue") %></p>
    <p><strong>Additional Comments:</strong> <%= request.getParameter("comments") %></p>
</body>
</html>
