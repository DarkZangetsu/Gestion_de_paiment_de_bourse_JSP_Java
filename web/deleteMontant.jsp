<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String idNiv = request.getParameter("idNiv");
    Connection con = null;
    PreparedStatement pstmt = null;

    try {
        // Charger le pilote JDBC MySQL
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Établir la connexion à la base de données
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bourse", "root", "");

        // Créer l'instruction de suppression en utilisant PreparedStatement pour éviter les injections SQL
        String query = "DELETE FROM montant WHERE idNiv = ?";
        pstmt = con.prepareStatement(query);
        pstmt.setString(1, idNiv);

        // Exécuter l'instruction de suppression
        int result = pstmt.executeUpdate();

        // Retourner une réponse
        if (result > 0) {
            out.println("Success");
        } else {
            out.println("Failure");
        }

    } catch (ClassNotFoundException | SQLException e) {
        e.printStackTrace();
        out.println("Failure");
    } finally {
        // Fermer le PreparedStatement et la connexion dans le bloc finally
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
