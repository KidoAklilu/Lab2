<%@ page import="java.time.LocalTime" %>
<%
    String greeting = (LocalTime.now().isBefore(LocalTime.NOON)) ? "Good morning" : "Good afternoon";
%>
<html>
<body>
    <h1><%= greeting %>, Kidist Aklilu, Welcome to COMP367</h1>
</body>
</html>
