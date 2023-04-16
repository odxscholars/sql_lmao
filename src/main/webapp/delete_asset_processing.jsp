<%--
  Created by IntelliJ IDEA.
  User: shems
  Date: 4/16/2023
  Time: 8:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
</head>
<body>
<h1>Delete Asset</h1>
 <jsp:useBean id="A" class="assetManagement.assets" scope="session"/>
  <%
      System.out.println("deleting asset");
    String v_assetID = request.getParameter("assetDelete");
    A.asset_id = Integer.parseInt(v_assetID);
    int status = A.deleteAsset();
    System.out.println(status);
    if(status > 0){ %>
        <h1>Deleting Asset Successful</h1>
    <%
    }
    else{%>
        <h1>Deleting Asset Failed</h1>
    <%}%>
















    <form action = "index.jsp">
        <input type="submit" value="Go back!">
    </form>







</body>
</html>
