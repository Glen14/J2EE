<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Product</title>
</head>
<body>

<h2>Add Product</h2>
<form method="post">
    <label>Product No:</label>
    <input type="text" name="product_no"><br>

    <label>Product Name:</label>
    <input type="text" name="product_name"><br>

    <label>Product Type:</label>
    <input type="radio" name="product_type" value="Home Appliance">Home Appliance
    <input type="radio" name="product_type" value="Computer Hardware">Computer Hardware
    <input type="radio" name="product_type" value="Game Console">Game Console
    <input type="radio" name="product_type" value="Clothing">Clothing<br>

    <label>Manufacturer:</label>
    <select name="manufacturer">
        <option value="LG">LG</option>
        <option value="Samsung">Samsung</option>
        <option value="Sony">Sony</option>
        <option value="Apple">Apple</option>
    </select><br>

    <label>Price:</label>
    <input type="text" name="price"><br>

    <label>Weight:</label>
    <input type="text" name="weight"><br>

    <input type="submit" name="addProduct" value="Add Product">
</form>

<% 
if (request.getParameter("addProduct") != null) {
    String productNo = request.getParameter("product_no");
    String productName = request.getParameter("product_name");
    String productType = request.getParameter("product_type");
    String manufacturer = request.getParameter("manufacturer");
    String price = request.getParameter("price");
    String weight = request.getParameter("weight");

    out.println("<p>Product No is " + productNo + "</p>");
    out.println("<p>Product Name is " + productName + "</p>");
    out.println("<p>Product Type is " + productType + "</p>");
    out.println("<p>Manufacturer is " + manufacturer + "</p>");
    out.println("<p>Price is " + price + "</p>");
    out.println("<p>Weight is " + weight + "</p>");
}
%>

</body>
</html>
