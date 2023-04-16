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
    String v_donation_formfile = request.getParameter("donation_formfile");
    String v_date_donation = request.getParameter("date_donation");
    String v_accept_hoid = request.getParameter("accept_hoid");
    String v_address = request.getParameter("address");
    String v_amount_donated = request.getParameter("amount_donated");
    String v_picturefile = request.getParameter("picturefile");

    System.out.println(v_donor_completename);
    System.out.println(v_donation_formfile);
    System.out.println(v_date_donation);
    System.out.println(v_accept_hoid);
    System.out.println(v_address);
    System.out.println(v_amount_donated);
    System.out.println(v_picturefile);

    A.donor_completename = v_donor_completename;
    A.donation_formfile = v_donation_formfile;
    A.date_donation = v_date_donation;
    A.accept_hoid = v_accept_hoid;
    A.address = v_address;
    A.amount_donated = v_amount_donated;
    A.picturefile = v_picturefile;
%>
</body>
</html>
