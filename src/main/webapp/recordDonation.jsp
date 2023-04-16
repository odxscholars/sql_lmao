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
        Donation Form File: <input type="text" Id="donation_formfile" name="donation_formfile"><br>
        Donation Date: <input type="date" Id="date_donation" name="date_donation"><br>
        Accepted Homeowner ID:
        <select name = "accepted_hoid">
            <%

                int status = A.getOfficerList();
                for (int i = 0; i < A.accept_hoidList.si)



            %>





        </select>


        Picture File<input type="text" Id="picturefile" name="picturefile"><br>
        <input type="submit" value="Submit">
    </form>
</body>
</html>
