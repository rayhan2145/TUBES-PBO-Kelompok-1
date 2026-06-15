package controller;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

            case "hapus":
                hapusTransaksi(request, response);
                break;

            case "edit":
                editTransaksi(request, response);
                break;

            default:
                tampilkanTransaksi(request, response);
                break;
        }
    }

    private void tampilkanTransaksi(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        Transaksi transaksi = new Transaksi();

        ArrayList<Transaksi> dataTransaksi = transaksi.get();

        request.setAttribute("dataTransaksi", dataTransaksi);

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

            case "update":
                updateTransaksi(request, response);
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

        response.sendRedirect("TransaksiController");
    }

    private void updateTransaksi(HttpServletRequest request,
            HttpServletResponse response)
            throws IOException {

        Transaksi transaksi = new Transaksi();

        transaksi.setId_transaksi(
                request.getParameter("id_transaksi"));
        transaksi.setTanggal(
                request.getParameter("tanggal"));
        transaksi.setJumlah(
                Integer.parseInt(request.getParameter("jumlah")));
        transaksi.setSupplier(
                request.getParameter("supplier"));
        transaksi.setJenis_transaksi(
                request.getParameter("jenis_transaksi"));
        transaksi.setId_barang(
                request.getParameter("id_barang"));

        transaksi.editTransaksi();

        response.sendRedirect("TransaksiController");
    }

    private void hapusTransaksi(HttpServletRequest request,
            HttpServletResponse response)
            throws IOException {

        Transaksi transaksi = new Transaksi();

        transaksi.setId_transaksi(
                request.getParameter("id_transaksi"));

        transaksi.hapusTransaksi();

        response.sendRedirect("TransaksiController");
    }

    private void editTransaksi(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String idTransaksi =
                request.getParameter("id_transaksi");

        Transaksi transaksi = new Transaksi();

        Transaksi data =
                transaksi.find(idTransaksi);

        request.setAttribute("transaksi", data);

        request.getRequestDispatcher("/pages/edit_transaksi_page.jsp")
                .forward(request, response);
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