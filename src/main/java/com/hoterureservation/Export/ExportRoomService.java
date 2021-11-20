package com.hoterureservation.Export;

import java.util.*;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import com.hoterureservation.entities.*;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.*;

public class ExportRoomService {
  private XSSFWorkbook workbook;
  private XSSFSheet sheet;

  private String fullname;
  private String toDay;
  private List<Room> listRooms;

  public ExportRoomService(String fullname, String toDay, List<Room> listRooms){
    this.fullname = fullname;
    this.toDay = toDay;
    this.listRooms = listRooms;
    workbook = new XSSFWorkbook();
    sheet = workbook.createSheet("Room");
  }

  public void export(HttpServletResponse response){
    try {
      String []header = {"Id", "Name", "Room Type", "Description"};

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
      cell.setCellValue("Room Manager");
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
      for (Room r : listRooms) {
        row = sheet.createRow(Idx++);
        col = 0;

        cell = row.createCell(col++);
        cell.setCellValue(r.getId() == null ? "" : r.getId());
        cell.setCellStyle(styleData);

        cell = row.createCell(col++);
        cell.setCellValue(r.getName() == null ? "" : r.getName());
        cell.setCellStyle(styleData);

        cell = row.createCell(col++);
        cell.setCellValue(r.getRoomType().getName() == null ? "" : r.getRoomType().getName());
        cell.setCellStyle(styleData);

        cell = row.createCell(col++);
        Font fontDesc = workbook.createFont();
        CellStyle cellStyle = workbook.createCellStyle();
        cellStyle.setFont(fontDesc);
        cellStyle.setWrapText(true);
        cell.setCellValue(r.getDescription() == null ? "" : r.getDescription());
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
