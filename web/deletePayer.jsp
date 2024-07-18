<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String idpaye = request.getParameter("idpaye");
    Connection con = null;
    Statement stmt = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bourse", "root", "");

        stmt = con.createStatement();
        String query = "DELETE FROM payer WHERE idpaye = '" + idpaye + "'";

        int result = stmt.executeUpdate(query);

        if (result > 0) {
            out.print("Success");
        } else {
            out.print("Failure");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.print("Failure");
    } finally {
        if (stmt != null) {
            try {
                stmt.close();
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
