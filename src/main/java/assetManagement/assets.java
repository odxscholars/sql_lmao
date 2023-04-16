package assetManagement;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class assets {
    public int asset_id;
    public String asset_name;
    public String asset_description;
    public String acquisition_date;
    public int forrent;
    public double asset_value;
    public String type_asset;
    public String status;
    public double loc_lattitude;
    public double loc_longitude;
    public String hoa_name;
    public int enclosing_asset;


    //arraylist for int
    public ArrayList<Integer> asset_idList = new ArrayList<>();
    public ArrayList<String> asset_nameList = new ArrayList<>();
    public ArrayList<String> asset_descriptionList = new ArrayList<>();
    public ArrayList<Integer> forrentList = new ArrayList<Integer>();
    public ArrayList<Double> asset_valueList = new ArrayList<>();
    public ArrayList<Character> type_assetList = new ArrayList<>();
    public ArrayList<Character> status_List = new ArrayList<>();
    public ArrayList<String> hoa_nameList = new ArrayList<>();




    public assets() {
    }

    public int register_asset(){
        try{
            /*Class.forName("com.mysql.jdbc.Driver");*/
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hoadb", "root", "12345678");
            System.out.println("Connected to the database!");

            PreparedStatement stmt = con.prepareStatement("SELECT MAX(asset_id) + 1 AS newID FROM assets");
            ResultSet rst = stmt.executeQuery();
            while(rst.next()){
                asset_id = rst.getInt("newID");
            }

            stmt = con.prepareStatement( "INSERT INTO assets (asset_id,asset_name,asset_description,acquisition_date,forrent,asset_value,type_asset,status,loc_lattitude,loc_longiture,hoa_name, enclosing_asset) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)");
            stmt.setInt(1, asset_id);
            stmt.setString(2, asset_name);
            stmt.setString(3, asset_description);
            stmt.setString(4, acquisition_date);
            stmt.setInt(5, forrent);
            stmt.setDouble(6, asset_value);
            stmt.setString(7, String.valueOf(type_asset));
            stmt.setString(8, String.valueOf(status));
            stmt.setDouble(9, loc_lattitude);
            stmt.setDouble(10, loc_longitude);
            stmt.setString(11, hoa_name);
            if (enclosing_asset == -1){
                System.out.println("Setting to null");
                stmt.setNull(12, java.sql.Types.INTEGER);
            }else {
                stmt.setInt(12, enclosing_asset);
            }
            /*System.out.println(stmt);*/
            stmt.executeUpdate();
            System.out.println("Asset registered successfully!");
            stmt.close();
            con.close();
            return 1;
            //prepare the statement





        }catch (Exception e){
            System.out.println("Error: " + e);
            return 0;

        }


    }

    public int enclosingAssets(){

        try{
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hoadb", "root", "12345678");
            System.out.println("Connected to the database!");

            PreparedStatement stmt = con.prepareStatement("SELECT asset_id,asset_name FROM assets WHERE status != 'D' AND type_asset = 'P'");
            asset_idList.clear();
            asset_nameList.clear();
            ResultSet rst = stmt.executeQuery();
            while(rst.next()){
                asset_idList.add(rst.getInt("asset_id"));
                asset_nameList.add(rst.getString("asset_name"));
            }
            stmt.close();
            con.close();

            return 1;
        }catch(Exception e){
            System.out.println("Error: " + e);
            return 0;
        }

    }

    public int getAssociatedHOA(){
        try{
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hoadb", "root", "12345678");
            System.out.println("Connected to the database!");

            PreparedStatement stmt = con.prepareStatement("SELECT DISTINCT hoa_name FROM hoa");
            hoa_nameList.clear();
            ResultSet rst = stmt.executeQuery();
            while(rst.next()){
                hoa_nameList.add(rst.getString("hoa_name"));
            }
            stmt.close();
            con.close();

            return 1;
        }catch(Exception e){
            System.out.println("Error: " + e);
            return 0;
        }
    }

    public int getUpdatedAsset(){
        try{
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hoadb", "root", "12345678");
            System.out.println("Connected to the database!");

            PreparedStatement stmt = con.prepareStatement("SELECT asset_id,asset_name FROM assets");
            ResultSet rst = stmt.executeQuery();
            asset_idList.clear();
            asset_nameList.clear();
            while(rst.next()){
                asset_idList.add(rst.getInt("asset_id"));
                asset_nameList.add(rst.getString("asset_name"));
            }
            stmt.close();
            con.close();
            return 1;
        } catch(Exception e){
            System.out.println("Error: " + e);
            return 0;
        }

    }

    public int updateAsset(){
        try{
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hoadb", "root", "12345678");
            System.out.println("Connected to the database!");

            PreparedStatement stmt = con.prepareStatement("UPDATE assets SET asset_id=?,asset_name=?,asset_description=?,acquisition_date=?," +
                    "forrent=?,asset_value=?,type_asset=?,status=?,loc_lattitude=?,loc_longiture=?,hoa_name=?, " +
                    "enclosing_asset=? WHERE asset_id=?");

            stmt.setInt(1, asset_id);
            stmt.setString(2, asset_name);
            stmt.setString(3, asset_description);
            stmt.setString(4, acquisition_date);
            stmt.setInt(5, forrent);
            stmt.setDouble(6, asset_value);
            stmt.setString(7, String.valueOf(type_asset));
            stmt.setString(8, String.valueOf(status));
            stmt.setDouble(9, loc_lattitude);
            stmt.setDouble(10, loc_longitude);
            stmt.setString(11, hoa_name);
            if (enclosing_asset == -1){
                System.out.println("Setting to null");
                stmt.setNull(12, java.sql.Types.INTEGER);
            }else {
                stmt.setInt(12, enclosing_asset);
            }
            stmt.setInt(13, asset_id);
            stmt.executeUpdate();
            stmt.close();
            con.close();
            return 1;
        } catch(Exception e){
            System.out.println("Error: " + e);
            return 0;
        }
    }


    public int getDeletableAssets() {
        try {
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hoadb", "root", "12345678");
            PreparedStatement stmt = con.prepareStatement("SELECT asset_id, asset_name " +
                    "FROM assets a WHERE " +
                    "asset_id NOT IN (SELECT DISTINCT asset_id FROM asset_transactions)" +
                    "AND asset_id NOT IN (SELECT DISTINCT asset_id FROM donated_assets)" +
                    "AND a.forrent = 0 " +
                    "AND asset_id NOT IN (SELECT DISTINCT asset_id FROM asset_rentals)");
            asset_idList.clear();
            asset_nameList.clear();
            ResultSet rst = stmt.executeQuery();
            while (rst.next()) {
                asset_idList.add(rst.getInt("asset_id"));
                asset_nameList.add(rst.getString("asset_name"));
            }
            stmt.close();
            con.close();
            return 1;
        } catch (Exception e) {
            System.out.println("Error: " + e);
            return 0;

        }
    }

    public int deleteAsset(){
        try{
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hoadb", "root", "12345678");
            System.out.println("Connected to the database!");
            //update assets with enclosing asset
            PreparedStatement stmt = con.prepareStatement("UPDATE assets SET enclosing_asset = NULL WHERE enclosing_asset = ?");
            stmt.setInt(1, asset_id);
            stmt.executeUpdate();
            stmt = con.prepareStatement("DELETE FROM assets WHERE asset_id = ?");
            stmt.setInt(1, asset_id);
            stmt.executeUpdate();
            stmt.close();
            con.close();
            return 1;
        }catch (Exception e){
            System.out.println("Error: " + e);
            return 0;
        }

    }

    public int disposeAsset(){
        Connection con = null;
        try{
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hoadb", "root", "12345678");
            System.out.println("Connected to the database!");
            PreparedStatement stmt = con.prepareStatement("UPDATE assets SET status = 'D' WHERE asset_id = ?");
            stmt.setInt(1, asset_id);
            stmt.executeUpdate();
            stmt.close();
            con.close();

            return 1;

        }catch (Exception e){
            System.out.println("Error: " + e);
            return 0;
        }

    }











}