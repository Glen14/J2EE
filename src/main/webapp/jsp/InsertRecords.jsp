<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Insert Product</title>
</head>
<body>

<h2>Insert Product</h2>
<form method="post">
    <!-- Form elements similar to AddProductForm.jsp -->
    <!-- Form inputs for Product No, Product Name, Product Type, Manufacturer, Price, Weight -->
    <input type="submit" name="addProduct" value="Add Product">
</form>

<%
String dbURL = "jdbc:mysql://localhost:3306/as3_glen/products/";
String dbUser = "root";
String dbPass = "glen1234"; // Replace with your MySQL password

Connection conn = null;
PreparedStatement pstmt = null;

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

    if (request.getParameter("addProduct") != null) {
        String productNo = request.getParameter("product_no");
        String productName = request.getParameter("product_name");
        String productType = request.getParameter("product_type");
        String manufacturer = request.getParameter("manufacturer");
        String priceStr = request.getParameter("price");
        String weightStr = request.getParameter("weight");

        double price = Double.parseDouble(priceStr);
        if (price < 100 || price > 900) {
            out.println("<p style='color:red;'>Price must be between $100 and $900</p>");
        } else {
            double weight = Double.parseDouble(weightStr);

            String sql = "INSERT INTO products (product_no, product_name, product_type, manufacturer, price, weight) VALUES (?, ?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, productNo);
            pstmt.setString(2, productName);
            pstmt.setString(3, productType);
            pstmt.setString(4, manufacturer);
            pstmt.setDouble(5, price);
            pstmt.setDouble(6, weight);
            pstmt.executeUpdate();
            out.println("<p>Product added successfully!</p>");
        }
    }

    // Display all products
    out.println("<h3>Existing Products</h3>");
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT * FROM products");

    out.println("<table border='1'><tr><th>Product No</th><th>Name</th><th>Type</th><th>Manufacturer</th><th>Price</th><th>Weight</th></tr>");
    while (rs.next()) {
        out.println("<tr><td>" + rs.getString("product_no") + "</td>");
        out.println("<td>" + rs.getString("product_name") + "</td>");
        out.println("<td>" + rs.getString("product_type") + "</td>");
        out.println("<td>" + rs.getString("manufacturer") + "</td>");
        out.println("<td>" + rs.getDouble("price") + "</td>");
        out.println("<td>" + rs.getDouble("weight") + "</td></tr>");
    }
    out.println("</table>");

} catch (Exception e) {
    e.printStackTrace();
} finally {
    if (pstmt != null) pstmt.close();
    if (conn != null) conn.close();
}
%>

</body>
</html>
