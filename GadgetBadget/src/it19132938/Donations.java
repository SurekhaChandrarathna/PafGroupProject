package it19132938;

public class Donations {
	
	private int donationID;
	private String name;
	private String email;
	private String amount;
	private String cardNumber;
	private String CVC;
	
	public Donations(int donationID, String name, String email, String amount, String cardNumber, String cVC) {
		super();
		this.donationID = donationID;
		this.name = name;
		this.email = email;
		this.amount = amount;
		this.cardNumber = cardNumber;
		CVC = cVC;
	}

	public int getDonationID() {
		return donationID;
	}

	public String getName() {
		return name;
	}

	public String getEmail() {
		return email;
	}

	public String getAmount() {
		return amount;
	}

	public String getCardNumber() {
		return cardNumber;
	}

	public String getCVC() {
		return CVC;
	}
	
	

}
