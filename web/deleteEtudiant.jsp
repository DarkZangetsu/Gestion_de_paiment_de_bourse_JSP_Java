<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String matricule = request.getParameter("matricule");
    Connection con = null;
    PreparedStatement pstmt = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bourse", "root", "");

        String query = "DELETE FROM etudiant WHERE matricule = ?";
        pstmt = con.prepareStatement(query);
        pstmt.setString(1, matricule);

        int result = pstmt.executeUpdate();

        if (result > 0) {
            out.print("Success");
        } else {
            out.print("Failure");
        }
    } catch (ClassNotFoundException | SQLException e) {
        e.printStackTrace();
        out.print("Failure: " + e.getMessage());
    } finally {
        if (pstmt != null) {
            try {
                pstmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (con != null) {
            try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
%>
