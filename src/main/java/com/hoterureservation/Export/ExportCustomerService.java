package com.hoterureservation.Export;

import java.util.*;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import com.hoterureservation.entities.*;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.*;

public class ExportCustomerService {
  private XSSFWorkbook workbook;
  private XSSFSheet sheet;

  private String fullname;
  private String toDay;
  private List<Customer> lisCustomers;

  public ExportCustomerService(String fullname, String toDay, List<Customer> lisCustomers){
    this.fullname = fullname;
    this.toDay = toDay;
    this.lisCustomers = lisCustomers;
    workbook = new XSSFWorkbook();
    sheet = workbook.createSheet("Customer");
  }

  public void export(HttpServletResponse response){
    try {
      String []header = {"Username", "Password", "Fullname", "Phone", "Address", "Email", "Role"};

      sheet.addMergedRegion(CellRangeAddress.valueOf("A1:G1"));

      CellStyle styleTitle = workbook.createCellStyle();
      XSSFFont fontTitle = workbook.createFont();
      fontTitle.setBold(true);
      fontTitle.setFontHeightInPoints((short) 20);
      fontTitle.setColor(IndexedColors.DARK_TEAL.getIndex());
      styleTitle.setAlignment(styleTitle.getAlignment().CENTER);
      styleTitle.setFont(fontTitle);

      CellStyle style = workbook.createCellStyle();
      XSSFFont font = workbook.createFont();
      font.setBold(true);
      font.setColor(IndexedColors.BLUE.getIndex());
      style.setFont(font);

      Row row = sheet.createRow(0);
      Cell cell = row.createCell(0);
      cell.setCellValue("Customer Manager");
      cell.setCellStyle(styleTitle);

      row = sheet.createRow(1);
      cell = row.createCell(0);
      cell.setCellValue("Export by:");
      cell = row.createCell(1);
      cell.setCellValue(fullname);
      cell = row.createCell(3);
      cell.setCellValue("Export date:");
      cell = row.createCell(4);
      cell.setCellValue(toDay);

      int col = 0;
      int Idx = 4;
      for (Customer c : lisCustomers) {
        row = sheet.createRow(Idx++);
        col = 0;

        cell = row.createCell(col++);
        cell.setCellValue(c.getUsername() == null ? "" : c.getUsername());

        cell = row.createCell(col++);
        cell.setCellValue(c.getPassword() == null ? "" : c.getPassword());

        cell = row.createCell(col++);
        cell.setCellValue(c.getFullname() == null ? "" : c.getFullname());

        cell = row.createCell(col++);
        cell.setCellValue(c.getPhone() == null ? "" : c.getPhone());

        cell = row.createCell(col++);
        cell.setCellValue(c.getAddress() == null ? "" : c.getAddress());

        cell = row.createCell(col++);
        cell.setCellValue(c.getEmail() == null ? "" : c.getEmail());

        cell = row.createCell(col++);
        cell.setCellValue(c.getRole() == null ? "" : c.getRole());
      }

      row = sheet.createRow(3);
      col = 0;
      for(int i = 0; i < header.length; i++){
        cell = row.createCell(col++);
        cell.setCellValue(header[i]);
        cell.setCellStyle(style);
        sheet.autoSizeColumn(i);
      }

      ServletOutputStream outputStream = response.getOutputStream();
      workbook.write(outputStream);
      workbook.close();
      outputStream.close();
    } catch (Exception e) {
      e.printStackTrace();
    }
  }
}
