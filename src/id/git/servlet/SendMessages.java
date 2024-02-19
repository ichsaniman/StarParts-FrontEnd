package id.git.servlet;

import java.io.IOException;
import java.time.Instant;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import id.git.api.service.SendWa;

@WebServlet("/SendMessages")
public class SendMessages extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SendMessages() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		System.out.println(request.getParameter("messages"));
		System.out.println(request.getParameter("phone"));
		String msg = request.getParameter("messages");
		String phone = request.getParameter("phone");
		SendWa wa = new SendWa();
		
//		System.out.println(unix);
		boolean result = wa.sendWa(phone, msg);
		System.out.println(result);
		//		doGet(request, response);
	}
	
//	 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//	        String messageType = request.getParameter("messageType");
//	        String phone = request.getParameter("phone");
//	        SendWa wa = new SendWa();
//	        
//	        if (messageType.equals("text")) {
//	            String msg = request.getParameter("messages");
//	            boolean result = wa.sendWa(phone, msg);
//	            System.out.println("text "+result);
//	        } else if (messageType.equals("document")) {
//	            String path = request.getParameter("path");
//	            String filename = request.getParameter("fileName");
//	            String caption = request.getParameter("caption");
//	            boolean result = wa.sendDocument(phone, path, filename, caption);
//	            System.out.println("document" + result);
//	        }
//	    }

}
