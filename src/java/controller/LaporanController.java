/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.dbConnect;

import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author zidane mardico1178
 */
@WebServlet("/laporan")
public class LaporanController extends HttpServlet {

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("/pages/laporan_page.jsp")
               .forward(request, response);
    }
    
    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String tanggalAwal = request.getParameter("tanggalAwal");
        String tanggalAkhir = request.getParameter("tanggalAkhir");

        response.setContentType(
                "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");

        response.setHeader(
                "Content-Disposition",
                "attachment; filename=laporan_transaksi.xlsx");

        try {

            System.out.println("STEP 1");

            Workbook workbook = new XSSFWorkbook();

            System.out.println("STEP 2");

            Sheet sheet = workbook.createSheet("Laporan Transaksi");

            Row header = sheet.createRow(0);

            header.createCell(0).setCellValue("ID Transaksi");
            header.createCell(1).setCellValue("Nama Barang");
            header.createCell(2).setCellValue("Jenis Transaksi");
            header.createCell(3).setCellValue("Jumlah");
            header.createCell(4).setCellValue("Tanggal");
            header.createCell(5).setCellValue("Supplier");

            Connection conn = dbConnect.getConnection();

            String sql = """
                SELECT
                    t.id_transaksi,
                    b.nama_barang,
                    t.jenis_transaksi,
                    t.jumlah,
                    t.tanggal,
                    t.supplier
                FROM transaksi t
                INNER JOIN barang b
                    ON b.id_barang = t.id_barang
                WHERE t.tanggal BETWEEN ? AND ?
                ORDER BY t.tanggal ASC
                """;

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, tanggalAwal);
            ps.setString(2, tanggalAkhir);

            ResultSet rs = ps.executeQuery();

            int rowNum = 1;

            while (rs.next()) {

                Row row = sheet.createRow(rowNum++);

                row.createCell(0)
                        .setCellValue(
                                rs.getString("id_transaksi"));

                row.createCell(1)
                        .setCellValue(
                                rs.getString("nama_barang"));

                row.createCell(2)
                        .setCellValue(
                                rs.getString("jenis_transaksi"));

                row.createCell(3)
                        .setCellValue(
                                rs.getInt("jumlah"));

                row.createCell(4)
                        .setCellValue(
                                rs.getString("tanggal"));

                row.createCell(5)
                        .setCellValue(
                                rs.getString("supplier"));
            }

            for (int i = 0; i < 6; i++) {
                sheet.autoSizeColumn(i);
            }

            rs.close();
            ps.close();
            conn.close();

            workbook.write(response.getOutputStream());

            workbook.close();

        } catch (Throwable e) {

            System.out.println("===== ERROR =====");
            System.out.println("CLASS = " + e.getClass().getName());
            System.out.println("MESSAGE = " + e.getMessage());

            e.printStackTrace();

            throw new ServletException(e);
        }
    }
}