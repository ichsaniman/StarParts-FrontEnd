package id.git.servlet;

import java.io.IOException;
import java.time.Instant;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import id.git.api.service.SendWa;

/**
 * Servlet implementation class SendMessages
 */
@WebServlet("/SendMessages")
public class SendMessages extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendMessages() {
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

}
