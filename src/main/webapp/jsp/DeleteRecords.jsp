<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Delete Product</title>
</head>
<body>

<h2>Delete Product</h2>
<form method="post">
    <label>Enter Product No:</label>
    <input type="text" name="product_no"><br>
    <input type="submit" name="deleteProduct" value="Delete the Product">
</form>

<%
String dbURL = "jdbc:mysql://localhost:3306/as3_glen/products/";
String dbUser = "root";
String dbPass = "password"; // Replace with your MySQL password

Connection conn = null;
PreparedStatement pstmt = null;

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

    if (request.getParameter("deleteProduct") != null) {
        String productNo = request.getParameter("product_no");

        String sql = "DELETE FROM products WHERE product_no = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, productNo);
        int rows = pstmt.executeUpdate();
        if (rows > 0) {
            out.println("<p>Product deleted successfully!</p>");
        } else {
            out.println("<p style='color:red;'>Product not found!</p>");
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
