package donationManagement;

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
    public double amount_donated;

    public String address;

    

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

            stmt = con.prepareStatement("INSERT INTO asset_donations (donation_id, donor_completename, donation_formfile, date_donation, accept_hoid, accept_position, accept_electiondate," +
                                        "approval_hoid, approval_position, approval_electiondate) VALUES(?,?,?,?,?,?,?,?,?,?)");
            stmt.setInt(1,donation_id);
            stmt.setString(2, donor_completename);
            stmt.setString(3, donation_formfile);
            stmt.setString(4, date_donation);
            stmt.setInt(5, accept_hoid);
            stmt.setString(6, accept_position);
            stmt.setString(7, accept_electiondate);
            stmt.setInt(8, approval_hoid);
            stmt.setString(9, approval_position);
            stmt.setString(10, approval_electiondate);
            stmt.executeUpdate();
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
}
