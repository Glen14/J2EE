<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Sample JSP with JSTL and Java Expressions</title>
</head>
<body>

<p>Step 1:</p>
<%! int p = 500; %> 
<%= p %> <!-- This will print the value of 'p', which is 500 -->

<p>Step 2:</p>
<c:set var="q" value="600" />
<c:out value="${q}" /> <!-- This will print the value of 'q', which is 600 -->
<c:out value="${p}" /> <!-- This may not print anything since 'p' is a Java variable -->

<p>Step 3:</p>
<p>${p} ${q}</p> <!-- This may not print anything for 'p' and should print 600 for 'q' -->

</body>
</html>
