<%--
  Created by IntelliJ IDEA.
  User: shems
  Date: 4/15/2023
  Time: 10:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%--<link rel = "stylesheet" type = "text/css" href = "css/register.css">--%>
<head>
    <title>Register Asset</title>
</head>
<body>
    <form action = "register_processing.jsp">
        <jsp:useBean id="A" class="assetManagement.assets" scope="session" />
        HOA Name: <select class = "inputClass" id = "hoa_name" name="hoa_name">
            <%

                int status = A.getAssociatedHOA();
                if (status == 1){
                    for(int i = 0; i < A.hoa_nameList.size(); i++){ %>
            <option class = "inputClass"  value = "<%=A.hoa_nameList.get(i)%>"> <%=A.hoa_nameList.get(i)%>

                <%}

                } %>
            </option>
        </select>
        <br>
        <label class = "inputClass" for = "asset_name">Asset Name: </label> <input type="text" class = "inputClass"  Id="asset_name" name="asset_name"><br>
        <label for = "asset_description" class = "inputClass">Asset Description: </label> <input type="text" Id="asset_description" class = "inputClass"  name="asset_description"><br>
        <label for = "acquisition_date" class = "inputClass">Acquisition Date: </label> <input type="date" Id="acquisition_date" class = "inputClass"  name="acquisition_date"><br>
        <label for = "forrent" class = "inputClass">For Rent</label> <input type="checkbox" Id="forrent" name="forrent" class = "inputClass" ><br>
        <label for = "asset_value" class = "inputClass" >Asset Value:</label> <input type="text" Id="asset_value" name="asset_value" class = "inputClass" ><br>
        Asset Type:
        <input type="radio" Id="P" name="type_asset" value="P" class = "inputClass">P - Property<br>
        <input type="radio" Id="E" name="type_asset" value="E" class = "inputClass" >E - Equipment<br>
        <input type="radio" Id="F" name="type_asset" value="F" class = "inputClass">F - Furniture and Fixtures<br>
        <input type="radio" Id="O" name="type_asset" value="O" class = "inputClass">O - Other Assets<br>

        <label>Asset Status: </label><br>
        <input type="radio" Id="A" name="status" value="W">W - Working <br>
        <input type="radio" Id="B" name="status" value="D">D - Deteriorated<br>
        <input type="radio" Id="C" name="status" value="P">P - For Repair<br>
        <input type="radio" Id="D" name="status" value="S">S - For Disposal<br>


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
        <br>









        <input type="submit" value="Submit">
    </form>
</body>
</html>
