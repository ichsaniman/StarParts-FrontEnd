package id.git.model;

public class WaModel {
	private String url;
	private String product;
	private String token;
	private String version;
	private String id;
	
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getProduct() {
		return product;
	}
	public void setProduct(String product) {
		this.product = product;
	}
	public String getToken() {
		return token;
	}
	public void setToken(String token) {
		this.token = token;
	}
	public String getVersion() {
		return version;
	}
	public void setVersion(String version) {
		this.version = version;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "WaModel [url=" + url + ", product=" + product + ", token=" + token + ", version=" + version + ", id="
				+ id + "]";
	}
	
	
}
