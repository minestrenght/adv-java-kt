<%@page import="java.sql.*" %>
<%
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/minestrenght", "root", "root");
        PreparedStatement ps = con.prepareStatement("insert into customers values(?,?,?,?,?,?)");
        int rows = Integer.parseInt(request.getParameter("rows"));
        while (1 <= --rows) {
            ps.setInt(1, Integer.parseInt(request.getParameter("custNo" + rows)));
            ps.setString(2, request.getParameter("fName" + rows));
            ps.setString(3, request.getParameter("lName" + rows));
            ps.setString(4, request.getParameter("add" + rows));
            ps.setString(5, request.getParameter("mobNo" + rows));
            ps.setString(6, request.getParameter("email" + rows));
            ps.addBatch();
        }
        int[] updates = ps.executeBatch();
        if (0 < updates.length) {
            out.print("No. of rows saved: " + updates.length);
        } else {
            out.print("Failed to save record");
        }
        ps.close();
        con.close();
    } catch (ClassNotFoundException e) {
        out.print("Failed to load driver.");
    } catch (SQLException e) {
        out.print("Server error.");
        e.printStackTrace(System.err);
    }
%>
<br/><a href="index.jsp">Back</a>