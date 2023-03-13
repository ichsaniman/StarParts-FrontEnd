package id.git.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class SQLData {
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
