/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Barang;
/**
 *
 * @author A
 */
@WebServlet(name = "BarangController", urlPatterns = {"/BarangController"})
public class BarangController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {  
        
        String aksi = request.getParameter("aksi");
        
        if (aksi == null){
            tampilkanBarang(request,response);
            return;
        }
        
        switch (aksi) {

            case "hapus":
                hapusBarang(request, response);
                break;

            case "edit":
                editBarang(request, response);
                break;

            default:
                tampilkanBarang(request, response);
                break;
        }
    }
    
    private void tampilkanBarang(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        Barang barang = new Barang();

        ArrayList<Barang> dataBarang = barang.get();

        request.setAttribute("dataBarang", dataBarang);

        request.getRequestDispatcher("/pages/barang_page.jsp")
                .forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if (action == null) {
            tampilkanBarang(request, response);
            return;
        }

        switch (action) {

            case "tambah":
                tambahBarang(request, response);
                break;

            case "update":
                updateBarang(request, response);
                break;

            default:
                tampilkanBarang(request, response);
                break;
        }
    }
    
    private void tambahBarang(HttpServletRequest request,
            HttpServletResponse response)
            throws IOException {
        
        if(!isAdmin(request)){
            response.sendRedirect("BarangController");
            return;
        }
        
        Barang barang = new Barang();

        String id = generateIdBarang();
        barang.setId_barang(id);
        
        barang.setNama_barang(request.getParameter("nama_barang"));
        barang.setStok(Integer.parseInt(request.getParameter("stok")));
        barang.setSatuan(request.getParameter("satuan"));
        barang.setId_kategori(request.getParameter("id_kategori"));

        barang.tambahBarang();

        response.sendRedirect("BarangController");
    }
    
    private void updateBarang(HttpServletRequest request,
            HttpServletResponse response)
            throws IOException {

        if(!isAdmin(request)){
            response.sendRedirect("BarangController");
            return;
        }
        
        Barang barang = new Barang();

        barang.setId_barang(request.getParameter("id_barang"));
        barang.setNama_barang(request.getParameter("nama_barang"));
        barang.setStok(Integer.parseInt(request.getParameter("stok")));
        barang.setSatuan(request.getParameter("satuan"));
        barang.setId_kategori(request.getParameter("id_kategori"));

        barang.editBarang();

        response.sendRedirect("BarangController");
    }
    
    private void hapusBarang(HttpServletRequest request,
            HttpServletResponse response)
            throws IOException {

        if(!isAdmin(request)){
            response.sendRedirect("BarangController");
            return;
        }
        
        Barang barang = new Barang();

        barang.setId_barang(request.getParameter("id_barang"));

        barang.hapusBarang();

        response.sendRedirect("BarangController");
    }
    
    private void editBarang(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        if(!isAdmin(request)){
            response.sendRedirect("BarangController");
            return;
        }
        
        String idBarang = request.getParameter("id_barang");

        Barang barang = new Barang();

        Barang data = barang.find(idBarang);

        request.setAttribute("barang", data);

        request.getRequestDispatcher("/pages/edit_barang_page.jsp")
                .forward(request, response);
    }
    
    private String generateIdBarang() {
        Barang barang = new Barang();

        ArrayList<ArrayList<Object>> data =
            barang.query(
                "SELECT id_barang "
              + "FROM barang "
              + "ORDER BY id_barang DESC "
              + "LIMIT 1"
            );

        if(data.isEmpty()){
            return "B001";
        }

        String lastId =
            data.get(0).get(0).toString();

        int nomor =
            Integer.parseInt(lastId.substring(1));

        nomor++;

        return String.format("B%03d", nomor);
    }
    
    private boolean isAdmin(HttpServletRequest request){
    String role =
        (String) request.getSession()
                        .getAttribute("role");

    return role != null &&
           role.equals("admin");
    }
}
