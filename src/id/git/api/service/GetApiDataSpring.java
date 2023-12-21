package id.git.api.service;

import com.fasterxml.jackson.databind.ObjectMapper;

import id.git.api.model.ResponseItem;
import okhttp3.Call;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;

public class GetApiDataSpring {
	public static ResponseItem getItem(String id) {
		ResponseItem ri = new ResponseItem();
		try {
			OkHttpClient client = new OkHttpClient().newBuilder().build();
			String url  = "http://192.168.3.183:8080/item/sku?sku="+id;
			Request request = new Request.Builder().url(url).build();
			Call call = client.newCall(request);
			Response response = call.execute();
			String res = response.body().string();
			ObjectMapper om = new ObjectMapper();
			ri = om.readValue(res, ResponseItem.class);
		}catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return ri;
	}
}
