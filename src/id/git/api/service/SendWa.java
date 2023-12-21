package id.git.api.service;

import java.time.Instant;

import com.fasterxml.jackson.databind.ObjectMapper;

import id.git.api.model.ResponseWa;
import id.git.db.SQLData;
import id.git.model.WaModel;
import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;

public class SendWa {
	public boolean sendWa(String to, String messages) {
		boolean result = false;
		
		try {
			WaModel wa = SQLData.getWaParam();
			OkHttpClient client = new OkHttpClient().newBuilder().build();
			MediaType mediaType = MediaType.parse("application/json");
			String url = wa.getUrl()+"/"+wa.getVersion()+"/"+wa.getId()+"/";
			StringBuilder sb = new StringBuilder();
			sb.append("{");
			sb.append("\"messaging_product\": \"" + wa.getProduct() + "\",");
			sb.append("\"to\": \"" + to + "\",");
			sb.append("\"recipient_type\": \"individual\",");
			sb.append("\"type\": \"text\",");
			sb.append("\"text\": {");
			sb.append("\"body\": \""+messages+"\"");
			sb.append("}");
			sb.append("}");
			RequestBody body = RequestBody.create(mediaType, sb.toString());
			Request request = new Request.Builder().url(url+"messages").method("POST", body)
					.addHeader("Authorization", "Bearer "+wa.getToken()).build();
			Response res= client.newCall(request).execute();
			String responseRes = res.body().string();
			System.out.println(responseRes);
			if(!responseRes.contains("error")) {
				ObjectMapper om = new ObjectMapper();
				ResponseWa rw = om.readValue(responseRes, ResponseWa.class);
				long unix = Instant.now().getEpochSecond();
				SQLData.insertLogChat(rw.getMessages().get(0).getId(), to, messages, unix);
				result =true;
			}
		}catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return result;
	}
}
