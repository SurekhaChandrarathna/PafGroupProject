package it19155494;

public class Project {
	
	private int id;
	private String pcode;
	private String img;
	private String pname;
	private String category;
	private String description;
	private double budget;
	
	
	public Project(int id, String pcode, String img, String pname, String category, String description, Double budget) {
		super();
		this.id = id;
		this.pcode = pcode;
		this.img = img;
		this.pname = pname;
		this.category = category;
		this.description = description;
		this.budget = budget;
	}
	
	
	public Project(String pcode, String img, String pname, String category, String description, Double budget) {
		super();
		this.pcode = pcode;
		this.img = img;
		this.pname = pname;
		this.category = category;
		this.description = description;
		this.budget = budget;
	}


	public int getId() {
		return id;
	}
	public String getPcode() {
		return pcode;
	}
	public String getImg() {
		return img;
	}
	public String getPname() {
		return pname;
	}
	public String getCategory() {
		return category;
	}
	public String getDescription() {
		return description;
	}
	public Double getBudget() {
		return budget;
	}
	public void setId(int id) {
		this.id = id;
	}
	public void setPcode(String pcode) {
		this.pcode = pcode;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public void setBudget(Double budget) {
		this.budget = budget;
	}

}
