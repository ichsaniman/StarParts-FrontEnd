package id.git.servlet;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import id.git.db.SQLData;
import id.git.message.model.Message;

/**
 * Servlet implementation class EditPDF
 */
@MultipartConfig
@WebServlet("/EditPDFbck")
public class EditPDFbck extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EditPDFbck() {
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
		response.setContentType("text/plain;charset=UTF-8");
		HttpSession session = request.getSession();
		String id = request.getParameter("idcontent");
		RequestDispatcher rd = null;
		System.out.println(id);
		Part part = request.getPart("fileImage");
		String fileName = part.getSubmittedFileName();

		Map<String, String> param = SQLData.getParameter();
		String upload = param.get("pdf.source.path");
		File dir = new File(upload);
		if (!dir.exists()) {
			dir.mkdirs();
		}
		System.out.println(fileName);
//        System.out.println(part);

		String tmpcheck = request.getParameter("fileImage");
		System.out.println(tmpcheck);
//        System.out.println(request.getPart("fileImage"));
		if (request.getParameter("fileImage") != null && !tmpcheck.isEmpty()) {
			InputStream is = part.getInputStream();
			String fileTMP = "";
			if (id.equals("CID001")) {
				fileTMP = "logo.jpg";

			} else if (id.equals("CID004")) {
				fileTMP = "tengah.jpg";
			} else if (id.equals("CID005")) {
				fileTMP = "footer.jpg";
			}
			System.out.println(fileTMP);
			Files.copy(is, Paths.get(upload + fileTMP), StandardCopyOption.REPLACE_EXISTING);
			String result = SQLData.updateContentImage(id, upload + fileName);
			System.out.println(result);

			Message m = new Message("Success Update Content", "success", "success");
			session.setAttribute("msgEditPDFS", m);
			rd = request.getRequestDispatcher("administration/pdf-configuration.jsp");
			response.sendRedirect("administration/pdf-configuration.jsp");

		} else {
			Message m = new Message("please choose file first", "danger", "danger");
			session.setAttribute("msgEditPDF", m);
			System.out.println("apa di sini");
			rd = request.getRequestDispatcher("administration/edit-pdf-configuration.jsp?contentID=" + id + "");
			response.sendRedirect("administration/edit-pdf-configuration.jsp?contentID=" + id + "");
		}

	}

}
