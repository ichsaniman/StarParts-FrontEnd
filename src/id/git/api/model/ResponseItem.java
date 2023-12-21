package id.git.api.model;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;

public class ResponseItem {
	@JsonProperty("Message")
	private String Message;
	@JsonProperty("Error")
	private int Error;
	@JsonProperty("Data")
	private List<ResponseItemData> Data;
	@JsonProperty("Code")
	private String Code;
	
	public String getMessage() {
		return Message;
	}
	public void setMessage(String message) {
		Message = message;
	}
	public int getError() {
		return Error;
	}
	public void setError(int error) {
		Error = error;
	}
	public List<ResponseItemData> getData() {
		return Data;
	}
	public void setData(List<ResponseItemData> data) {
		Data = data;
	}
	public String getCode() {
		return Code;
	}
	public void setCode(String code) {
		Code = code;
	}
	
	
}
