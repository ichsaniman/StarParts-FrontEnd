package id.git.api.model;

import java.util.List;

public class ResponseWa{

	private String messaging_product;

	private List<MessagesItem> messages;

	private List<ContactsItem> contacts;

	

	public String getMessaging_product() {
		return messaging_product;
	}

	public void setMessaging_product(String messaging_product) {
		this.messaging_product = messaging_product;
	}

	public void setMessages(List<MessagesItem> messages){
		this.messages = messages;
	}

	public List<MessagesItem> getMessages(){
		return messages;
	}

	public void setContacts(List<ContactsItem> contacts){
		this.contacts = contacts;
	}

	public List<ContactsItem> getContacts(){
		return contacts;
	}
}