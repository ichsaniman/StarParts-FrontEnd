package id.git.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Set;
import java.util.TreeMap;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import id.git.db.DBEngine;

public class ExcelService {
	public TreeMap<String, Object[]> getItem(String id){
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		TreeMap<String, Object[]> result = new TreeMap<String, Object[]>();
		int count =0;
		result.put(String.valueOf(count++), new Object[] {
				"Item ID","Item Name", "Item Quantity", "Item Price /pcs"
		});
		try {
			conn = DBEngine.getConnection();
			String sql = "SELECT si.\"ITEM_ID\" , si.\"ITEM_NAME\" , sod.\"ORDER_DETAIL_QTY\" , sod.\"ORDER_DETAIL_PRICE\" "
					+"FROM \"SP_ORDER_DETAIL\" sod "
					+"JOIN \"SP_ITEMS\" si ON sod.\"ORDER_DETAIL_ITEM\" = si.\"ITEM_ID\" "
					+"WHERE sod.\"ORDER_ID\" = '"+id+"'";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				result.put(String.valueOf(count++), new Object[] {rs.getObject("ITEM_ID"),rs.getObject("ITEM_NAME"),rs.getObject("ORDER_DETAIL_QTY"),rs.getObject("ORDER_DETAIL_PRICE")});
			}
			
		}catch (Exception e) {
			// TODO: handle exception
		}finally {
			try {
				rs.close();
				ps.close();
				conn.close();
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		
		
		return result;
	}
	
	public String generateExcel(String id, String date,  String time, String name,String Price) {
		String result ="";
		String path ="D:\\KERJABLOK\\StarParts\\xlsx\\";
		try {
			TreeMap<String, Object[]> items = getItem(id);
			Set<String> key = items.keySet();
			XSSFWorkbook workbook=new XSSFWorkbook();
			System.out.println("test workbook");
			XSSFSheet sheet=workbook.createSheet(id);
			int rowid = 0;
			XSSFRow row = sheet.createRow(rowid++);
		  	row.createCell(0).setCellValue("Order Id :");
		  	row.createCell(1).setCellValue(id);
	        row = sheet.createRow(rowid++);
	        row.createCell(0).setCellValue("Date :");
	        row.createCell(1).setCellValue(date);
	        row = sheet.createRow(rowid++);
	        row.createCell(0).setCellValue("Time :");
	        row.createCell(1).setCellValue(time);
	        row = sheet.createRow(rowid++);
	        row.createCell(0).setCellValue("Outlet Name :");
	        row.createCell(1).setCellValue(name);
	        row = sheet.createRow(rowid++);
	        row.createCell(0).setCellValue("Total Harga :");
	        row.createCell(1).setCellValue(Price);
	        row = sheet.createRow(rowid++);
	        for(String no: key) {
	        	int cellid = 0;
	        	row = sheet.createRow(rowid++);
	        	Object[] item = items.get(no);
	        	for(int i = 0; i < item.length; i++) {
	        		Object obj = item[i];
	        		Cell cell = (Cell)row.createCell(cellid++);
	        		cell.setCellValue(String.valueOf(obj));
	        	}
	        	++cellid;
	        }
	        result = path+date +" "+id+".xlsx";
	        FileOutputStream out = new FileOutputStream(new File(result));
	        workbook.write(out);
	        out.close();
	        workbook.close();
	        
	        
			
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return result;
	}
}
