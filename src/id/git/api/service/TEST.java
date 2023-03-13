package id.git.api.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Set;
import java.util.concurrent.Callable;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import id.git.api.model.ResponseGetCustomer;
import id.git.db.SQLData;

public class TEST {

	public static void main(String[] args) throws InterruptedException, ExecutionException, ParseException {
		// TODO Auto-generated method stub
//		System.out.println(args);
		GetAPIData gap = new GetAPIData();
		HashMap<String, String[]> customer = gap.GetCustomerDataAll();
		Set<String> noCustomer = customer.keySet();
		for(String noCus : noCustomer) {
			String[] customerData = customer.get(noCus);	
			HashMap<String,Object[]> getInvoice = gap.getInvoice(customerData[0]);
			Set<String> no = getInvoice.keySet();
			for(String n :no) {
				System.out.println(n);
				Object[] invo = getInvoice.get(n);
				String tes1 = String.valueOf( invo[4]);
				String tes2 = String.valueOf( invo[8]);
				String tes3 = String.valueOf( invo[9]); 		
				String tes4 = String.valueOf(invo[10]);
				String tes5 = String.valueOf(invo[11]);
				Double tes6 = Double.valueOf(invo[12].toString());
				Double tes7 = Double.valueOf(invo[13].toString());
				Double tes8 = Double.valueOf(invo[14].toString());
				String tes9 = String.valueOf( invo[5]);
				String tes10 = String.valueOf( invo[6]);
				String tes11 = String.valueOf( invo[7]);
				String tes12 = String.valueOf( invo[2]);
				String tes13 = String.valueOf( invo[3]);
				System.out.println(tes1);
				System.out.println(tes2);
				System.out.println(tes3);
				System.out.println(tes4);
				System.out.println(tes5);
				System.out.println(tes6);
				System.out.println(tes7);
				System.out.println(tes8);
				System.out.println(tes9);
				System.out.println(tes10);
				System.out.println(tes11);
				System.out.println(tes12);
				System.out.println("==========");
				System.out.println();
//				SimpleDateFormat sdf = new SimpleDateFormat ("yyyy-mm-dd");
				
//				Date date1 = sdf.parse(tes2);
//				Date date2 = sdf.parse(tes4); 
//				System.out.println(sdf.format(date1));
//				System.out.println("masuk sini "+date1);
				SQLData.insertSTGInvoice(tes1, tes2, tes3,tes4,tes5,tes6,tes7,tes8,tes9,tes10,tes11,tes12,tes13);
//				
			}
		}
		
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
	}

}
