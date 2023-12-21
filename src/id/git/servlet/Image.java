package id.git.servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Image
 */
@WebServlet("/Image/*")
public class Image extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String requestedImageType = request.getRequestURI().substring(request.getRequestURI().lastIndexOf(".") + 1);
		System.out.println(requestedImageType);
		
		// Set the content type based on the image type
        response.setContentType("image/" + requestedImageType);

        // Get the image file path based on the requested URL
        String imageFileName = request.getPathInfo().substring(1); // Remove leading slash
        System.out.println(imageFileName);
        String imagePath = "D:/KERJABLOK/StarParts/issue/" + imageFileName;
        		

        // Read the image file
        try (FileInputStream fis = new FileInputStream(new File(imagePath));
             OutputStream os = response.getOutputStream()) {

            // Write the image to the response output stream
            byte[] buffer = new byte[1024];
            int bytesRead;
            while ((bytesRead = fis.read(buffer)) != -1) {
                os.write(buffer, 0, bytesRead);
            }
        } catch (IOException e) {
            // Handle exceptions, log or return an error response as needed
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */

}
