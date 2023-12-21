package id.git.api.model;

import com.fasterxml.jackson.annotation.JsonProperty;

public class ResponseItemProductInfo {
	@JsonProperty("Description")
	private String Description;
	
	@JsonProperty("IsActive")
	private String IsActive;
	
	@JsonProperty("CreateDate")
	private String CreateDate;
	
	@JsonProperty("Weight")
	private int Weight;
	
	@JsonProperty("SubBrandName")
	private String SubBrandName;
	
	@JsonProperty("Name")
	private String Name;
	
	@JsonProperty("Brand")
	private String Brand;
	
	@JsonProperty("UpdateDate")
	private String UpdateDate;
	
	@JsonProperty("UOM")
	private String UOM;
	
	@JsonProperty("SellItem")
	private String SellItem;
	
	@JsonProperty("SubBrandId")
	private String SubBrandId;
	
	@JsonProperty("Price")
	private String Price;
	
	@JsonProperty("Length")
	private String Length;
	
	@JsonProperty("Volume")
	private String Volume;
	
	@JsonProperty("MinimumBuyQty")
	private String MinimumBuyQty;
	
	@JsonProperty("Height")
	private String Height;
	
	@JsonProperty("SKU")
	private String SKU;
	
	@JsonProperty("Width")
	private String Width;
	
	public String getDescription() {
		return Description;
	}
	public void setDescription(String description) {
		Description = description;
	}
	public String getIsActive() {
		return IsActive;
	}
	public void setIsActive(String isActive) {
		IsActive = isActive;
	}
	public String getCreateDate() {
		return CreateDate;
	}
	public void setCreateDate(String createDate) {
		CreateDate = createDate;
	}
	public int getWeight() {
		return Weight;
	}
	public void setWeight(int weight) {
		Weight = weight;
	}
	public String getSubBrandName() {
		return SubBrandName;
	}
	public void setSubBrandName(String subBrandName) {
		SubBrandName = subBrandName;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public String getBrand() {
		return Brand;
	}
	public void setBrand(String brand) {
		Brand = brand;
	}
	public String getUpdateDate() {
		return UpdateDate;
	}
	public void setUpdateDate(String updateDate) {
		UpdateDate = updateDate;
	}
	public String getUOM() {
		return UOM;
	}
	public void setUOM(String uOM) {
		UOM = uOM;
	}
	public String getSellItem() {
		return SellItem;
	}
	public void setSellItem(String sellItem) {
		SellItem = sellItem;
	}
	public String getSubBrandId() {
		return SubBrandId;
	}
	public void setSubBrandId(String subBrandId) {
		SubBrandId = subBrandId;
	}
	public String getPrice() {
		return Price;
	}
	public void setPrice(String price) {
		Price = price;
	}
	
	public String getLength() {
		return Length;
	}
	public void setLength(String length) {
		Length = length;
	}
	public String getVolume() {
		return Volume;
	}
	public void setVolume(String volume) {
		Volume = volume;
	}
	public String getMinimumBuyQty() {
		return MinimumBuyQty;
	}
	public void setMinimumBuyQty(String minimumBuyQty) {
		MinimumBuyQty = minimumBuyQty;
	}
	public String getHeight() {
		return Height;
	}
	public void setHeight(String height) {
		Height = height;
	}
	public String getSKU() {
		return SKU;
	}
	public void setSKU(String sKU) {
		SKU = sKU;
	}
	public String getWidth() {
		return Width;
	}
	public void setWidth(String width) {
		Width = width;
	}
	
	
}
