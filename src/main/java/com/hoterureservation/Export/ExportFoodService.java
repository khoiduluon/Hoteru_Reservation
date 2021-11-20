package com.hoterureservation.Export;

import java.util.*;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import com.hoterureservation.entities.*;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.*;

public class ExportFoodService {
  private XSSFWorkbook workbook;
  private XSSFSheet sheet;

  private String fullname;
  private String toDay;
  private List<Food> listFoods;

  public ExportFoodService(String fullname, String toDay, List<Food> listFoods){
    this.fullname = fullname;
    this.toDay = toDay;
    this.listFoods = listFoods;
    workbook = new XSSFWorkbook();
    sheet = workbook.createSheet("Food");
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

      Row row = sheet.createRow(0);
      Cell cell = row.createCell(0);
      cell.setCellValue("Food Manager");
      cell.setCellStyle(styleTitle);

      row = sheet.createRow(1);
      cell = row.createCell(0);
      cell.setCellValue("Export by:");
      cell = row.createCell(1);
      cell.setCellValue(fullname);
      cell = row.createCell(3);
      cell.setCellValue("Export date: " + toDay);
      cell = row.createCell(4);

      int col = 0;
      int Idx = 4;
      for (Food f : listFoods) {
        row = sheet.createRow(Idx++);
        col = 0;

        cell = row.createCell(col++);
        cell.setCellValue(f.getId() == null ? "" : f.getId().toString());

        cell = row.createCell(col++);
        cell.setCellValue(f.getName() == null ? "" : f.getName());

        cell = row.createCell(col++);
        cell.setCellValue(f.getPrice() == null ? 0 : f.getPrice());

        cell = row.createCell(col++);
        cell.setCellValue(f.getDescription() == null ? "" : f.getDescription());
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
