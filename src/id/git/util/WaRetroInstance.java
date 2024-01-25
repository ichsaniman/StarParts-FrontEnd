package id.git.util;

import java.util.concurrent.TimeUnit;

import okhttp3.Interceptor;
import okhttp3.OkHttpClient;
import retrofit2.Retrofit;
import retrofit2.converter.gson.GsonConverterFactory;

public class WaRetroInstance {
	private static Retrofit retrofit;
	
	public static Retrofit getRetrofitClient() {
		if(retrofit ==null) {
			retrofit = new Retrofit.Builder()
					.baseUrl("")
					.addConverterFactory(GsonConverterFactory.create())
					.client(new OkHttpClient().newBuilder()
							.addInterceptor(new Interceptor())
							.connectTimeout(100, TimeUnit.SECONDS)
							.readTimeout(100, TimeUnit.SECONDS)
							.build()).build();
					
		}
		return retrofit;
	}
}
