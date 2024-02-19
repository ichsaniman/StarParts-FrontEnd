package id.git.servlet;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import id.git.api.model.ResponseTriggerWebhookModel;
import id.git.endpoint.ListChatEndpoint;

/**
 * Servlet implementation class TriggerFromWebhook
 */
@WebServlet("/TriggerFromWebhook")
public class TriggerFromWebhook extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ResponseTriggerWebhookModel rtw = new ResponseTriggerWebhookModel();
		rtw.setMessage("Triggered");
		rtw.setStatus(true);
		ListChatEndpoint.handleDatabaseChange();
		String json = new Gson().toJson(rtw);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(json);
	}


}
