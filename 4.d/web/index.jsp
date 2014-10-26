<form action="add.jsp" method="post">
    <table>
        <tr>
            <th>Customer No.</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Address</th>
            <th>Mobile No.</th>
            <th>Email</th>
        </tr>
        <%
            int rows = 0;
            while (5 > rows++) {
        %>
        <tr>
            <td><input type="text" name="custNo<%=rows%>"/></td>
            <td><input type="text" name="fName<%=rows%>"/></td>
            <td><input type="text" name="lName<%=rows%>"/></td>
            <td><input type="text" name="add<%=rows%>"/></td>
            <td><input type="text" name="mobNo<%=rows%>"/></td>
            <td><input type="text" name="email<%=rows%>"/></td>
        </tr>
        <%}%>
    </table>
    <input type="hidden" name="rows" value="<%=rows%>"/>
    <input type="submit" value="Save"/>
</form>