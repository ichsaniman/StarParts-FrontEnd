package id.git.model;

import java.io.Serializable;
import java.util.List;

public class Dashboard implements Serializable {
	private final long serialVersionUID = 1L;
	private String date;
	private List<Status> data;
	
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public List<Status> getData() {
		return data;
	}
	public void setData(List<Status> data) {
		this.data = data;
	}
	@Override
	public String toString() {
		return "Dashboard [date=" + date + ", data=" + data + "]";
	}
	
	
	
	

}
