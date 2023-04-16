<%--
  Created by IntelliJ IDEA.
  User: shems
  Date: 4/16/2023
  Time: 11:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register Asset Donation Processing</title>
</head>
<body>
<jsp:useBean id="A" class="donationManagement.donations" scope="session"/>
<%
    String v_donor_completename = request.getParameter("donor_completename");
    String v_date_donation = request.getParameter("date_donation");
    String v_accept_hoid = request.getParameter("accepted_hoid");
    String v_address = request.getParameter("address");
    String v_donatedId_asset = request.getParameter("donatedAsset");
    String v_amount_donated = request.getParameter("amount_donated");
    String v_picturefile = request.getParameter("picturefile");

    System.out.println(v_donor_completename);
    System.out.println(v_date_donation);
    System.out.println(v_accept_hoid);
    System.out.println(v_address);
    System.out.println(v_amount_donated);
    System.out.println(v_picturefile);

    A.donor_completename = v_donor_completename;
    A.date_donation = v_date_donation;
    A.accept_hoid = Integer.parseInt(v_accept_hoid);
    A.address = v_address;
    A.amount_donated = Double.parseDouble(v_amount_donated);
    A.asset_id = Integer.parseInt(v_donatedId_asset);
    A.picturefile = v_picturefile;

    int status = A.register_donations();
    if (status == 1){ %>
    <h1>Donation Registration Successful </h1><br>
    <h2>Donor Name: <%=A.donor_completename%></h2><br>
    <h2>Donation Date: <%=A.date_donation%></h2><br>
    <h2>Accepting Officer Homeowner ID: <%=A.accept_hoid%></h2><br>
    <h2>Donor Address: <%=A.address%></h2><br>
    <h2>Amount Donated: <%=A.amount_donated%></h2><br>
    <h2>Picture File: <%=A.picturefile%></h2><br>
    <%
    }
    else if (status == 0){ %>
    <h1>Donation Registration failed </h1><br>
    <%
        }
    %>
    %>
</body>
</html>
