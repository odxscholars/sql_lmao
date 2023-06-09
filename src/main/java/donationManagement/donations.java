package donationManagement;

import java.io.ObjectInputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class donations {
    public int donation_id;
    public String donor_completename;
    public String donation_formfile;
    public String date_donation;
    public int accept_hoid;
    public String accept_position;
    public String accept_electiondate;
    public int isdeleted;
    public int approval_hoid;
    public String approval_position;
    public String approval_electiondate;

    public int asset_id;
    public String asset_name;
    public double amount_donated;

    public String address;

    public String picturefile;

    public ArrayList<Integer> donation_idList = new ArrayList<>();
    public ArrayList<String> donor_completenameList = new ArrayList<>();
    public ArrayList<String> donation_formfileList = new ArrayList<>();
    public ArrayList<String> date_donationList = new ArrayList<>();
    public ArrayList<Integer> accept_hoidList = new ArrayList<>();
    public ArrayList<String> accept_positionList = new ArrayList<>();
    public ArrayList<String> accept_electiondateList = new ArrayList<>();
    public ArrayList<Integer> isdeletedList = new ArrayList<>();
    public ArrayList<Integer> approval_hoidList = new ArrayList<>();
    public ArrayList<String> approval_positionList = new ArrayList<>();
    public ArrayList<String> approval_electiondateList = new ArrayList<>();

    public ArrayList<Integer> asset_idList = new ArrayList<>();
    public ArrayList<Double> amount_donatedList = new ArrayList<>();

    public ArrayList<String> addressList = new ArrayList<>();

    public ArrayList<String> picturefileList = new ArrayList<>();
    public ArrayList<String> asset_nameList = new ArrayList<>();

    public donations(){
    }

    public int register_donations(){
        try{
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hoadb", "root", "12345678");
            System.out.println("Connected to the database!");

            PreparedStatement stmt = con.prepareStatement("SELECT MAX(donation_id) + 1 AS newID FROM asset_donations");
            ResultSet rst = stmt.executeQuery();
            while(rst.next()){
                donation_id = rst.getInt("newID");
            }
            System.out.println("got donation id");

            stmt = con.prepareStatement("SELECT position, election_date FROM officer WHERE ho_id = ?");
            stmt.setInt(1, accept_hoid);
            rst = stmt.executeQuery();
            while(rst.next()){
                accept_position = rst.getString("position");
                accept_electiondate = rst.getString("election_date");
            }
            System.out.println("got position and election_Date");
            stmt = con.prepareStatement("INSERT INTO donors (donorname, address) VALUES(?, ?)");
            stmt.setString(1, donor_completename);
            stmt.setString(2, address);
            stmt.executeUpdate();
            System.out.println("inserted into asset_donations");

            stmt = con.prepareStatement("INSERT INTO asset_donations (donation_id, donor_completename, donation_formfile, date_donation, accept_hoid, accept_position, accept_electiondate," +
                                        "approval_hoid, approval_position, approval_electiondate, isdeleted) VALUES(?,?,?,?,?,?,?,?,?,?,?)");
            stmt.setInt(1,donation_id);
            stmt.setString(2, donor_completename);
            String firstName = donor_completename.substring(0, donor_completename.indexOf(" "));
            stmt.setString(3, donation_id + firstName + ".pdf");
            stmt.setString(4, date_donation);
            stmt.setInt(5, accept_hoid);
            stmt.setString(6, accept_position);
            stmt.setString(7, accept_electiondate);
            stmt.setNull(8, java.sql.Types.INTEGER);
            stmt.setNull(9, java.sql.Types.VARCHAR);
            stmt.setNull(10, java.sql.Types.VARCHAR);
            stmt.setInt(11, 0);
            stmt.executeUpdate();



            System.out.println("inserted into donors");

            stmt = con.prepareStatement("INSERT INTO donated_assets (donation_id, asset_id, amount_donated) VALUES(?,?,?)");
            stmt.setInt(1, donation_id);
            stmt.setInt(2, asset_id);
            stmt.setDouble(3, amount_donated);
            stmt.executeUpdate();
            System.out.println("inserted into donated_assets");

            if(picturefile.length() > 0){
                stmt = con.prepareStatement("INSERT INTO donation_pictures(donation_id, picturefile) VALUES(?,?)");
                stmt.setInt(1, donation_id);
                stmt.setString(2, picturefile);
                stmt.executeUpdate();
                System.out.println("inserted into donation_pictures");
            }

            System.out.println("Donation registered successfully!");
            stmt.close();
            con.close();
            return 1;
        } catch (Exception e){
            System.out.println("Error: " + e);
            return 0;

        }

    }

    public int getOfficerList(){
        try{
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hoadb", "root", "12345678");
            System.out.println("Connected to the database!");
            PreparedStatement stmt = con.prepareStatement("SELECT ho_id FROM officer o");
            ResultSet rst = stmt.executeQuery();
            accept_hoidList.clear();

            while(rst.next()){
                accept_hoidList.add(rst.getInt("ho_id"));
            }
            stmt.close();
            con.close();

            return 1;

        }catch (Exception e){
            System.out.println("Error: " + e);
            return 0;
        }
    }

    public int getDonations(){
        try{
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hoadb", "root", "12345678");
            System.out.println("Connected to the database!");

            PreparedStatement stmt = con.prepareStatement("SELECT donation_id FROM asset_donations" );
            ResultSet rst = stmt.executeQuery();
            donation_idList.clear();
            while (rst.next()){
                donation_idList.add(rst.getInt(donation_id));
            }
            stmt.close();
            con.close();
            return 1;
        } catch (Exception e){
            System.out.println("Error: " + e);
            return 0;
        }

    }

    public int listOfAssets(){
        try{
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hoadb", "root", "12345678");
            System.out.println("Connected to the database!");
            PreparedStatement stmt = con.prepareStatement("SELECT asset_id, asset_name FROM assets");
            ResultSet rst = stmt.executeQuery();
            asset_idList.clear();
            asset_nameList.clear();
            while (rst.next()){
                asset_idList.add(rst.getInt("asset_id"));
                asset_nameList.add(rst.getString("asset_name"));
            }
            stmt.close();
            con.close();
            return 1;
        }catch (Exception e){
            System.out.println("Error: " + e);
            return 0;
        }


    }

    public int getAssociatedName(){
        try {
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hoadb", "root", "12345678");
            System.out.println("Connected to the database!");

            PreparedStatement stmt = con.prepareStatement("SELECT donorname FROM donors");
            donor_completenameList.clear();
            ResultSet rst = stmt.executeQuery();
            while (rst.next()){
                donor_completenameList.add(rst.getString("donorname"));
            }
            stmt.close();
            con.close();

            return 1;
        } catch (Exception e) {
            System.out.println("Error: " + e);
            return 0;
        }
    }

}
