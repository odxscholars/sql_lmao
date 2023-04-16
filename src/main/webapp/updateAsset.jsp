<%--
  Created by IntelliJ IDEA.
  User: shems
  Date: 4/16/2023
  Time: 4:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update Asset</title>
</head>
<body>
    <form action = "update_asset_processing.jsp">
        <jsp:useBean id="A" class="assetManagement.assets" scope="session" />
        Asset to be updated:
        <select id = "asset_id" name = "asset_id">
            <%
            int status = A.getUpdatedAsset();
            if (status == 1){
                for(int i = 0; i < A.asset_idList.size(); i++){
            %>
            <option value = "<%=A.asset_idList.get(i)%>"><%=A.asset_idList.get(i) + "-" + A.asset_nameList.get(i)
            %>
            <%}
            } %>
            </option>
        </select><br>
        Asset New HOA: <input type="text" Id="hoa_name" name="hoa_name"><br>
        Asset New Name: <input type="text" Id="asset_name" name="asset_name"><br>
        Asset New Description: <input type="text" Id="asset_description" name="asset_description"><br>
        Acquisition Date: <input type="date" Id="acquisition_date" name="acquisition_date"><br>
        For Rent: <input type="checkbox" Id="for_rent" name="for_rent"><br>
        Asset Value: <input type="text" Id="asset_value" name="asset_value"><br>
        <label>Asset Type: </label><br>
        <input type="radio" Id="P" name="type_asset" value="1">P<br>
        <input type="radio" Id="E" name="type_asset" value="2">E<br>
        <input type="radio" Id="F" name="type_asset" value="2">F<br>
        <input type="radio" Id="O" name="type_asset" value="2">O<br>

        <label>Asset Status: </label><br>
        <input type="radio" Id="A" name="status" value="1">W<br>
        <input type="radio" Id="B" name="status" value="2">D<br>
        <input type="radio" Id="C" name="status" value="2">P<br>
        <input type="radio" Id="D" name="status" value="2">S<br>
        <input type="radio" Id="E" name="status" value="2">X<br>

        Loc_lattitude: <input type="text" Id="loc_lattitude" name="loc_lattitude"><br>
        Loc_longitude: <input type="text" Id="loc_longitude" name="loc_longitude"><br>

        Enclosing Assets: <select id = "enclosing_assets" name = "enclosing_assets">
        <option value = "-1"> None </option>
        <%

            status = A.enclosingAssets();
            if (status == 1){
                for(int i = 0; i < A.asset_nameList.size(); i++){ %>
        <option value = "<%=A.asset_idList.get(i)%>"> <%=A.asset_idList.get(i) + "-" + A.asset_nameList.get(i)%>

            <%}


            } %>
        </option>
    </select>
        <input type="submit" value="Submit">
    </form>

</body>
</html>
