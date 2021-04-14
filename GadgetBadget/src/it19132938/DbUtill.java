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
	
	
	//Projects part-Shehani
	public static List<Projects> getProjects(String Id)
	{
		int convertedId = Integer.parseInt(Id);
	
		ArrayList<Projects> projects = new ArrayList<>();
		
		try {
			
			con = DBConnection.getConnection();
			stat= con.createStatement();
			String sql= "select * from projects where ProjectId='"+convertedId+"'";
			result = stat.executeQuery(sql);
			
			while(result.next())
			{
				int ProjectId= result.getInt(1);
				String ProjectCode= result.getString(2);
				String ProjectName=result.getString(3);
				Blob image = result.getBlob(4);
				String Description= result.getString(5);
				String Budget=result.getString(6);
				String Category = result.getString(7);
				
				Projects p = new Projects(ProjectId,ProjectCode,ProjectName,image,Description,Budget,Category);
				projects.add(p);
			}
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
		
		return projects;
	}
	

}
