<!-- cellPhoneFeedback.jsp -->

<!--
  6/8/2025
  -- Important --
-->
<!--
  Yohannes Ayele
  Module 3 assignment

-->
<!DOCTYPE html>
<html>
<head>
    <title>Cell Phone Company Feedback Form</title>
</head>
<body>
    <h2>Customer Feedback Form</h2>

    <!-- Form that sends user input to displayFeedback.jsp via POST method -->
    <form action="displayFeedback.jsp" method="post">
        
        <!-- Text input for user's name -->
        <label for="name">Full Name:</label><br>
        <input type="text" id="name" name="name" required><br><br>

        <!-- Text input for user's phone model -->
        <label for="phoneModel">Phone Model:</label><br>
        <input type="text" id="phoneModel" name="phoneModel" required><br><br>

        <!-- Radio buttons for rating overall satisfaction -->
        <label>Overall Satisfaction:</label><br>
        <input type="radio" name="satisfaction" value="Very Satisfied" required> Very Satisfied<br>
        <input type="radio" name="satisfaction" value="Satisfied"> Satisfied<br>
        <input type="radio" name="satisfaction" value="Dissatisfied"> Dissatisfied<br><br>

        <!-- Dropdown (select box) for issue category -->
        <label for="issue">Primary Issue You Faced:</label><br>
        <select id="issue" name="issue" required>
            <option value="Billing">Billing</option>
            <option value="Network Coverage">Network Coverage</option>
            <option value="Customer Service">Customer Service</option>
            <option value="Device Issue">Device Issue</option>
            <option value="Other">Other</option>
        </select><br><br>

        <!-- Text area for additional comments -->
        <label for="comments">Additional Comments:</label><br>
        <textarea id="comments" name="comments" rows="4" cols="40"></textarea><br><br>

        <!-- Submit button -->
        <input type="submit" value="Submit Feedback">
    </form>
</body>
</html>
