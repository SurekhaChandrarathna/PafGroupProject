package it19132938;

import java.sql.Blob;

public class Projects {
	
	private int ProjectId;
	private String ProjectCode;
	private String ProjectName;
	private Blob image;
	private String Description;
	private String Budget;
	private String Category;
	private String UserEmail;
	
	public Projects(int ProjectId, String ProjectCode, String ProjectName, Blob image, String Description,
			String Budget, String Category,String UserEmail) {
		super();
		this.ProjectId = ProjectId;
		this.ProjectCode = ProjectCode;
		this.ProjectName = ProjectName;
		this.image = image;
		this.Description = Description;
		this.Budget = Budget;
		this.Category = Category;
		this.UserEmail=UserEmail;
		
	}

	public int getProjectId() {
		return ProjectId;
	}

	public String getProjectCode() {
		return ProjectCode;
	}

	public String getProjectName() {
		return ProjectName;
	}

	public Blob getImage() {
		return image;
	}

	public String getDescription() {
		return Description;
	}

	public String getBudget() {
		return Budget;
	}

	public String getCategory() {
		return Category;
	}

	public String getUserEmail() {
		return UserEmail;
	}
	
	
}
