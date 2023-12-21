package id.git.api.model;

import com.fasterxml.jackson.annotation.JsonProperty;

public class ResponseItemStock {
	@JsonProperty("WhsCode")
	private String WhsCode;
	
	@JsonProperty("Quantity")
    private String Quantity;
    
	@JsonProperty("SKU")
	private String SKU;

	public String getWhsCode() {
		return WhsCode;
	}

	public void setWhsCode(String whsCode) {
		WhsCode = whsCode;
	}

	public String getQuantity() {
		return Quantity;
	}

	public void setQuantity(String quantity) {
		Quantity = quantity;
	}

	public String getSKU() {
		return SKU;
	}

	public void setSKU(String sKU) {
		SKU = sKU;
	}
	
	
}
