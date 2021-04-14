package it19132938;


@SuppressWarnings("unused")
public class FundRequests {
	
	private int RequestId;
	private String UserEmail;
	private String ProjectID;
	
	
	public FundRequests(int requestId, String userEmail, String projectID) {
		super();
		RequestId = requestId;
		UserEmail = userEmail;
		ProjectID = projectID;
	}
	
	public int getRequestId() {
		return RequestId;
	}
	public void setRequestId(int requestId) {
		RequestId = requestId;
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
	
	
	
	

}
