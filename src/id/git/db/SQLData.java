package id.git.db;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.TreeMap;

import id.git.model.WaModel;

public class SQLData {
	
	public static String updateChatCount(String from) {
		String result = "false";
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DBEngine.getConnection();

			String sql = "UPDATE \"SP_MESSAGE_LOG\" SET  \"MESSAGE_LOG_STATUS\"='' WHERE \"MESSAGE_LOG_FROM\" = ?";
			// log.info("sql=" + sql);
			ps = conn.prepareStatement(sql);
			ps.setString(1, from);
			
			int i = ps.executeUpdate();
			if (i > 0) {
				result = "success";
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
				if (ps != null) {
					ps.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	public static List<String[]> getDateChat(String phone){
		String sql="SELECT  \"MESSAGE_LOG_FROM\",  \"MESSAGE_LOG_TO\", \"MESSAGE_LOG_ID\",\"MESSAGE_LOG_TIMESTAMP\" , \"MESSAGE_LOG_MESSAGES\" "
				+"FROM \"SP_MESSAGE_LOG\" "
				+"WHERE \"MESSAGE_LOG_FROM\" = '"+phone+"' OR \"MESSAGE_LOG_TO\" = '"+phone+"' ORDER BY \"MESSAGE_LOG_TIMESTAMP\" DESC ";
		return execute(sql);
	}
	public static boolean insertLogChat(String id, String to, String messages, long unix) {
		boolean result = false;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DBEngine.getConnection();

			String sql = "INSERT INTO \"SP_MESSAGE_LOG\" (\"MESSAGE_LOG_ID\", \"MESSAGE_LOG_FROM\", \"MESSAGE_LOG_TO\", \"MESSAGE_LOG_STATUS\", \"MESSAGE_LOG_TIMESTAMP\", \"MESSAGE_LOG_MESSAGES\") "
					+ "VALUES('"+id+"', 'Admin', '"+to+"', 'Sended', "+unix+", '"+messages+"')";
			// log.info("sql=" + sql);
			System.out.println("ini sql "+sql);
			ps = conn.prepareStatement(sql);
			int i = ps.executeUpdate();
			if (i > 0) {
				result = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
				if (ps != null) {
					ps.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	public static boolean insertChat(String id, String to, String messages, long unix) {
		boolean result = false;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DBEngine.getConnection();

			String sql = "INSERT INTO \"SP_MESSAGES\" (\"MESSAGE_ID\", \"MESSAGE_FROM\", \"MESSAGE_TO\", \"MESSAGE_TIMESTAMP\", \"MESSAGE_BODY\", \"MESSAGE_TYPE\") "
					+ "VALUES('"+id+"', 'Admin', '"+to+"', "+unix+", '"+messages+"', 'text')";
			// log.info("sql=" + sql);
			System.out.println("ini sql chat "+sql);
			ps = conn.prepareStatement(sql);
			int i = ps.executeUpdate();
			if (i > 0) {
				result = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
				if (ps != null) {
					ps.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	public static boolean deleteMessageLog() {
		boolean result = false;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DBEngine.getConnection();

			String sql = "DELETE FROM \"SP_MESSAGE_LOG\""
					+ "WHERE NOT EXISTS ("
					+ "SELECT 1 FROM \"SP_MESSAGES\""
					+ "WHERE \"SP_MESSAGE_LOG\".\"MESSAGE_LOG_TIMESTAMP\" = \"SP_MESSAGES\".\"MESSAGE_TIMESTAMP\");";
			// log.info("sql=" + sql);
			System.out.println("ini sql chat "+sql);
			ps = conn.prepareStatement(sql);
			int i = ps.executeUpdate();
			if (i > 0) {
				result = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
				if (ps != null) {
					ps.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	public static List<String[]> getInvoiceInformation(int logId) {
        List<String[]> invoiceInfoList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DBEngine.getConnection();

            String sql = "SELECT \"CUSTOMER_ID\", \"LOG_GENERATE_DATE\", \"LOG_STATUS\", \"LOG_MESSAGE\", \"LOG_PATH_PDF\", \"LOG_PERIOD\", \"LOG_INVOICE\" "
                    + "FROM \"SP_LOG\" WHERE \"LOG_ID\" = ?";
            
            ps = conn.prepareStatement(sql);
            ps.setInt(1, logId);

            rs = ps.executeQuery();

            while (rs.next()) {
                String customerId = rs.getString("CUSTOMER_ID");
                String generateDate = rs.getString("LOG_GENERATE_DATE");
                String status = rs.getString("LOG_STATUS");
                String message = rs.getString("LOG_MESSAGE");
                String pdfPath = rs.getString("LOG_PATH_PDF");
                String period = rs.getString("LOG_PERIOD");
                String invoice = rs.getString("LOG_INVOICE");

                String[] invoiceInfo = {customerId, generateDate, status, message, pdfPath, period, invoice};
                invoiceInfoList.add(invoiceInfo);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (conn != null) {
                    conn.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (rs != null) {
                    rs.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return invoiceInfoList;
    }
	
//	public static boolean insertLogDocument(String id, String to, String path, long unix, String filename, String caption) {
//		boolean result = false;
//		Connection conn = null;
//		PreparedStatement ps = null;
//		ResultSet rs = null;
//		try {
//			conn = DBEngine.getConnection();
//
//			String sql = "INSERT INTO \"SP_MESSAGES\" (\"MESSAGE_ID\", \"MESSAGE_FROM\", \"MESSAGE_TO\", \"MESSAGE_PATH\", \"MESSAGE_TIMESTAMP\", \"MESSAGE_FILENAME\", \"MESSAGE_CAPTION\", \"MESSAGE_TYPE\") "
//					+ "VALUES('"+id+"', 'Admin', '"+to+"', '"+path+"', "+unix+", '"+filename+"', '"+caption+"', 'document')";
//			System.out.println(sql);
//			ps = conn.prepareStatement(sql);
//			int i = ps.executeUpdate();
//			if (i > 0) {
//				result = true;
//			}
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			try {
//				if (conn != null) {
//					conn.close();
//				}
//				if (ps != null) {
//					ps.close();
//				}
//				if (rs != null) {
//					rs.close();
//				}
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//		}
//		return result;
//	}
	
	public static WaModel getWaParam() {
		WaModel wa = new WaModel();
		Connection conn = DBEngine.getConnection();
		
		String sql = "SELECT \"parameter_Name\", \"parameter_Value\" FROM \"parameter\"";
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			HashMap<String, String> param = new HashMap<String, String>();
 			ps = conn.prepareStatement(sql);			
			rs = ps.executeQuery();
			while (rs.next()) {
				param.put(rs.getString(1), rs.getString(2));
			}
			wa.setId(param.get("wa.id"));
			wa.setUrl(param.get("wa.url"));
			wa.setProduct(param.get("wa.product"));
			wa.setToken(param.get("wa.token"));
			wa.setVersion(param.get("wa.version"));
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println(e.getMessage());
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
				if (ps != null) {
					ps.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return wa;
	}
	public static List<String[]> getChat(String phone){
		String sql = "SELECT  \"MESSAGE_LOG_FROM\",  \"MESSAGE_LOG_TO\", \"MESSAGE_LOG_ID\",\"MESSAGE_LOG_TIMESTAMP\" , \"MESSAGE_LOG_MESSAGES\" "
				+"FROM \"SP_MESSAGE_LOG\" "
				+"WHERE \"MESSAGE_LOG_FROM\" = '"+phone+"' OR \"MESSAGE_LOG_TO\" = '"+phone+"'  "
				+"ORDER BY \"MESSAGE_LOG_TIMESTAMP\" ASC";
		return execute(sql);
	}
//	get outlet name
	public static List<String[]> getOutletName(String phone){
		String sql = "SELECT \"OUTLET_ID\" , \"OUTLET_NAME\" "
				+"FROM \"SP_OUTLET\" "
				+"WHERE \"OUTLET_PHONE\" = '"+phone+"'";
		return execute(sql);
	}
	public static List<String[]> getLatestMessage(String id){
		String sql ="SELECT * FROM \"SP_MESSAGES\" WHERE \"MESSAGE_ID\" = '"+id+"'";
		return execute(sql);
	}
	public static List<String[]> getLatestChat(String phone){
		String sql="SELECT  \"MESSAGE_LOG_FROM\",  \"MESSAGE_LOG_TO\", \"MESSAGE_LOG_ID\",\"MESSAGE_LOG_TIMESTAMP\" , \"MESSAGE_LOG_MESSAGES\" "
				+"FROM \"SP_MESSAGE_LOG\" "
				+"WHERE \"MESSAGE_LOG_FROM\" = '"+phone+"' OR \"MESSAGE_LOG_TO\" = '"+phone+"' ORDER BY \"MESSAGE_LOG_TIMESTAMP\" DESC ";
		return execute(sql);
	}
	public static int getCountChatNotRead(String phone) {
		int result = 0;
		Connection conn = DBEngine.getConnection();
		String sql = "SELECT COUNT(\"MESSAGE_LOG_ID\") FROM \"SP_MESSAGE_LOG\" WHERE \"MESSAGE_LOG_FROM\" ='"+phone+"' AND \"MESSAGE_LOG_STATUS\" ='Recived' ";
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = conn.prepareStatement(sql);
			
			rs = ps.executeQuery();
			while (rs.next()) {
				result = rs.getInt(1);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println(e.getMessage());
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
				if (ps != null) {
					ps.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	public static List<String[]> getChatList(){
		String sql = "SELECT \"LIVE_PHONE\", \"LIVE_TIMESTAMP\" "
				+"FROM \"SP_LIVE_CHAT\" ORDER BY \"LIVE_TIMESTAMP\" DESC";
		return execute(sql);
	}
	
//	UPDATE "SP_ORDER" SET "ORDER_CUSTOMER_ID"='', "ORDER_TOTAL_PRICE"='', "ORDER_DATE"='', "ORDER_TIME"='', "ORDER_STATUS"='' WHERE "ORDER_ID"='';
	public static String updateOrder(String id, String status) {
		String result = "";
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DBEngine.getConnection();

			String sql = "UPDATE \"SP_ORDER\" SET  \"ORDER_STATUS\"=? WHERE \"ORDER_ID\"=?";
			// log.info("sql=" + sql);
			ps = conn.prepareStatement(sql);
			ps.setString(1, status);
			ps.setString(2, id);
			
			int i = ps.executeUpdate();
			if (i > 0) {
				result = "success";
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
				if (ps != null) {
					ps.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	public static List<String[]> getOrderDetail(String id) {
		String sql = "SELECT \"ORDER_CUSTOMER_ID\",\"ORDER_DATE\", \"ORDER_TIME\", \"ORDER_TOTAL_PRICE\",\"ORDER_STATUS\" "
				+"FROM \"SP_ORDER\" WHERE \"ORDER_ID\" ='"+id+"'";
		return execute(sql);
	}
	
	public static List<String[]> getDetailItemTRX(String id){
		String sql = "SELECT \"ORDER_DETAIL_ITEM\" , \"ORDER_DETAIL_QTY\" , \"ORDER_DETAIL_PRICE\" "
				+"FROM \"SP_ORDER_DETAIL\" "
				+"WHERE \"ORDER_ID\" = '"+id+"'";
		return execute(sql);
	}
	
	public static String[] executeArrys(String sql) {
		String[] resultList = null;
		Connection conn = DBEngine.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		if (conn != null) {
			try {
				ps = conn.prepareStatement(sql);
				rs = ps.executeQuery();
				if (!rs.next()) {
					System.out.println("no data found");
				} else {
					int columnCount = rs.getMetaData().getColumnCount();
					do {
						String[] row = new String[columnCount];
						for (int i = 0; i < row.length; ++i) {
//							System.out.println(rs.getString(i + 1));
							
							row[i] = String.valueOf(rs.getString(i + 1));
						}
						resultList = row;
					}

					while (rs.next());
					System.out.println("[OK] " + resultList.length +" Column");

				}
			} catch (SQLException e) {
				e.printStackTrace();
//				System.out.println(e.getMessage());
			} finally {
				try {
					rs.close();
					ps.close();
					conn.close();
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}
			}
		}
		return resultList;
	}
	
	public static List<String[]> getDetailDiscount(String id){
		List<String[]> result = new ArrayList<String[]>();
		System.out.println("masuk detail");
		List<String> discount = getOrderDiscounts(id);
		for(String d1 : discount) {			
			String sql = "SELECT sd.\"DISCOUNTS_ID\", sd.\"DISCOUNTS_NAME\", sdd.\"DISCOUNTS_DETAIL_AMMOUNT\" "
					+"FROM \"SP_DISCOUNTS\" sd "
					+"JOIN \"SP_DISCOUNTS_DETAIL\" sdd ON sd.\"DISCOUNTS_ID\" = sdd.\"DISCOUNTS_ID\" "
					+"WHERE sd.\"DISCOUNTS_ID\" = '"+d1+"'";
			System.out.println(sql);
			String[] row = executeArrys(sql);
			if(row != null) {
				result.add(row);				
			}
		}
		System.out.println("[OK] " + result.size() +" Row");
		return result;
	}
	public static List<String> getOrderDiscounts(String id) {
		List<String> result = new ArrayList<String>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DBEngine.getConnection();

			String sql = "SELECT \"DISCOUNTS_ID\" FROM \"SP_ORDER_DETAIL_DISCOUNTS\" WHERE \"ORDER_ID\" = ?";
			// log.info("sql=" + sql);
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			while(rs.next()) {
				result.add(rs.getString(1));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
				if (ps != null) {
					ps.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	public static  List<String[]> getOuletDetail(String id){
		String sql = "SELECT so.\"OUTLET_ID\",so.\"OUTLET_NAME\", so.\"OUTLET_PHONE\", so.\"OUTLET_ADDRESS\",  st.\"TYPE_NAME\", st.\"TYPE_PERCENTAGE\" "
				+"FROM \"SP_OUTLET\" so "
				+"JOIN \"SP_TYPE_OUTLET\" st ON so.\"OUTLET_TYPE\" = st.\"TYPE_ID\" "
				+"WHERE \"OUTLET_ID\" = '"+id+"'";
		return execute(sql);
	}
	
	public static  List<String[]> getOrder(String id){
		String sql = "SELECT \"ORDER_ID\" , \"ORDER_DATE\", \"ORDER_TIME\", \"ORDER_STATUS\", \"ORDER_CUSTOMER_ID\" FROM \"SP_ORDER\" WHERE \"ORDER_ID\" = '"+id+"'";
		return execute(sql);
	}
	
	public static List<String[]> transactionAll(){
		String sql = "SELECT so.\"ORDER_ID\", so.\"ORDER_DATE\", so.\"ORDER_TIME\", sot.\"OUTLET_NAME\", so.\"ORDER_TOTAL_PRICE\", so.\"ORDER_STATUS\" FROM \"SP_ORDER\" so "
				+"JOIN \"SP_OUTLET\" sot ON so.\"ORDER_CUSTOMER_ID\" = sot.\"OUTLET_ID\" "
				+"ORDER BY so.\"ORDER_DATE\" DESC, so.\"ORDER_TIME\" DESC ";
		return execute(sql);
	}
	
	public static boolean updateStatus(String id, String status) {
		boolean result = false;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DBEngine.getConnection();

			String sql = "UPDATE \"SP_DISCOUNTS_DETAIL\" SET \"DISCOUNTS_DETAIL_STATUS\"='"+status+"' WHERE \"DISCOUNTS_ID\"= '"+id+"'";
			// log.info("sql=" + sql);
			ps = conn.prepareStatement(sql);
			int i = ps.executeUpdate();
			if (i > 0) {
				result = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
				if (ps != null) {
					ps.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	public static List<String[]> getDiscounts(String id){
		String sql ="SELECT ds.\"DISCOUNTS_ID\", ds.\"DISCOUNTS_NAME\", ds.\"DISCOUNTS_START_DATE\",ds.\"DISCOUNTS_EXPIRED_DATE\", ds.\"DISCOUNTS_START_TIME\", ds.\"DISCOUNTS_EXPIRED_TIME\", sdd.\"DISCOUNTS_DETAIL_AMMOUNT\" "
				+"FROM \"SP_DISCOUNTS\" AS ds JOIN \"SP_DISCOUNTS_DETAIL\" AS sdd ON ds.\"DISCOUNTS_ID\" = sdd.\"DISCOUNTS_ID\" WHERE ds.\"DISCOUNTS_ID\" = '"+id+"'";
		return execute(sql);
	}
	public static boolean deleteDiscount(String id) {
		boolean result = false;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DBEngine.getConnection();

			String sql = "DELETE FROM \"SP_DISCOUNTS\" WHERE \"DISCOUNTS_ID\"=?";
			// log.info("sql=" + sql);
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			
			int i = ps.executeUpdate();
			if (i > 0) {
				result = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
				if (ps != null) {
					ps.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	public static boolean insertDetail(String id,String status, String rules, String amounth, String detail) {
		boolean result = false;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DBEngine.getConnection();

			String sql = "INSERT INTO \"SP_DISCOUNTS_DETAIL\" ( \"DISCOUNTS_ID\", \"DISCOUNTS_DETAIL_STATUS\", \"DISCOUNTS_DETAIL_RULES\", \"DISCOUNTS_DETAIL_AMMOUNT\", \"DISCOUNT_DETAIL_DESCRIPTION\") VALUES( ?, ?, ?, ?, ?)";
			// log.info("sql=" + sql);
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, status);
			ps.setString(3, rules);
			ps.setString(4, amounth);
			ps.setString(5, detail);
			int i = ps.executeUpdate();
			if (i > 0) {
				result = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
				if (ps != null) {
					ps.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	public static boolean insertDiscounts(String id, String name, String type, Date StartDate, Date endDate, Time startTime, Time endTime) {
		boolean result = false;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DBEngine.getConnection();

			String sql = "INSERT INTO \"SP_DISCOUNTS\" (\"DISCOUNTS_ID\", \"DISCOUNTS_NAME\", \"DISCOUNTS_TYPE\", \"DISCOUNTS_START_DATE\", \"DISCOUNTS_EXPIRED_DATE\", \"DISCOUNTS_START_TIME\", \"DISCOUNTS_EXPIRED_TIME\") VALUES(?, ?, ?, ?, ?, ?, ?)";
			// log.info("sql=" + sql);
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, name);
			ps.setString(3, type);
			ps.setDate(4, StartDate);
			ps.setDate(5, endDate);
			ps.setTime(6, startTime);
			ps.setTime(7, endTime);
			int i = ps.executeUpdate();
			if (i > 0) {
				result = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
				if (ps != null) {
					ps.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	public static List<String[]> getOutletCode(){
		String sql = "SELECT * FROM \"SP_OUTLET_CODE\"";
		return execute(sql);
	}
	public static boolean checkDiscountID(String id) {
		boolean result = false;
		Connection conn = DBEngine.getConnection();
		String sql = "SELECT * FROM \"SP_DISCOUNTS\" WHERE \"DISCOUNTS_ID\" = ?";
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if (rs.next()) {
				result = true;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println(e.getMessage());
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
				if (ps != null) {
					ps.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	public static List<String[]> getDiscountsAll(){
		String sql = "SELECT ds.\"DISCOUNTS_ID\", ds.\"DISCOUNTS_NAME\", ds.\"DISCOUNTS_TYPE\",  ds.\"DISCOUNTS_START_DATE\",ds.\"DISCOUNTS_EXPIRED_DATE\", "
				+"ds.\"DISCOUNTS_START_TIME\", ds.\"DISCOUNTS_EXPIRED_TIME\",sdd.\"DISCOUNT_DETAIL_DESCRIPTION\",  sdd.\"DISCOUNTS_DETAIL_AMMOUNT\", sdd.\"DISCOUNTS_DETAIL_STATUS\" "
				+"FROM \"SP_DISCOUNTS\" AS ds "
				+"JOIN \"SP_DISCOUNTS_DETAIL\" AS sdd ON ds.\"DISCOUNTS_ID\" = sdd.\"DISCOUNTS_ID\"";
		return execute(sql);
	}
	public static int customerCount() {
		int result = 0;
		Connection conn = DBEngine.getConnection();
		String sql = "SELECT COUNT(\"OUTLET_ID\") FROM \"SP_OUTLET\";";
		PreparedStatement ps = null;
		System.out.println(sql);
		ResultSet rs = null;
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				result = rs.getInt(1);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println(e.getMessage());
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
				if (ps != null) {
					ps.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	public static TreeMap<String, HashMap<String, Integer>> getChart() {
		TreeMap<String, HashMap<String, Integer>> result = new TreeMap<String, HashMap<String,Integer>>();
		Connection conn = DBEngine.getConnection();
		String sql = "SELECT COUNT(\"CUSTOMER_ID\") , \"LOG_STATUS\", \"LOG_GENERATE_DATE\" FROM (SELECT DISTINCT \"CUSTOMER_ID\", \"LOG_GENERATE_DATE\" ,\"LOG_STATUS\"FROM \"SP_LOG\"  WHERE \"LOG_STATUS\" !='N' AND \"LOG_MESSAGE\" !='Ready to Send') as tmp GROUP BY \"LOG_GENERATE_DATE\" ,  \"LOG_STATUS\" ORDER BY \"LOG_GENERATE_DATE\" ";
		PreparedStatement ps = null;
		System.out.println(sql);
		ResultSet rs = null;
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				int total = rs.getInt(1);
				String status = rs.getString(2);
				String date = rs.getString(3);
				String period = date.substring(0,7);
				System.out.println("query: "+period);
				if(result.containsKey(period)){
					if(result.get(period).containsKey(status)) {
						int tmp1 = result.get(period).get(status);
						tmp1 += total;
						result.get(period).put(status, tmp1);
					}else {
						result.get(period).put(status, total);						
					}
				}else {
					result.put(period, new HashMap<String, Integer>());
					result.get(period).put(status, total);
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println(e.getMessage());
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
				if (ps != null) {
					ps.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	public static int getUserRole(String username) {
		int result = 0;
		Connection conn = DBEngine.getConnection();
		String sql = "SELECT \"USER_ROLE\" FROM \"SP_USER\"  WHERE \"USER_USERNAME\" = '"+username+"'";
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			if (rs.next()) {
				result = rs.getInt("USER_ROLE");
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println(e.getMessage());
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
				if (ps != null) {
					ps.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	public static String insertOutlet(String id, String name, String email, String phone) {
		String result = "";
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DBEngine.getConnection();

			String sql = "INSERT INTO \"SP_OUTLET\" (\"OUTLET_ID\", \"OUTLET_NAME\", \"OUTLET_EMAIL\", \"OUTLET_PHONE\") VALUES(?, ?, ?, ?)";
			// log.info("sql=" + sql);
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, name);
			ps.setString(3, email);
			ps.setString(4, phone);
			int i = ps.executeUpdate();
			if (i > 0) {
				result = "success";
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
				if (ps != null) {
					ps.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}

	public static String updateOutletT(String id, String name, String email, String phone) {
		String result = "";
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DBEngine.getConnection();

			String sql = "UPDATE \"SP_OUTLET\" SET  \"OUTLET_EMAIL\"=?, \"OUTLET_PHONE\"=? WHERE \"OUTLET_ID\"=?AND \"OUTLET_NAME\" =?";
			// log.info("sql=" + sql);
			ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, phone);
			ps.setString(3, id);
			ps.setString(4, name);
			int i = ps.executeUpdate();
			if (i > 0) {
				result = "success";
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
				if (ps != null) {
					ps.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}

	public static boolean checkoutletDetail(String id, String name, String email, String phone) {
		boolean result = false;
		Connection conn = DBEngine.getConnection();
		String sql = "SELECT * FROM  \"SP_OUTLET\" WHERE \"OUTLET_ID\" =? AND \"OUTLET_NAME\" = ? AND \"OUTLET_EMAIL\" =? AND \"OUTLET_PHONE\" =?";
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, name);
			ps.setString(3, email);
			ps.setString(4, phone);
			rs = ps.executeQuery();
			if (rs.next()) {
				result = true;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println(e.getMessage());
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
				if (ps != null) {
					ps.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}

	public static boolean checkoutlet(String id, String name) {
		boolean result = false;
		Connection conn = DBEngine.getConnection();
		String sql = "SELECT * FROM  \"SP_OUTLET\" WHERE \"OUTLET_ID\" =? AND \"OUTLET_NAME\" = ?";
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, name);
			rs = ps.executeQuery();
			if (rs.next()) {
				result = true;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println(e.getMessage());
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
				if (ps != null) {
					ps.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}

	public static List<String[]> getOutlet() {
		String sql = "SELECT * FROM  \"SP_OUTLET\"";
		return execute(sql);
	}

	public static String updateParameterGenerate(String key, String value) {
		String result = "";
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DBEngine.getConnection();

			String sql = "UPDATE \"parameter\" SET \"parameter_Value\" = ? WHERE \"parameter_Name\" = ?";
			// log.info("sql=" + sql);
			ps = conn.prepareStatement(sql);
			ps.setString(1, value);
			ps.setString(2, key);
			int i = ps.executeUpdate();
			if (i > 0) {
				result = "success";
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
				if (ps != null) {
					ps.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}

	public static List<String[]> getHistory(String type) {
		String sql = "SELECT \"LOG_SCH_SD\", \"LOG_SCH_FD\", \"LOG_SCH_TOTAL\", \"LOG_SCH_SUC\", \"LOG_SCH_FAIL\" FROM \"SP_LOG_SCH\" WHERE "
				+ "\"LOG_SCH_TYPE\" = '" + type + "' ORDER BY \"LOG_SCH_SD\" DESC";
		return execute(sql);
	}

	public static Integer getGeneretaePeriod(String period) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Integer result = 0;
		try {
			conn = DBEngine.getConnection();
			String sql1 = "SELECT COUNT(\"CUSTOMER_ID\") FROM (SELECT DISTINCT \"CUSTOMER_ID\", \"LOG_PERIOD\"FROM  "
					+ "\"SP_LOG\"  WHERE \"LOG_STATUS\" !='N' AND \"LOG_PERIOD\"='" + period + "') as tmp ";
			System.out.println(sql1);
			ps = conn.prepareStatement(sql1);
			rs = ps.executeQuery();
			while (rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e.getMessage());
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
				if (ps != null) {
					ps.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}

	public static String updateContent(String id, String value, String name) {
		String result = "";
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DBEngine.getConnection();

			String sql = "UPDATE \"content\" SET content_d =? ,modified_by ='" + name + "', last_modified='"
					+ java.sql.Date.valueOf(java.time.LocalDate.now()) + "' WHERE content_id=?;";
			// log.info("sql=" + sql);
			System.out.println(sql);
			ps = conn.prepareStatement(sql);
			ps.setString(1, value);
			ps.setString(2, id);
			int i = ps.executeUpdate();
			System.out.println("dari db " + i);
			if (i > 0) {
				result = "success";
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
				if (ps != null) {
					ps.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}

	public static HashMap<String, Double> selectChart() {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		HashMap<String, Double> map = new HashMap<String, Double>();
		try {
			conn = DBEngine.getConnection();
			String sql1 = "SELECT COUNT(\"CUSTOMER_ID\") , \"LOG_PERIOD\" FROM "
					+ "(SELECT DISTINCT \"CUSTOMER_ID\", \"LOG_PERIOD\"FROM \"SP_LOG\"  WHERE \"LOG_STATUS\" !='N') as tmp "
					+ "GROUP BY \"LOG_PERIOD\" ORDER BY \"LOG_PERIOD\" DESC LIMIT 6";
			System.out.println(sql1);
			ps = conn.prepareStatement(sql1);
			rs = ps.executeQuery();

			while (rs.next()) {
				map.put(rs.getString(2), rs.getDouble(1));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e.getMessage());
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
				if (ps != null) {
					ps.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return map;
	}

	public static String updateContentDetailEmail(String id, String value) {
		String result = "";
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DBEngine.getConnection();

			String sql = "UPDATE \"content\" SET content_d =? , last_modified='"
					+ java.sql.Date.valueOf(java.time.LocalDate.now()) + "' WHERE content_id=?;";
			// log.info("sql=" + sql);
			ps = conn.prepareStatement(sql);
			ps.setString(1, value);
			ps.setString(2, id);
			int i = ps.executeUpdate();
			System.out.println("dari db " + i);
			if (i > 0) {
				result = "success";
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
				if (ps != null) {
					ps.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}

	public static String updateContentImage(String title, String file) {
		String result = "";
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DBEngine.getConnection();
			String sql = "UPDATE \"content\" SET image =?, last_modified ='"
					+ java.sql.Date.valueOf(java.time.LocalDate.now()) + "' WHERE content_id =? ";
//				String sql = "UPDATE \"content\" SET content_d = ? WHERE content_id = ?";
			// log.info("sql=" + sql);
			ps = conn.prepareStatement(sql);
			ps.setString(1, file);
			ps.setString(2, title);
			int i = ps.executeUpdate();
			System.out.println("dari db " + i);
			if (i > 0) {
				result = "success";
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
				if (ps != null) {
					ps.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;

	}

	public static List<String[]> getContentById(String id) {
		String sql = "SELECT * FROM \"content\" WHERE \"content_id\" ='" + id + "' ";
		return execute(sql);
	}

	public static List<String[]> getCustomerPDFALL() {
		String sql = "SELECT DISTINCT spl.\"CUSTOMER_ID\", spi.\"OUTLET_NAME\", spl.\"LOG_GENERATE_DATE\", spl.\"LOG_STATUS\", spl.\"LOG_PATH_PDF\", spl.\"LOG_MESSAGE\" "
				+ "FROM \"SP_LOG\" spl JOIN \"SP_INVOICE\" spi ON spl.\"CUSTOMER_ID\" = spi.\"OUTLET_ID\"  ORDER BY \"LOG_GENERATE_DATE\" desc";
		return execute(sql);
	}

	public static boolean getUserLogin(String username, String password) {
		boolean result = false;
		Connection conn = DBEngine.getConnection();
		String sql = "SELECT * FROM \"SP_USER\" WHERE \"USER_USERNAME\"='" + username
				+ "' AND \"USER_PASSWORD\" = crypt('" + password + "',\"USER_PASSWORD\")";
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			if (rs.next()) {
				result = true;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println(e.getMessage());
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
				if (ps != null) {
					ps.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}

	public static List<String[]> getContent(String type) {
		String sql = "SELECT * FROM \"content\" where \"Type\"='" + type + "'";
		return execute(sql);
	}

	public static HashMap<String, String> getParameter() {
		HashMap<String, String> result = new HashMap<String, String>();
		Connection conn = DBEngine.getConnection();
		String sql = "SELECT \"parameter_Name\", \"parameter_Value\" FROM \"parameter\"";
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				result.put(rs.getString("parameter_Name"), rs.getString("parameter_Value"));
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println(e.getMessage());
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
				if (ps != null) {
					ps.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}

	public static List<String[]> execute(String sql) {
		List resultList = new ArrayList();
		Connection conn = DBEngine.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		if (conn != null) {
			try {
				ps = conn.prepareStatement(sql);
				rs = ps.executeQuery();
				if (!rs.next()) {
					System.out.println("no data found");
				} else {
					int columnCount = rs.getMetaData().getColumnCount();
					do {
						String[] row = new String[columnCount];
						for (int i = 0; i < row.length; ++i) {
//							System.out.println(rs.getString(i + 1));
							row[i] = String.valueOf(rs.getString(i + 1));
						}
						resultList.add(row);
					}

					while (rs.next());
					System.out.println("[OK] " + resultList.size() + " Rows and " + columnCount + " Column");

				}
			} catch (SQLException e) {
				e.printStackTrace();
//				System.out.println(e.getMessage());
			} finally {
				try {
					rs.close();
					ps.close();
					conn.close();
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}
			}
		}
		return resultList;
	}
}
