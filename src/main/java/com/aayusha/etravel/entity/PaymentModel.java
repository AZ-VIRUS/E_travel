package com.aayusha.etravel.entity;

public class PaymentModel {
	
	private double amount;
	private double taxAmount;
	private double totalAmount;
	private String transaction_uuid;
	private String productCode;
	private double psc;
	private double pdc;
	private String success_url;
	private String failure_url;
	private String signedFiledNames;
	private String signature;
	
	public PaymentModel() {
		super();
	}

	public PaymentModel(double amount, double taxAmount, double totalAmount, String transaction_uuid,
			String productCode, double psc, double pdc, String success_url, String failure_url, String signedFiledNames,
			String signature) {
		super();
		this.amount = amount;
		this.taxAmount = taxAmount;
		this.totalAmount = totalAmount;
		this.transaction_uuid = transaction_uuid;
		this.productCode = productCode;
		this.psc = psc;
		this.pdc = pdc;
		this.success_url = success_url;
		this.failure_url = failure_url;
		this.signedFiledNames = signedFiledNames;
		this.signature = signature;
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

	public double getTaxAmount() {
		return taxAmount;
	}

	public void setTaxAmount(double taxAmount) {
		this.taxAmount = taxAmount;
	}

	public double getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(double totalAmount) {
		this.totalAmount = totalAmount;
	}

	public String getTransaction_uuid() {
		return transaction_uuid;
	}

	public void setTransaction_uuid(String transaction_uuid) {
		this.transaction_uuid = transaction_uuid;
	}

	public String getProductCode() {
		return productCode;
	}

	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}

	public double getPsc() {
		return psc;
	}

	public void setPsc(double psc) {
		this.psc = psc;
	}

	public double getPdc() {
		return pdc;
	}

	public void setPdc(double pdc) {
		this.pdc = pdc;
	}

	public String getSuccess_url() {
		return success_url;
	}

	public void setSuccess_url(String success_url) {
		this.success_url = success_url;
	}

	public String getFailure_url() {
		return failure_url;
	}

	public void setFailure_url(String failure_url) {
		this.failure_url = failure_url;
	}

	public String getSignedFiledNames() {
		return signedFiledNames;
	}

	public void setSignedFiledNames(String signedFiledNames) {
		this.signedFiledNames = signedFiledNames;
	}

	public String getSignature() {
		return signature;
	}

	public void setSignature(String signature) {
		this.signature = signature;
	}

	
}
