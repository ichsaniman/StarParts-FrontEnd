package id.git.util;

import java.io.IOException;

import id.git.db.SQLData;
import id.git.model.WaModel;
import okhttp3.Request;
import okhttp3.Response;
import okhttp3.Interceptor.Chain;

public class WaIntercepter   {
	
	public Response interceptor (Chain chain)throws IOException {
		Request request = chain.request();
		WaModel wa = SQLData.getWaParam();
		Request newRequest = request.newBuilder()
				.header("Authorization", "Bearer "+wa.getToken())
				.header("Content-Type", "application/json")
				.build();
		return chain.proceed(newRequest);
		
	}
}
