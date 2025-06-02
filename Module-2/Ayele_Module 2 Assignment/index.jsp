<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<!--
  6/1/2025
  -- Important --
-->
<!--
  Yohannes Ayele
  Module 2 assignment

-->


<%
    // Define a class to represent character info
    class Character {
        String name;
        String role;
        String quote;

        Character(String name, String role, String quote) {
            this.name = name;
            this.role = role;
            this.quote = quote;
        }
    }

    // Create a list of key characters
    List<Character> characters = new ArrayList<>();
    characters.add(new Character("Harry Potter", "The Boy Who Lived", "I don’t go looking for trouble. Trouble usually finds me."));
    characters.add(new Character("Hermione Granger", "Brightest witch of her age", "It’s leviosa, not leviosar!"));
    characters.add(new Character("Ron Weasley", "Harry’s loyal friend", "Why spiders? Why couldn't it be 'follow the butterflies'?"));
    characters.add(new Character("Albus Dumbledore", "Headmaster of Hogwarts", "It does not do to dwell on dreams and forget to live."));
    characters.add(new Character("Severus Snape", "Potions Master", "Always."));
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Harry Potter Character Table</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <div class="wrapper">
        <h1>Characters from <em>Harry Potter and the Sorcerer’s Stone</em></h1>
        <p class="description">
            Below is a table showing five memorable characters from the first Harry Potter book. 
            Each entry includes the character’s name, their role in the story, and a quote that represents them.
        </p>

        <table>
            <thead>
                <tr>
                    <th>Character</th>
                    <th>Role</th>
                    <th>Memorable Quote</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (Character c : characters) {
                %>
                <tr>
                    <td><%= c.name %></td>
                    <td><%= c.role %></td>
                    <td>"<%= c.quote %>"</td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</body>
</html>
