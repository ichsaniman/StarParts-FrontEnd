package id.git.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import id.git.db.SQLData;
import id.git.message.model.Message;

/**
 * Servlet implementation class EditParamGenerate
 */
@WebServlet("/EditParamGenerate")
public class EditParamGenerate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EditParamGenerate() {
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
		String START_TIME = request.getParameter("START_TIME");
		String END_TIME = request.getParameter("FINISH_TIME");
		String START_DATE = request.getParameter("START_DATE");
		String END_DATE = request.getParameter("FINISH_DATE");
		String source = request.getParameter("source");
		String path = request.getParameter("path");
		Map<String, String> mp = new HashMap<String, String>();
		mp.put("START TIME", START_TIME);
		mp.put("END TIME", END_TIME);
		mp.put("START DATE", START_DATE);
		mp.put("END DATE", END_DATE);
		mp.put("pdf.source.file", source);
		mp.put("pdf.path.report", path);
		RequestDispatcher rd = null;
		String redirectURL = "generate-pdf.jsp";
		List<String> stats = new ArrayList<String>();

		for (Entry<String, String> pair : mp.entrySet()) {
			String value = pair.getValue();
			String key = pair.getKey();
			System.out.println("Key: " + key);
			System.out.println("value: " + value);
			String result = SQLData.updateParameterGenerate(key, value);
			System.out.println(result);
			if (result.equals("success")) {
				stats.add(result);
			} else {
				stats.add("");
			}
		}
		if (stats.contains("success")) {
			Message m = new Message("Success Update Content", "success", "success");
			session.setAttribute("msgEditGen", m);

//			response.sendRedirect("administration/content.jsp");
		} else {
			Message m = new Message("Failed Update Content", "danger", "danger");
			session.setAttribute("msgEditGen", m);
//			response.sendRedirect("administration/wa-configuration.jsp");
		}
		Map<String, String> data = new HashMap<>();
		data.put("redirect", redirectURL);
		String json = new Gson().toJson(data);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(json);
	}

}
