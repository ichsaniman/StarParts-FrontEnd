package id.git.api.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Set;
import java.util.TreeMap;
import java.util.concurrent.Callable;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import id.git.api.model.ResponseGetCustomer;
import id.git.db.DBEngine;
import id.git.db.SQLData;
import id.git.model.Dashboard;
import id.git.model.Status;
import id.git.model.WaModel;
import id.git.service.DiscountsService;
import id.git.util.Function;

public class TEST {

	public static void main(String[] args) throws InterruptedException, ExecutionException, ParseException, SQLException {
		// TODO Auto-generated method stub
		
		WaModel wa = SQLData.getWaParam();
		System.out.println(wa.toString());
//		System.out.println(args);
//		GetAPIData gad = new GetAPIData();
//		HashMap<String, String[]> ListCustomer = gad.GetCustomerDataAll();
//		Set<String> id = ListCustomer.keySet();
//		for (String n : id) {
//			String[] data = ListCustomer.get(n);
//			String oid = data[0];
//			String name = data[1];
//			String email = data[2];
//			String phone = data[3];
//			if (phone.contains("-"))
//				phone = phone.replace("-", "").trim();
//			if (phone.startsWith("0"))
//				phone = phone.replace("0", "62");
//			System.out.println(oid + " " + name + " " + email + " " + phone);
//			boolean check1 = SQLData.checkoutlet(oid, name);
//			if (check1 == true) {
//				boolean check2 = SQLData.checkoutletDetail(oid, name, email, phone);
//				if (check2 == false) {
//					String update = SQLData.updateOutletT(oid, name, email, phone);
//					System.out.println(update +" "+oid+" "+" "+name+" "+email +" "+phone);
//				}
//			} else if (check1 == false) {
//				String result = SQLData.insertOutlet(oid, name, email, phone);
//				System.out.println(result +" "+oid+" "+" "+name+" "+email +" "+phone);
//			}
//		}
		
		//ke stg ini
		
//		GetAPIData gad = new GetAPIData();
//		String id = "KRW005813";
//		HashMap<String, Object[]> invoice = gad.getInvoice(id);
//		Set<String> no = invoice.keySet();
//		for(String n :no) {
//			System.out.println(n);
//			Object[] invo = invoice.get(n);
//			String tes1 = String.valueOf( invo[4]);
//			String tes2 = String.valueOf( invo[8]);
//			String tes3 = String.valueOf( invo[9]); 		
//			String tes4 = String.valueOf(invo[10]);
//			String tes5 = String.valueOf(invo[11]);
//			Double tes6 = Double.valueOf(invo[12].toString());
//			Double tes7 = Double.valueOf(invo[13].toString());
//			Double tes8 = Double.valueOf(invo[14].toString());
//			String tes9 = String.valueOf( invo[5]);
//			String tes10 = String.valueOf( invo[6]);
//			String tes11 = String.valueOf( invo[7]);
//			String tes12 = String.valueOf( invo[2]);
//			String tes13 = String.valueOf( invo[3]);
//			System.out.println(tes1);
//			SQLData.insertSTGInvoice(tes1, tes2, tes3,tes4,tes5,tes6,tes7,tes8,tes9,tes10,tes11,tes12,tes13);
//			
//		}
//		TreeMap<String, HashMap<String, Integer>> tmp = SQLData.getChart();
//		
//		Set<String> period = tmp.keySet();
//		List<String> indexA = new ArrayList<String>();
//		for(String pr : period) {
//			System.out.println(tmp.get(pr).size());
//			Set<String> status = tmp.get(pr).keySet();
//			for(String st : status) {
//				if(tmp.get(pr).size() == 1 ) {
//					if(st.equals("Y")) {
//						tmp.get(pr).put("R", 0);
//					}else {
//						tmp.get(pr).put("Y", 0);
//					}
//					
//				}
//			}
//			
//			indexA.add(pr);
//			
//		}
//		int index = 0;
//		if(indexA.size() > 5) {
//			index = indexA.size() - 5;
//		}
//		String in = indexA.get(index);
//		
//		Set<String> pEx = tmp.keySet();
//		JsonArray mainA = new JsonArray();
//		JsonObject main = new JsonObject();
//		
//		for(String i : pEx) {
//			JsonObject headO = new JsonObject();
//			JsonArray headA = new JsonArray();
//			Set<String> sEx = tmp.get(i).keySet();
//			for(String e : sEx) {
//				JsonObject dataO = new JsonObject();
//				int total = tmp.get(i).get(e);
//				dataO.addProperty("Status", e);
//				dataO.addProperty("Total", total);
//				headA.add(dataO);
//			}
//			headO.addProperty("Date", i);
//			headO.add("data", headA);
//			mainA.add(headO);
//		}
//		main.addProperty("min", in);
//		main.add("data", mainA);
//		System.out.println(main);
//		System.out.println("ini index: "+in);
//		System.out.println();
//		System.out.println(tmp);
//		String t1 = "73";
//		Double t2 = Double.valueOf(t1);
//		System.out.println(t2);
		
//		System.out.println(tmp);
//		System.out.println(tmp.size());
////		System.out.println(tmp.get(1));
//		
//		String period1 = Function.getPeriod();
//		
//		String month = period1.substring(0,2);
//		
//		System.out.println(month);
//		
//		SimpleDateFormat sdf = new SimpleDateFormat("MMyyyy");
//		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM");
//		Date date = sdf.parse(period1);
//		System.out.println(sdf1.format(date));
//		System.out.println();
//		Calendar c = Calendar.getInstance();
////		System.out.println(c.get(c.MONTH)+10);
//		
//		
//		System.out.println();//bikin get index 0 sama 5
//		int loop = 313;
//		List<Integer> t1 = new ArrayList<Integer>();
//		for(int i = 1; i < loop; i++) {
//			t1.add(i);
//		}
//		int tmp1 = 0;
//		int tmp2= t1.size() /2;
//		int tmp3 = tmp2;
//		int tmp4 = t1.size();
//		for(int k = tmp1; k < tmp2; k++) {
//			System.out.print(t1.get(k)+" - ");
//		}
//		System.out.println();
//		for(int l = tmp3; l < tmp4; l++) {
//			System.out.print(t1.get(l)+" - ");
//		}
//		System.out.println();
//		System.out.println(tmp1+" "+tmp2+" "+tmp3+" "+tmp4);
//		System.out.println(t1);
		
//		List<String[]> getDiscotunts = SQLData.getDiscountsAll();
//		System.out.println(Arrays.asList(getDiscotunts.get(0)));
//		System.out.println("dari sini: "+ DiscountsService.getDiscountsID());
	}
	

}
