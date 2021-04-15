package it19155494;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class DBConnection {
	
	private String URL = "jdbc:mysql://localhost:3306/paf";
	private String Username = "root";
	private String Password = "ABCroot@1";
	
	private static final String INSERT_PROJECT_SQL = "INSERT INTO projects" + "  (p_id, project_img, proj_name, proj_category, proj_des, proj_budget) VALUES "
	+ " (?, ?, ?, ? ,?, ?);";

	private static final String SELECT_PROJECT_BY_ID = "select id ,p_id, project_img, proj_name, proj_category, proj_des, proj_budget from projects where id =?";
	private static final String SELECT_ALL_PROJECT = "select * from projects";
	private static final String DELETE_PROJECT_SQL = "delete from projects where id = ?;";
	private static final String UPDATE_PROJECT_SQL = "update projects set p_id = ?,project_img= ?, proj_name =?, proj_category=?, proj_des=?, proj_budget=?  where id = ?;";

	
	protected Connection getConnection() {
		
		Connection con = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(URL, Username, Password);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return con;
}
	//add project
	public void insertProject(Project project) throws SQLException {
		
		try(Connection connection = getConnection();
				PreparedStatement ptStatement = connection.prepareStatement(INSERT_PROJECT_SQL)){
			ptStatement.setString(1, project.getPcode());
			ptStatement.setString(2, project.getImg());
			ptStatement.setString(3, project.getPname());
			ptStatement.setString(4, project.getCategory());
			ptStatement.setString(5, project.getDescription());
			ptStatement.setDouble(6, project.getBudget());
			ptStatement.executeUpdate();
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}	
		
	//update projects
	
	public boolean updateProjects(Project project) throws SQLException {
		boolean updated;
		
		try(Connection con = getConnection();
				PreparedStatement stmt = con.prepareStatement(UPDATE_PROJECT_SQL);){
			stmt.setString(1, project.getPcode());
			stmt.setString(2, project.getImg());
			stmt.setString(3, project.getPname());
			stmt.setString(4, project.getCategory());
			stmt.setString(5, project.getDescription());
			stmt.setDouble(6, project.getBudget());
			
			updated = stmt.executeUpdate() >0;
		}
		return updated;
		
	}
	
	//select project
	
	public Project selectProject(int id) {
		Project project = null;
		
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PROJECT_BY_ID);) {
			preparedStatement.setInt(1, id);
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				String code = rs.getString("p_id");
				String imgString = rs.getString("project_img");
				String nameString = rs.getString("proj_name");
				String cateString = rs.getString("proj_category");
				String deString = rs.getString("proj_des");
				double budget = Long.parseLong(rs.getString("proj_budget"));
				
				project = new Project(id, code, imgString, nameString, cateString, deString, budget);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return project;
	}
	
	
	//select projects
	
	public List<Project> selectAllProjects() {

		List<Project> projects = new ArrayList<>();
		
		try (Connection connection = getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_PROJECT);) {
			System.out.println(preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				int id = rs.getInt("id");
				String pcode = rs.getString("p_id");
				String pimgString = rs.getString("project_img");
				String pnameString = rs.getString("proj_name");
				String pcateString = rs.getString("proj_category");
				String pdeString = rs.getString("proj_des");
				double pbudget = Double.parseDouble(rs.getString("proj_budget"));
				
				projects.add(new Project(id, pcode, pimgString, pnameString, pcateString, pdeString, pbudget));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return projects;
	}
	
	//delete project
	public boolean deleteProject(int id) throws SQLException {
		boolean rowDeleted;
		try (Connection connection = getConnection();
				PreparedStatement statement = connection.prepareStatement(DELETE_PROJECT_SQL);) {
			statement.setInt(1, id);
			rowDeleted = statement.executeUpdate() > 0;
		}
		return rowDeleted;
	}

}