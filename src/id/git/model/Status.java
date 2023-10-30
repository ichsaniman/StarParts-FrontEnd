package id.git.model;

import java.io.Serializable;

public class Status implements Serializable {
	private final long serialVersionUID = 1L;
	private String status;
	private int total;
	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	
	
}
