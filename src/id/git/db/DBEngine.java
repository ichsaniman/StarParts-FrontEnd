package id.git.db;

import id.git.config.Config;
import id.git.model.Database;
import java.sql.Clob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
//import org.apache.log4j.Logger;

public class DBEngine {
//	static Logger log = Logger.getLogger(DBEngine.class.getName());
	private static Connection conn;
	private static PreparedStatement ps;
	private static ResultSet rs;

	public static Connection getConnection() {
		 Connection conn = null;
		 if(Config.init()) {
	        try {
	        	try {
					Class.forName(Database.getdriver());
					conn = DriverManager.getConnection(Database.getUrl(), Database.getUser(), Database.getPwd());
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	            
//	            System.out.println("Connected to the PostgreSQL server successfully.");
	        } catch (SQLException e) {
	            System.out.println(e.getMessage());
	        }
		 }
	        return conn;
	    }

}