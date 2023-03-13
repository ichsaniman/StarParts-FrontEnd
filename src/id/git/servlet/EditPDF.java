package id.git.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import id.git.db.SQLData;
import id.git.message.model.Message;

/**
 * Servlet implementation class EditPDF
 */
@MultipartConfig
@WebServlet("/EditPDF")
public class EditPDF extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EditPDF() {
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
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doGet(request, response);
		HttpSession session = request.getSession();
		String id = request.getParameter("id");
		RequestDispatcher rd = null;
		String edit = request.getParameter("contentArea");
//		String edit = request.getParameter("idcontent");
		String user = session.getAttribute("currentUser").toString();
		System.out.println(id);
		System.out.println(edit);
		String result = SQLData.updateContent(id, edit, user);
		String redirectURL = "pdf-configuration.jsp";
//		response.getWriter().write(redirectURL);
//		rd = request.getRequestDispatcher("administration/email-configuration.jsp");
//		response.sendRedirect("administration/email-configuration.jsp");
//		rd.forward(request, response);

		if (result.equals("success")) {
			Message m = new Message("Success Update Content", "success", "success");
			session.setAttribute("msgEditPDFS", m);
			Map<String, String> data = new HashMap<>();
			data.put("redirect", redirectURL);
			String json = new Gson().toJson(data);
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(json);
//			response.sendRedirect("administration/content.jsp");
		} else {
			Message m = new Message("Failed Update Content", "danger", "danger");
			session.setAttribute("msgEditPDF", m);
//			response.sendRedirect("administration/wa-configuration.jsp");
		}
	}

}
