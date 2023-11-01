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
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import id.git.db.SQLData;
import id.git.message.model.Message;




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
			 
			 boolean check = SQLData.getUserLogin(username, pass);

		 	//System.out.println(rs.next());
		 	
		 	if(check == true){
		 		session.setAttribute("currentUser",username );
		 		System.out.println("username Login:	"+username);
//		 		rd = request.getRequestDispatcher("home.jsp");
		 		response.sendRedirect("Home");
//		 		rd.forward(request, response);
		 	}
		 	else{
		 		Message m = new Message("Username/password Incorrect", "error", "danger");
		 		session.setAttribute("msgLogin",m );
		 		rd = request.getRequestDispatcher("index.jsp");
		 		response.sendRedirect("index.jsp");
		 		System.out.println("Failed Login");
		 		rd.include(request, response);
		 	}
		 
//		 	rd.forward(request, response);
		 	
		 
	 }
	}

}
