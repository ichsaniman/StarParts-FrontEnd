package id.git.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import id.git.db.SQLData;
import id.git.message.model.Message;

/**
 * Servlet implementation class Discounts
 */
@WebServlet("/Discounts")
public class Discounts extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("Sales-Order/discounts.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession sessions = request.getSession();
		String delete = request.getParameter("delete");
		String disable = request.getParameter("disable");
		String active = request.getParameter("active");
//		active
		
		if(request.getParameter("delete") !=null) {
			if(SQLData.deleteDiscount(delete)) {
				Message m = new Message("Discount id "+delete+" has been delete", "success", "success");
				System.out.println("Susccess");
				sessions.setAttribute("dsc", m);
			}else {
				Message m = new Message("Error, please refresh and try again", "danger", "danger");
				System.out.println("Susccess");
				sessions.setAttribute("dsc", m);
			}
		}else if(request.getParameter("disable") !=null) {
			if(SQLData.updateStatus(disable, "Disable")) {
				Message m = new Message("Discount id "+disable+" has been disable", "warning", "warning");
				System.out.println("succes disable");
				sessions.setAttribute("dsc", m);
			}else {
				Message m = new Message("Error, please refresh and try again", "danger", "danger");
				System.out.println("Susccess");
				sessions.setAttribute("dsc", m);
			}
		}else if(request.getParameter("active") !=null) {
			if(SQLData.updateStatus(active, "Active")) {
				Message m = new Message("Discount id "+active+" has been active", "success", "success");
				sessions.setAttribute("dsc", m);
			}else {
				Message m = new Message("Error, please refresh and try again", "danger", "danger");
				System.out.println("Susccess");
				sessions.setAttribute("dsc", m);
			}
		}
		response.sendRedirect("Discounts");
//		doGet(request, response);
	}

}
