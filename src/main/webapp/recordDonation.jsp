<%--
  Created by IntelliJ IDEA.
  User: shems
  Date: 4/16/2023
  Time: 4:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Record Donation</title>
</head>
<body>
    <form action = "record_asset_donation_processing.jsp">
        <jsp:useBean id="A" class="donationManagement.donations" scope="session" />
        Donor Name: <input type="text" Id="donor_completename" name="donor_completename"><br>
        Donor Address: <input type="text" Id="address" name="address"><br>
<%--        Donation Form File: <input type="text" Id="donation_formfile" name="donation_formfile"><br>--%>
        Donation Date: <input type="date" Id="date_donation" name="date_donation"><br>
        Accepted Homeowner ID:
        <label>
            <select name = "accepted_hoid">
                <%

                    int status = A.getOfficerList();
                    for (int i = 0; i < A.accept_hoidList.size(); i++){ %>
                        <option value = "<%=A.accept_hoidList.get(i)%>"><%=A.accept_hoidList.get(i)%></option>
                <% } %>

            </select>
        </label>
        <br>
        Picture File<input type="text" Id="picturefile" name="picturefile"><br>
        Asset To Be Donated: <select name = "donatedAsset">
            <%

                status = A.listOfAssets();
                for (int i = 0; i < A.asset_idList.size(); i++){ %>
            <option value = "<%=A.asset_idList.get(i)%>"><%=A.asset_idList.get(i) + "-" + A.asset_nameList.get(i) %></option>
            <% } %>

        </select><br>
        Amount Donated:<input type="text" Id="amount_donated" name="amount_donated"><br>

        <input type="submit" value="Submit">
    </form>
</body>
</html>
