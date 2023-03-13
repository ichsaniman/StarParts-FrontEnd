package id.git.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import id.git.api.service.GetAPIData;


public class GetUser {
	
	
	public static void main(String[]args) {
		GetAPIData gad = new GetAPIData();
		HashMap<String, String[]> test  = gad.GetCustomerDataAll();
		System.out.println(test);
	}
}
