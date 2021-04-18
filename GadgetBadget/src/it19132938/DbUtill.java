package it19132938;

import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

@SuppressWarnings("unused")

public class DbUtill {
	
	private static Connection con = null;
	private static Statement stat = null;
	private static ResultSet result = null;
	

	public static boolean insertDonation(String name,String email,String amount , String cardNumber,String CVC)
	{
		boolean isSuccess=false;
		
		try {
			
			con = DBConnection.getConnection();
			stat = con.createStatement();
			String sql = "insert into donations values(0,'"+name+"','"+email+"', '"+amount+"', '"+cardNumber+"',  '"+CVC+"' )";
			int result = stat.executeUpdate(sql);
			
			if(result > 0) {
				
				isSuccess = true;
				
			}
			
			else {
				
				isSuccess = false;
				
			}
			
		}
		
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return isSuccess;
	}
	
	public static List<Donations> getDonationList(){
		
		
		ArrayList<Donations> donations = new ArrayList<>();
		
		try {
			
			con = DBConnection.getConnection();
			stat = con.createStatement();
			String sql = "select * from donations ";
			result = stat.executeQuery(sql);
			
			while(result.next())
			{
				int donationID = result.getInt(1);
				String name = result.getString(2);
				String email = result.getString(3);
				String amount = result.getString(4);
				String cardNumber= result.getString(5);
				String CVC= result.getString(6);
				
				Donations rs = new Donations( donationID,name ,email,amount,cardNumber,CVC);
				donations.add(rs);
			}
			
			
		}
		
		catch(Exception e) {
			
			e.printStackTrace();
		}
		
				
		return donations;
		
		
	}
	
	

}
