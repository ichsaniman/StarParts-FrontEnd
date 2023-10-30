package id.git.servlet;

import java.io.IOException;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import id.git.db.SQLData;
import id.git.message.model.Message;
import id.git.service.DiscountsService;

/**
 * Servlet implementation class CreateDiscounts
 */
@WebServlet("/CreateDiscounts")
public class CreateDiscounts extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		request.getRequestDispatcher("Sales-Order/create-discounts.jsp").forward(request, response);
	}
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		HttpSession sessions = request.getSession();
		List<String> error = new ArrayList<String>();
		String errorM = "The following error \n";
		String name = request.getParameter("discountName");
		System.out.println("1. "+name);
		String amounth = request.getParameter("discountAmounth");
		System.out.println("2. "+amounth);
		String startDate = request.getParameter("discountsStartDate");
		String endDate = request.getParameter("discountsEndDate");
		System.out.println("3. "+startDate +" "+endDate);
		String startTime = request.getParameter("discountsStartTime");
		String endTime = request.getParameter("discountsEndTime");
		System.out.println("4. "+startTime +" "+endTime);
		String type = request.getParameter("discountsType");
		System.out.println("5. "+type);
		System.out.println("6. "+request.getParameter("flexRadioDefault"));
		String rules = request.getParameter("flexRadioDefault");
		String desc = request.getParameter("discountDesc");
		try {
			
		
		if(request.getParameter("discountsType") != null && request.getParameter("flexRadioDefault") != null) {
			String rulesDB = "";
			SimpleDateFormat sdf1 = new SimpleDateFormat("MM-dd-yyyy");
			Date dateStart = sdf1.parse(startDate);
			Date dateEnd = sdf1.parse(endDate);
			SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
			String id = DiscountsService.getDiscountsID();
			if(type.equalsIgnoreCase("Outlet")) {
				if(rules.equals("all")) {
					rulesDB = "";
				}else if(rules.equals("area")) {
					String outletSpesific = request.getParameter("outletSpesific");
					if(!outletSpesific.equals("Select")) {	
						rulesDB = "\"OUTLET_ID\" = '"+outletSpesific+"%'";
					}	
				}else if(rules.equals("spesifik")) {
					String spesificID = request.getParameter("spesificID");
					rulesDB = "\"OUTLET_ID\" = '"+spesificID+"'";
				}

			}else if(type.equalsIgnoreCase("Item")) {
				rulesDB = rules;
			}
			
			if(SQLData.insertDiscounts(id, name, type, java.sql.Date.valueOf(startDate), java.sql.Date.valueOf(endDate), Time.valueOf(startTime), Time.valueOf(endTime))) {
				if(SQLData.insertDetail(id, "Active", rulesDB, amounth+"%", desc)) {
					Message m = new Message("Success Create Discounts", "success", "success");
					System.out.println("Susccess");
					sessions.setAttribute("dsc", m);
				}else {
					SQLData.deleteDiscount(id);
					Message m = new Message("Failed Create Discounts", "danger", "danger");
					sessions.setAttribute("dsc", m);
				}
			}else {
				System.out.println("Masuk Else");
				Message m = new Message("Failed Create Discounts", "danger", "danger");
				sessions.setAttribute("dsc", m);
			}
		}
		else {
			if(request.getParameter("discountsType") == null || type.equals("Select")) {
				String er = "- Discounts Type must be choose\n";
				error.add(er);
			}
			if(request.getParameter("flexRadioDefault") == null) {
				String er = "- Rules must be select\n";
				error.add(er);
			}
			for(String s: error) {
				errorM += s;
			}
			Message m = new Message(errorM, "danger", "danger");
			sessions.setAttribute("dsc", m);
		}
		response.sendRedirect("Discounts");
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
