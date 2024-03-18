package id.git.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.json.JSONObject;

import id.git.db.SQLData;
import id.git.message.model.Message;
import okhttp3.FormBody;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;




/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Logger log = Logger.getLogger(Login.class.getName());
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doGet(request, response);
//		System.out.println(ap);
		 response.setContentType("text/html");
		 String username = request.getParameter("username");
		 String pass = request.getParameter("password");
		 String btn = request.getParameter("sign");
		 System.out.println("test btn: "+btn);
		 HttpSession session = request.getSession();
		 RequestDispatcher rd = null;
		 System.out.println(username);
		 System.out.println(pass);
		 if(username.equals(null)||username.equals("")||username.equals(" ")) {
			 Message m = new Message("Please Fill username", "error", "danger");
		 		session.setAttribute("msgLogin",m );
//		 		rd = request.getRequestDispatcher("index.jsp");
		 		response.sendRedirect("index.jsp");
		 		System.out.println("Failed Login");
		 }else if(pass.equals(null)||pass.equals("")||pass.equals(" ")) {
			 Message m = new Message("Please Fill Password ", "error", "danger");
		 		session.setAttribute("msgLogin",m );
//		 		rd = request.getRequestDispatcher("index.jsp");
		 		response.sendRedirect("index.jsp");
		 		System.out.println("Failed Login");
		 }
		 else {
			String token = null;
	        OkHttpClient client = new OkHttpClient();

	        RequestBody formBody = new FormBody.Builder()
	                .add("client_id", "testing")
	                .add("grant_type", "password")
	                .add("username", username)
	                .add("password", pass)
	                .add("scope", "openid")
	                .add("client_secret", "TeBs5pF0HKOMDSHXQuP11ETlQASchLfL")
	                .build();

	        Request request1 = new Request.Builder()
	                .url("http://192.168.3.169:8080/realms/splunk/protocol/openid-connect/token")
	                .post(formBody)
	                .build();

	        try (Response response1 = client.newCall(request1).execute()) {
	            if (response1.isSuccessful()) {
	                String responseBody = response1.body().string();
	                JSONObject jsonResponse = new JSONObject(responseBody);

	                // Extract the value of the key
	                token = jsonResponse.getString("access_token");
	                Cookie cookie = new Cookie("token", token);
	                // Set the cookie's lifespan (in seconds)
	                cookie.setMaxAge(3600); // 1 hour

	                // Add the cookie to the response
	                response.addCookie(cookie);
			 		session.setAttribute("currentUser",username );
			 		System.out.println("username Login:	"+username);
			 		response.sendRedirect("Home");
	            } else {
//	                System.out.println("Request failed. HTTP code: " + response1.code());
//	                System.out.println(response1.message());
//	                token = "error";
	            	System.out.println("yang ini bukan");
	            	Message m = new Message(response1.message(), "error", "danger");
			 		session.setAttribute("msgLogin",m );
			 		rd = request.getRequestDispatcher("index.jsp");
			 		response.sendRedirect("index.jsp");
			 		System.out.println("Failed Login");
			 		rd.include(request, response);
	            }
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
			 
//			 boolean check = SQLData.getUserLogin(username, pass);
//
//		 	//System.out.println(rs.next());
//		 	
//		 	if(check == true){
//		 		session.setAttribute("currentUser",username );
//		 		System.out.println("username Login:	"+username);
////		 		rd = request.getRequestDispatcher("home.jsp");
//		 		response.sendRedirect("Home");
////		 		rd.forward(request, response);
//		 	}
//		 	else{
//		 		Message m = new Message("Username/password Incorrect", "error", "danger");
//		 		session.setAttribute("msgLogin",m );
//		 		rd = request.getRequestDispatcher("index.jsp");
//		 		response.sendRedirect("index.jsp");
//		 		System.out.println("Failed Login");
//		 		rd.include(request, response);
//		 	}
//		 
////		 	rd.forward(request, response);
		 	
		 
	 }
	}

}
