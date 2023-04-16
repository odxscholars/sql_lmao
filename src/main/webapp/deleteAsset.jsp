<%--
  Created by IntelliJ IDEA.
  User: shems
  Date: 4/16/2023
  Time: 7:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form action = "delete_asset_processing.jsp">
        <jsp:useBean id="A" class="assetManagement.assets" scope="session" />

        Asset To Delete
        <select name="assetDelete" id = "assetDelete" >
                <%

                int status = A.getDeletableAssets();
                if (status == 1){
                    for(int i = 0; i < A.asset_idList.size(); i++){ %>
                <option value = "<%=A.asset_idList.get(i)%>"> <%=A.asset_idList.get(i) + "-" + A.asset_nameList.get(i)%>

                <%}}%>
        </select>
        <br>
        <input type ="submit" value="Delete Asset" /> <br>

    </form>

</body>
</html>
