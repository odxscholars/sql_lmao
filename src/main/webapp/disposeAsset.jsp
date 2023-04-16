<%--
  Created by IntelliJ IDEA.
  User: shems
  Date: 4/16/2023
  Time: 8:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Dispose Asset</title>
</head>
<body>
    <form action="dispose_asset_processing.jsp">
        <jsp:useBean id="A" class="assetManagement.assets" scope="session" />
        Asset To Dispose
        <select name="assetDispose" id = "assetDispose" >
            <%

                int status = A.getDeletableAssets();
                if (status == 1){
                    for(int i = 0; i < A.asset_idList.size(); i++){ %>
            <option value = "<%=A.asset_idList.get(i)%>"> <%=A.asset_idList.get(i) + "-" + A.asset_nameList.get(i)%>

                    <%}}%>
        </select>

        <input type ="submit" value = "Dispose Asset" />
    </form>

</body>
</html>
