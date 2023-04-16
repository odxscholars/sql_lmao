<%--
  Created by IntelliJ IDEA.
  User: shems
  Date: 4/16/2023
  Time: 6:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update Asset Processing</title>
</head>
<body>
<jsp:useBean id="A" class="assetManagement.assets" scope="session"/>
<%
    String v_asset_id = request.getParameter("asset_id");
    String v_hoa_name = request.getParameter("hoa_name");
    String v_assetName = request.getParameter("asset_name");
    String v_assetDescription = request.getParameter("asset_description");
    String v_acquisitionDate = request.getParameter("acquisition_date");
    String v_forRent = request.getParameter("forrent");
    Double assetValue = Double.parseDouble(request.getParameter("asset_value"));
    String v_assetType = request.getParameter("type_asset");
    String v_status = request.getParameter("status");
    String v_lattitude = request.getParameter("loc_lattitude");
    String v_longitude = request.getParameter("loc_longitude");
    String v_enclosing_asset = request.getParameter("enclosing_assets");
    System.out.println(v_asset_id);
    System.out.println(v_hoa_name);
    System.out.println(v_assetName);
    System.out.println(v_assetDescription);
    System.out.println(v_acquisitionDate);
    System.out.println(v_forRent);
    System.out.println(assetValue);
    System.out.println(v_assetType);
    System.out.println(v_status);
    System.out.println(v_lattitude);
    System.out.println(v_longitude);
    System.out.println(v_enclosing_asset);
    A.asset_id = Integer.parseInt(v_asset_id);
    A.hoa_name = v_hoa_name;
    A.asset_name = v_assetName;
    A.asset_description = v_assetDescription;
    A.acquisition_date = v_acquisitionDate;
    if (v_forRent == null){
        A.forrent = 0;
    }else{
        A.forrent = 1;
    }
    A.asset_value = assetValue;
    A.type_asset = v_assetType;
    A.status = v_status;
    A.loc_lattitude = Double.parseDouble(v_lattitude);
    A.loc_longitude = Double.parseDouble(v_longitude);
    A.enclosing_asset = Integer.parseInt(v_enclosing_asset);
    int status = A.updateAsset();
    if (status == 1){ %>
    <h1>Asset Update Successful </h1><br>
    <h2>Asset Name: <%=A.asset_name%></h2><br>
    <h2>Asset Description: <%=A.asset_description%></h2><br>
    <h2>Asset Acquisition Date: <%=A.acquisition_date%></h2><br>
    <h2>Asset For Rent: <%=A.forrent%></h2><br>
    <h2>Asset Value: <%=A.asset_value%></h2><br>
    <h2>Asset Type: <%=A.type_asset%></h2><br>
    <h2>Asset Status: <%=A.status%></h2><br>
    <h2>Asset Lattitude: <%=A.loc_lattitude%></h2><br>
    <h2>Asset Longitude: <%=A.loc_longitude%></h2><br>
    <h2>Asset Enclosing Asset: <%=A.enclosing_asset%></h2><br>
    <h2>Asset HOA Name: <%=A.hoa_name%></h2><br>
    <%
    }
    else if (status == 0){ %>
    <h1>Asset Update failed </h1><br>
    <%
    }
    %>
%>
<form>
    <input type="button" value="Go back!" onclick="history.back()">
</form>

</body>
</html>
