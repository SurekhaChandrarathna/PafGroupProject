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

}
