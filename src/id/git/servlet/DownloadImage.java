package id.git.servlet;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;
import java.net.URLConnection;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DownloadImage
 */
@WebServlet("/DownloadImage/*")
public class DownloadImage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String imageFileName = request.getParameter("path");
		String imageFileName = request.getPathInfo();
//				.substring(1);
		System.out.println(request.getRequestURI());
		System.out.println("aa " + imageFileName);
//		String imagePath ="/opt/Estatment/generate/generated/" + imageFileName;
		 File file = new File(imageFileName);
		 OutputStream out = response.getOutputStream();
			response.setContentType("APPLICATION/OCTET-STREAM");
			response.setHeader("Content-Disposition","attachment; filename=\"" + file.getName() + "\"");   
			FileInputStream fileI = new FileInputStream(file);
			System.out.println("ini apa sih "+fileI);
			int i;
			while((i = fileI.read())!=-1) {
				out.write(i);
			}
			fileI.close();
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	
}
