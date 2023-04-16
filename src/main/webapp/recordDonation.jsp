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
        Donor Name: <input type="text" Id="donor_completename" name="donor_completename"><br>
        Donation Form File: <input type="text" Id="donation_formfile" name="donation_formfile"><br>
        Donation Date: <input type="date" Id="date_donation" name="date_donation"><br>
        Accepted Homeowner ID: <input type="text" Id="accept_hoid" name="accept_hoid"><br>
        Accepted Position: <input type="text" Id="accept_position" name="accept_position"><br>
        Accepted Election Date: <input type="date" Id="accept_electiondate" name="accept_electiondate"><br>
        Deleted: <input type="checkbox" Id="isdeleted" name="isdeleted"><br>
        Approval Homeowner ID: <input type="text" Id="approval_hoid" name="approval_hoid"><br>
        Approval Position: <input type="text" Id="approval_position" name="approval_position"><br>
        Approval Election Date: <input type = "date" Id="approval_electiondate" name="approval_electiondate"><br>
        <input type="submit" value="Submit">
    </form>
</body>
</html>
