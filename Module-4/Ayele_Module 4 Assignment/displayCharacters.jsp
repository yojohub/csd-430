<%@ page import="java.util.*, beans.CharacterBean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Harry Potter Character Table</title>
    <style>
        body { font-family: Arial, sans-serif; padding: 20px; }
        h1 { color: darkblue; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { padding: 10px; border: 1px solid #999; text-align: left; }
        th { background-color: #f2f2f2; }
    </style>
</head>
<body>
    <h1>Characters from <em>Harry Potter and the Sorcerer's Stone</em></h1>
    <p>
        Below is a table showing five memorable characters from the first Harry Potter book. 
        Each entry includes the character's name, their role in the story, and a quote that represents them.
    </p>

    <%
        List<CharacterBean> characters = new ArrayList<>();
        characters.add(new CharacterBean("Harry Potter", "The Boy Who Lived", "I don't go looking for trouble. Trouble usually finds me."));
        characters.add(new CharacterBean("Hermione Granger", "Brightest witch of her age", "It's leviosa, not leviosar!"));
        characters.add(new CharacterBean("Ron Weasley", "Harry's loyal friend", "Why spiders? Why couldn't it be 'follow the butterflies'?"));
        characters.add(new CharacterBean("Albus Dumbledore", "Headmaster of Hogwarts", "It does not do to dwell on dreams and forget to live."));
        characters.add(new CharacterBean("Severus Snape", "Potions Master", "Always."));
    %>

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
                for (CharacterBean c : characters) {
            %>
            <tr>
                <td><%= c.getName() %></td>
                <td><%= c.getRole() %></td>
                <td>"<%= c.getQuote() %>"</td>
            </tr>
            <% } %>
        </tbody>
    </table>
</body>
</html>
