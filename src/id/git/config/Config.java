package id.git.config;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

//import org.apache.log4j.Logger;

//import com.git.config.String;

import id.git.model.Database;

public class Config {
//	private static Logger log = Logger.getLogger(Config.class.getName());
	public static boolean init() {
		boolean ok = true;
		Properties prop = new Properties();
		InputStream is = null;
		try {
			is = Thread.currentThread().getContextClassLoader().getResourceAsStream("config.properties");
			if (is != null) {
				prop.load(is);
			} else {
				ok = false;
			}
		} catch (IOException ioe) {
			ok = false;
			if (is != null) {
				try {
					is.close();
				} catch (IOException localIOException1) {
				}
			}
		} finally {
			if (is != null) {
				try {
					is.close();
				} catch (IOException localIOException2) {
				}

			}
		}
		if((prop != null) && (prop.size() > 0)) {
			Database.setSchema(prop.containsKey("db.schema") ? (String) prop.get("db.schema") : null);
			Database.setUrl(prop.containsKey("db.url") ? (String) prop.get("db.url") : null);
			Database.setUser(prop.containsKey("db.user") ? (String) prop.get("db.user") : null);
			Database.setPwd(prop.containsKey("db.pwd") ? (String) prop.get("db.pwd") : null);
			Database.setdriver(prop.containsKey("db.drive") ? (String) prop.get("db.drive") : null);
		}
		
		
			return true;
		}
		
	}
