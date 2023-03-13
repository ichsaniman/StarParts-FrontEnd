package id.git.servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class customerpdf
 */
@WebServlet("/customerpdf")
public class customerpdf extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public customerpdf() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		String download = request.getParameter("download");
		String downAll = request.getParameter("downAll");
		 if(request.getParameter("download")!=null) {
			 System.out.println(download);
			 String filetmp = request.getParameter("filePath");
			 System.out.println(filetmp);
			 File file = new File(filetmp);
			 String fileName = file.getName();
			 String pathtmp = file.getPath();
			 String path = pathtmp.replace(fileName, "");
			 System.out.println(path);
			 System.out.println(fileName);
			 OutputStream out = response.getOutputStream();
			 response.setContentType("APPLICATION/OCTET-STREAM");
				response.setHeader("Content-Disposition","attachment; filename=\"" + fileName + "\"");   
			FileInputStream fileInputStream=new FileInputStream(path+fileName);
			 int i;   
			  while ((i=fileInputStream.read()) != -1) {  
			    out.write(i);   
			  }   
			  fileInputStream.close();   
		}else if(request.getParameter("downAll")!=null) {
			System.out.println(downAll);
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		RequestDispatcher rd = null;
		String reGen = request.getParameter("regenerate");
		String download = request.getParameter("download");
		String reGenall = request.getParameter("reGenAll");
		String downAll = request.getParameter("downAll");
		System.out.println(reGen);
		System.out.println(download);
		System.out.println(reGenall);
		System.out.println(downAll);
		if(request.getParameter("regenerate")!=null) {
			
		}else if(request.getParameter("download")!=null) {
			doGet(request, response);
			
		}else if(request.getParameter("reGenAll")!=null) {
			
		}else if(request.getParameter("downAll")!=null) {
			doGet(request, response);
		}
		
	}

}
