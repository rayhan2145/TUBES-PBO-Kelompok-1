/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import models.Barang;
import models.Transaksi;
import models.Dashboard;


@WebServlet(name = "DashboardController", urlPatterns = {"/DashboardController"})
public class DashboardController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        Dashboard dashboard = new Dashboard();

        Barang barangModel = new Barang();
        ArrayList<Barang> listBarang = barangModel.get();

        dashboard.setTotalBarang(listBarang.size());

        int totalStok = 0;

        for (Barang b : listBarang) {
            totalStok += b.getStok();
        }

        dashboard.setTotalStok(totalStok);

        Transaksi transaksiModel = new Transaksi();
        ArrayList<Transaksi> listTransaksi = transaksiModel.get();

        int masuk = 0;
        int keluar = 0;
     
        int[] dataMasuk = new int[12];
        int[] dataKeluar = new int[12];

        for (Transaksi t : listTransaksi) {

    String tanggal = t.getTanggal();

    int bulan =
        Integer.parseInt(tanggal.substring(5, 7)) - 1;

    if ("masuk".equalsIgnoreCase(t.getJenis_transaksi())) {

        masuk += t.getJumlah();
        dataMasuk[bulan] += t.getJumlah();
    }

    if ("keluar".equalsIgnoreCase(t.getJenis_transaksi())) {

        keluar += t.getJumlah();
        dataKeluar[bulan] += t.getJumlah();
    }
}
        dashboard.setBarangMasuk(masuk);
        dashboard.setBarangKeluar(keluar);

        request.setAttribute("dashboard", dashboard);
        request.setAttribute("dataMasuk", dataMasuk);
        request.setAttribute("dataKeluar", dataKeluar);

        request.getRequestDispatcher("/pages/dashboard_page.jsp")
                .forward(request, response);
    }
}