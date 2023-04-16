<%--
  Created by IntelliJ IDEA.
  User: shems
  Date: 4/16/2023
  Time: 9:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form action = index.jsp>
        <jsp:useBean id="A" class="assetManagement.assets" scope="session" />
        <%
            int v_asset_id = Integer.parseInt(request.getParameter("assetDispose"));
            A.asset_id = v_asset_id;
            int status = A.deleteAsset();
            if (status == 1) { %>
                <h1>Asset <%=A.asset_id%> Disposed Successfully</h1>
            <% } else { %>
                <h1>Asset Deletion Failed</h1>
            <% }






        %>



    </form>
</body>
</html>
