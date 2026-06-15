package controller;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Barang;
import models.Transaksi;

@WebServlet(name = "TransaksiController", urlPatterns = {"/TransaksiController"})
public class TransaksiController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String aksi = request.getParameter("aksi");

        if (aksi == null) {
            tampilkanTransaksi(request, response);
            return;
        }

        switch (aksi) {
            
            default:
                tampilkanTransaksi(request, response);
                break;
        }
    }

    private void tampilkanTransaksi(HttpServletRequest request,
        HttpServletResponse response)
        throws ServletException, IOException {

    int page = 1;

    String pageParam = request.getParameter("page");

    if(pageParam != null){
        page = Integer.parseInt(pageParam);
    }

    int limit = 10;
    int offset = (page - 1) * limit;

    // ambil total data
    Transaksi totalTransaksi = new Transaksi();
    int totalData = totalTransaksi.get().size();

    // ambil data sesuai halaman
    Transaksi transaksi = new Transaksi();

    transaksi.addQuery(
        "LIMIT " + limit + " OFFSET " + offset
    );

    ArrayList<Transaksi> dataTransaksi = transaksi.get();

    request.setAttribute("dataTransaksi", dataTransaksi);
    request.setAttribute("currentPage", page);
    request.setAttribute("totalData", totalData);
    
    Barang barang = new Barang();
    ArrayList<Barang> dataBarang = barang.get();

    request.setAttribute("dataBarang", dataBarang);

    request.getRequestDispatcher("/pages/transaksi_page.jsp")
            .forward(request, response);
}

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if (action == null) {
            tampilkanTransaksi(request, response);
            return;
        }

        switch (action) {

            case "tambah":
                tambahTransaksi(request, response);
                break;
                
            default:
                tampilkanTransaksi(request, response);
                break;
        }
    }

    private void tambahTransaksi(HttpServletRequest request,
            HttpServletResponse response)
            throws IOException {

        Transaksi transaksi = new Transaksi();

        String id = generateIdTransaksi();

        transaksi.setId_transaksi(id);
        transaksi.setTanggal(request.getParameter("tanggal"));
        transaksi.setJumlah(
                Integer.parseInt(request.getParameter("jumlah")));
        transaksi.setSupplier(
                request.getParameter("supplier"));
        transaksi.setJenis_transaksi(
                request.getParameter("jenis_transaksi"));
        transaksi.setId_barang(
                request.getParameter("id_barang"));

        transaksi.tambahTransaksi();
        

        String idBarang = request.getParameter("id_barang");

        int jumlah = Integer.parseInt(
            request.getParameter("jumlah"));

        String jenis = request.getParameter(
        "jenis_transaksi");

        Barang barang = new Barang();

        Barang dataBarang = barang.find(idBarang);

        if(jenis.equalsIgnoreCase("masuk")){

        dataBarang.setStok(
            dataBarang.getStok() + jumlah
        );

        } else {

            dataBarang.setStok(
            dataBarang.getStok() - jumlah
    );

    }

        dataBarang.editBarang();

        response.sendRedirect("TransaksiController");

    }

    private String generateIdTransaksi() {

        Transaksi transaksi = new Transaksi();

        ArrayList<ArrayList<Object>> data =
                transaksi.query(
                        "SELECT id_transaksi "
                        + "FROM transaksi "
                        + "ORDER BY id_transaksi DESC "
                        + "LIMIT 1"
                );

        if (data.isEmpty()) {
            return "T001";
        }

        String lastId =
                data.get(0).get(0).toString();

        int nomor =
                Integer.parseInt(lastId.substring(1));

        nomor++;

        return String.format("T%03d", nomor);
    }
}