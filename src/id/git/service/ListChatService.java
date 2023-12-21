package id.git.service;

import java.text.SimpleDateFormat;
import java.time.Instant;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import id.git.db.SQLData;
import id.git.model.ListChatDataModel;
import id.git.model.ListChatModel;

public class ListChatService {
	public static String getListChat(){
		String result = "";
		ListChatModel main = new ListChatModel();
		List<ListChatDataModel> data = new ArrayList<ListChatDataModel>();
		List<String[]> getChat = SQLData.getChatList();
		for(int i = 0; i < getChat.size(); i++){
			ListChatDataModel lMain = new ListChatDataModel();
			List<String[]> lates = SQLData.getLatestChat(getChat.get(i)[0]);
			String[] late = lates.get(0);
    		int no = SQLData.getCountChatNotRead(getChat.get(i)[0]);
    		List<String[]> dateChat = SQLData.getDateChat(getChat.get(i)[0]);
    		System.out.println(getChat.get(0)[1]);
    		long unix = Long.parseLong(dateChat.get(0)[3]);
    		Instant instant = Instant.ofEpochSecond(unix);
    		Date date1 = Date.from(instant);
    		SimpleDateFormat sdf1 = new SimpleDateFormat("dd/MM/yyyy");
    		lMain.setPhone(getChat.get(i)[0]);
    		lMain.setFrom(late[0]);
    		lMain.setDate(sdf1.format(date1));
    		
    		 if(late[0].equals("Admin")){
    			 lMain.setMessages("<i class='fas fa-check-double'></i> "+late[4]);
         	}else{
      			
      			System.out.println("masuk else");
      			System.out.println(late[2]);
      			List<String[]> latestMessages = SQLData.getLatestMessage(late[2]);
      			String[]mess = latestMessages.get(0);
      			if(mess[3].equalsIgnoreCase("text")){
      				System.out.println("masuk if");
      				lMain.setMessages( latestMessages.get(0)[4]);
      			}else if(mess[3].equalsIgnoreCase("document")){
      				lMain.setMessages("<i class='fas fa-file'></i> "+mess[7]);
      			}else if(mess[3].equalsIgnoreCase("image")){
      				lMain.setMessages("<i class='far fa-image'></i> Image");
      			}
      			
      			if(no >= 0) {
      				lMain.setCount("<span class='badge bg-danger rounded-pill float-end'>"+no+"</span>");
      			}
      		}
    		 data.add(lMain);
    		 
		}
		main.setData(data);
		 try {
	            ObjectMapper objectMapper = new ObjectMapper();
	            result = objectMapper.writeValueAsString(main);
	            System.out.println("JSON representation: " + result);
	        } catch (JsonProcessingException e) {
	            e.printStackTrace();
	        }
		
		return result;
	}
	
}
