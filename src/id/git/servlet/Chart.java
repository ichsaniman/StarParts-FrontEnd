package id.git.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Set;
import java.util.TreeMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import id.git.db.SQLData;

/**
 * Servlet implementation class Chart
 */
@WebServlet("/Chart")
public class Chart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		TreeMap<String, HashMap<String, Integer>> tree = SQLData.getChart();
		System.out.println(tree);
		Set<String> period = tree.keySet();
		List<String> indexA = new ArrayList<String>();
		for(String pr : period) {
			System.out.println(tree.get(pr).size());
			Set<String> status = tree.get(pr).keySet();
			for(String st : status) {
				if(tree.get(pr).size() == 1 ) {
					if(st.equals("Y")) {
						tree.get(pr).put("R", 0);
					}else {
						tree.get(pr).put("Y", 0);
					}
					
				}
				
			}
			indexA.add(pr);
		}
		int index = 0;
		if(indexA.size() > 6) {
			index = indexA.size() - 6;
		}
		String in = indexA.get(index);
		Set<String> pEx = tree.keySet();
		JsonArray mainA = new JsonArray();
		JsonObject main = new JsonObject();
		
		for(String i : pEx) {
			JsonObject headO = new JsonObject();
			JsonArray headA = new JsonArray();
			Set<String> sEx = tree.get(i).keySet();
			for(String e : sEx) {
				JsonObject dataO = new JsonObject();
				int total = tree.get(i).get(e);
				dataO.addProperty("Status", e);
				dataO.addProperty("Total", total);
				headA.add(dataO);
			}
			headO.addProperty("Date", i);
			headO.add("data", headA);
			mainA.add(headO);
		}
		main.addProperty("min", in);
		main.add("dataMain", mainA);
		String result = main.toString();
		System.out.println(result);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(result);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
