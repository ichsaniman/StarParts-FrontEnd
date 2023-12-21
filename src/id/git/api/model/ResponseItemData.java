package id.git.api.model;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;

public class ResponseItemData {
	@JsonProperty("ProductInfo")
	private List<ResponseItemProductInfo> ProductInfo;

	@JsonProperty("Stock")
	private List<ResponseItemStock> Stock;
	
	@JsonProperty("CategoryTree")
	private List<ResponseItemCategory> CategoryTree;
	
	public List<ResponseItemProductInfo> getProductInfo() {
		return ProductInfo;
	}

	public void setProductInfo(List<ResponseItemProductInfo> productInfo) {
		ProductInfo = productInfo;
	}

	public List<ResponseItemStock> getStock() {
		return Stock;
	}

	public void setStock(List<ResponseItemStock> stock) {
		Stock = stock;
	}
	
	
	
}
