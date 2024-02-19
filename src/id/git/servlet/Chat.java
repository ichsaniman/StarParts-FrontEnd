package id.git.servlet;

import java.io.IOException;
import java.math.BigInteger;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import id.git.db.SQLData;
import id.git.model.ResponseChatDetailModel;
import id.git.model.ResponseChatModel;

/**
 * Servlet implementation class Chat
 */
@WebServlet("/Chat")
public class Chat extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
   

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String phone = request.getParameter("phone");
		System.out.println(phone);
		ResponseChatModel body = new ResponseChatModel();
		List<ResponseChatDetailModel> bodyMessages = new ArrayList<ResponseChatDetailModel>();
		List<String[]> getChat = SQLData.getChat(phone);
		SimpleDateFormat sdf1 = new SimpleDateFormat("HH:mm | dd MMM");
		String res = SQLData.updateChatCount(phone);
		System.out.println(res);
		for(int i = 0; i < getChat.size(); i++) {
			ResponseChatDetailModel rcdm = new ResponseChatDetailModel();
			String from = getChat.get(i)[0];
			long unix = Long.parseLong(getChat.get(i)[3]);
			Instant instant = Instant.ofEpochSecond(unix);
			Date date1 = Date.from(instant);
			
//			if(from.equalsIgnoreCase("admin")) {
//				rcdm.setFrom(from);
//				rcdm.setDate(sdf1.format(date1));
//				rcdm.setMessages(getChat.get(i)[4]);
//				bodyMessages.add(rcdm);
//			} else {
				List<String[]> message = SQLData.getLatestMessage(getChat.get(i)[2]);
				String type = message.get(0)[3];
				System.out.println(message.get(0)[4]);
				if(type.equalsIgnoreCase("text")) {
					rcdm.setFrom(from);
					rcdm.setDate(sdf1.format(date1));
					rcdm.setMessages(message.get(0)[4]);
					rcdm.setType(message.get(0)[3]);
					bodyMessages.add(rcdm);
				}else if(type.equalsIgnoreCase("document")) {
					rcdm.setFrom(from);
					rcdm.setDate(sdf1.format(date1));
					rcdm.setMessages(message.get(0)[4]);
					rcdm.setType(message.get(0)[3]);
					rcdm.setPath(message.get(0)[8]);
					rcdm.setFilename(message.get(0)[7]);
					rcdm.setCaption(message.get(0)[5]);
					bodyMessages.add(rcdm);
				}else if(type.equalsIgnoreCase("image")) {
					rcdm.setFrom(from);
					rcdm.setDate(sdf1.format(date1));
					rcdm.setMessages(message.get(0)[4]);
					rcdm.setType(message.get(0)[3]);
					rcdm.setPath(message.get(0)[8]);
					rcdm.setCaption(message.get(0)[5]);
					bodyMessages.add(rcdm);
//				}
			}
		}
		body.setData(bodyMessages);
		String json = new Gson().toJson(body);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(json);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	
}
