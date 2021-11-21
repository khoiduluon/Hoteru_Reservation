package com.hoterureservation.Export;

import java.util.*;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import com.hoterureservation.entities.*;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.*;

public class ExportServiceService {
  private XSSFWorkbook workbook;
  private XSSFSheet sheet;

  private String fullname;
  private String toDay;
  private List<Services> listServices;

  public ExportServiceService(String fullname, String toDay, List<Services> listServices){
    this.fullname = fullname;
    this.toDay = toDay;
    this.listServices = listServices;
    workbook = new XSSFWorkbook();
    sheet = workbook.createSheet("Service");
  }

  public void export(HttpServletResponse response){
    try {
      String []header = {"Id", "Name", "Price", "Description"};

      sheet.addMergedRegion(CellRangeAddress.valueOf("A1:D1"));

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

      CellStyle styleData = workbook.createCellStyle();
      XSSFFont fontData = workbook.createFont();
      styleData.setAlignment(styleData.getAlignment().CENTER_SELECTION);
      styleData.setFont(fontData);

      Row row = sheet.createRow(0);
      Cell cell = row.createCell(0);
      cell.setCellValue("Service Manager");
      cell.setCellStyle(styleTitle);

      row = sheet.createRow(1);
      cell = row.createCell(0);
      cell.setCellValue("Export by:");
      cell = row.createCell(1);
      cell.setCellValue(fullname);
      cell = row.createCell(3);
      cell.setCellValue("Export date: " + toDay);

      int col = 0;
      int Idx = 4;
      for (Services s : listServices) {
        row = sheet.createRow(Idx++);
        col = 0;

        cell = row.createCell(col++);
        cell.setCellValue(s.getId() == null ? "" : s.getId().toString());
        cell.setCellStyle(styleData);

        cell = row.createCell(col++);
        cell.setCellValue(s.getName() == null ? "" : s.getName());
        cell.setCellStyle(styleData);

        cell = row.createCell(col++);
        cell.setCellValue(s.getPrice() == null ? 0 : s.getPrice());
        cell.setCellStyle(styleData);

        cell = row.createCell(col++);
        Font fontDesc = workbook.createFont();
        CellStyle cellStyle = workbook.createCellStyle();
        cellStyle.setFont(fontDesc);
        cellStyle.setWrapText(true);
        cell.setCellValue(s.getDescription() == null ? "" : s.getDescription());
        cell.setCellStyle(cellStyle);
      }

      row = sheet.createRow(3);
      col = 0;
      for(int i = 0; i < header.length; i++){
        cell = row.createCell(col++);
        cell.setCellValue(header[i]);
        cell.setCellStyle(style);
        sheet.autoSizeColumn(i);
      }
      sheet.setColumnWidth(3, 20 * 900);

      ServletOutputStream outputStream = response.getOutputStream();
      workbook.write(outputStream);
      workbook.close();
      outputStream.close();
    } catch (Exception e) {
      e.printStackTrace();
    }
  }
}
