<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSTL fmt:formatNumber Tag</title>
</head>
<body>

<h3>Number Format Example:</h3>

<!-- Setting a numeric value to the variable 'balance' -->
<c:set var="balance" value="120000.2309" />

<!-- Using fmt:formatNumber to format the balance as currency -->
<p>Formatted Number as Currency: <fmt:formatNumber value="${balance}" type="currency"/></p>

<!-- Additional formatting examples -->
<p>Formatted as Number: <fmt:formatNumber value="${balance}" /></p>
<p>Formatted with 2 Decimal Places: <fmt:formatNumber value="${balance}" minFractionDigits="2" maxFractionDigits="2"/></p>

</body>
</html>
