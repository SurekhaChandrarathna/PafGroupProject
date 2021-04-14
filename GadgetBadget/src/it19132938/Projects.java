package it19132938;

import java.sql.Blob;

public class Projects {
	
	private int ProjectId;
	private String ProjectCode;
	private String ProjectName;
	private Blob image;
	private String Desccription;
	private String Budget;
	private String Category;
	
	public Projects(int projectId, String projectCode, String projectName, Blob image, String desccription,
			String budget, String category) {
		super();
		ProjectId = projectId;
		ProjectCode = projectCode;
		ProjectName = projectName;
		this.image = image;
		Desccription = desccription;
		Budget = budget;
		Category = category;
	}

	public int getProjectId() {
		return ProjectId;
	}

	public void setProjectId(int projectId) {
		ProjectId = projectId;
	}

	public String getProjectCode() {
		return ProjectCode;
	}

	public void setProjectCode(String projectCode) {
		ProjectCode = projectCode;
	}

	public String getProjectName() {
		return ProjectName;
	}

	public void setProjectName(String projectName) {
		ProjectName = projectName;
	}

	public Blob getImage() {
		return image;
	}

	public void setImage(Blob image) {
		this.image = image;
	}

	public String getDesccription() {
		return Desccription;
	}

	public void setDesccription(String desccription) {
		Desccription = desccription;
	}

	public String getBudget() {
		return Budget;
	}

	public void setBudget(String budget) {
		Budget = budget;
	}

	public String getCategory() {
		return Category;
	}

	public void setCategory(String category) {
		Category = category;
	}
	
	
	
	
	
}
