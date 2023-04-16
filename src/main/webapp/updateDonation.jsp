<%--
  Created by IntelliJ IDEA.
  User: shems
  Date: 4/17/2023
  Time: 12:39 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update Donation</title>
</head>
<body>
    <form action="update_donation_processing.jsp">
        <jsp:useBean id="d" class="donationManagement.donations" scope="session" />
        <select id="donation_id">
            <%
                int status = d.getDonations();
                if (status == 1){
                    for(int i = 0; i < d.donation_idList.size(); i++){
                        %>
                        <option value = "<%=d.donation_idList.get(i)%>"><%=d.donation_idList.get(i)
                        %>
                        <%
                    }
                }
            %></option>
        </select><br>
        <select class="inputClass" id="donor_completename" >
            <%
                status = d.getAssociatedName();
                if (status == 1){
                    for (int i = 0; i < d.donor_completenameList.size(); i++){ %> 

                    }
                }
            %>
        </select>
    </form>

</body>
</html>
