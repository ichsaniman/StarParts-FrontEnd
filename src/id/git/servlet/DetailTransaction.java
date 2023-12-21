package id.git.servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import id.git.db.SQLData;
import id.git.service.ExcelService;

/**
 * Servlet implementation class DetailTransaction
 */
@WebServlet("/DetailTransaction")
public class DetailTransaction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
			String id = request.getParameter("id");
			request.getRequestDispatcher("Sales-Order/transaction-detail.jsp?id="+id+"").forward(request, response);
			
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		HttpSession sessions = request.getSession();
		String id = request.getParameter("orderId");
		System.out.println(id);
		
		List<String[]> getOrder = SQLData.getOrderDetail(id);
		List<String[]> getOutlet = SQLData.getOuletDetail(getOrder.get(0)[0]);
		if(request.getParameter("download")!=null) {
			ExcelService es = new ExcelService();
			String path = es.generateExcel(id, getOrder.get(0)[1], getOrder.get(0)[2], getOutlet.get(0)[1], getOrder.get(0)[3]);
			File file = new File(path);
			String fileName = file.getName();
			OutputStream out = response.getOutputStream();
			response.setContentType("APPLICATION/OCTET-STREAM");
			response.setHeader("Content-Disposition","attachment; filename=\"" + fileName + "\"");   
			FileInputStream fileI = new FileInputStream(path);
			int i;
			while((i = fileI.read())!=-1) {
				out.write(i);
			}
			fileI.close();
		}else if(request.getParameter("prosses") != null) {
			String status = getOrder.get(0)[4];
			String res = "";
			if(status.equals("Pending")) {
				res = SQLData.updateOrder(id, "On Progress");
			}else if(status.equals("On Progress")) {
				res = SQLData.updateOrder(id, "Success");
			}
			response.sendRedirect("Transaction");
		}
	}

}
