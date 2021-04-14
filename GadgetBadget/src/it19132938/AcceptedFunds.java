package it19132938;
@SuppressWarnings("unused")

public class AcceptedFunds {
	
	private int FundId;
	private String UserEmail;
	private String ProjectID;
	private double fundingAmount;
	
	public AcceptedFunds(int fundId, String userEmail, String projectID, double fundingAmount) {
		super();
		FundId = fundId;
		UserEmail = userEmail;
		ProjectID = projectID;
		this.fundingAmount = fundingAmount;
	}

	public int getFundId() {
		return FundId;
	}

	public void setFundId(int fundId) {
		FundId = fundId;
	}

	public String getUserEmail() {
		return UserEmail;
	}

	public void setUserEmail(String userEmail) {
		UserEmail = userEmail;
	}

	public String getProjectID() {
		return ProjectID;
	}

	public void setProjectID(String projectID) {
		ProjectID = projectID;
	}

	public double getFundingAmount() {
		return fundingAmount;
	}

	public void setFundingAmount(double fundingAmount) {
		this.fundingAmount = fundingAmount;
	}
	
	
	

}
