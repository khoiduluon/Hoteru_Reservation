package com.hoterureservation.Export;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import com.hoterureservation.entities.*;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.*;

public class ExportBookingService {
  private XSSFWorkbook workbook;
  private XSSFSheet sheet;

  private String fullname;
  private String toDay;
  private List<Booking> listBookings;

  public ExportBookingService(String fullname, String toDay, List<Booking> listBookings){
    this.fullname = fullname;
    this.toDay = toDay;
    this.listBookings = listBookings;
    workbook = new XSSFWorkbook();
    sheet = workbook.createSheet("Booking");
  }

  public void export(HttpServletResponse response){
    try {
      String []header = {"Id", "Book Date", "Username", "Fullname", "Phone", "Room Name", "In Date", "Out Date", "Total"};

      sheet.addMergedRegion(CellRangeAddress.valueOf("A1:I1"));

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
      cell.setCellValue("Booking Manager");
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
      DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
      for (Booking b : listBookings) {
        row = sheet.createRow(Idx++);
        col = 0;

        cell = row.createCell(col++);
        cell.setCellValue(b.getId() == null ? "" : b.getId().toString());

        cell = row.createCell(col++);
        cell.setCellValue(b.getBookDate() == null ? "" : dateFormat.format(b.getBookDate()));

        cell = row.createCell(col++);
        cell.setCellValue(b.getCustomerb().getUsername() == null ? "" : b.getCustomerb().getUsername());

        cell = row.createCell(col++);
        cell.setCellValue(b.getFullname() == null ? "" : b.getFullname());

        cell = row.createCell(col++);
        cell.setCellValue(b.getPhone() == null ? "" : b.getPhone());

        cell = row.createCell(col++);
        cell.setCellValue(b.getRoomb().getName() == null ? "" : b.getRoomb().getName());

        cell = row.createCell(col++);
        cell.setCellValue(b.getInDate() == null ? "" :  dateFormat.format(b.getInDate()));

        cell = row.createCell(col++);
        cell.setCellValue(b.getOutDate() == null ? "" :  dateFormat.format(b.getOutDate()));

        cell = row.createCell(col++);
        cell.setCellValue(b.getTotal() == null ? 0 : b.getTotal());
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
