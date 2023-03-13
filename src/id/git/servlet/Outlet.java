package id.git.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import id.git.api.service.GetAPIData;
import id.git.db.SQLData;
import id.git.message.model.Message;

/**
 * Servlet implementation class Outlet
 */
@WebServlet("/Outlet")
public class Outlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Outlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String fromAPI = request.getParameter("fromAPI");
		System.out.println("Botton From api: " + fromAPI);
		String toAPI = request.getParameter("toAPI");
		System.out.println("Botton To api: " + toAPI);
		List<String> updateU = new ArrayList<String>();
		List<String> insertU = new ArrayList<String>();
		if (request.getParameter("fromAPI") != null) {
			GetAPIData gad = new GetAPIData();
			HashMap<String, String[]> ListCustomer = gad.GetCustomerDataAll();
			Set<String> id = ListCustomer.keySet();
			for (String n : id) {
				String[] data = ListCustomer.get(n);
				String oid = data[0];
				String name = data[1];
				String email = data[3];
				String phone = data[2];
				if (phone.contains("-"))
					phone = phone.replace("-", "").trim();
				if (phone.startsWith("0"))
					phone = phone.replace("0", "62");
				System.out.println(oid + " " + name + " " + email + " " + phone);
				boolean check1 = SQLData.checkoutlet(oid, name);
				if (check1 == true) {
					boolean check2 = SQLData.checkoutletDetail(oid, name, email, phone);
					if (check2 == false) {
						String update = SQLData.updateOutletT(oid, name, email, phone);
						if (update.equals("success")) {
							updateU.add(update);
						}
					}
				} else if (check1 == false) {
					String result = SQLData.insertOutlet(oid, name, email, phone);
					if (result.equals("success")) {
						insertU.add(result);
					}
				}
			}
			Message m = new Message("Success sync Oultet", "success", "success");
			session.setAttribute("msgOutlet", m);
			response.sendRedirect("administration/user-management.jsp");
		}
	}

}
