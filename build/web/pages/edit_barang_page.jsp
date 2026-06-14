<%-- 
    Document   : edit_barang_page
    Created on : 15 Jun 2026, 06.04.07
    Author     : A
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="models.Barang"%>

<%
Barang barang = (Barang) request.getAttribute("barang");

if(barang == null){
    response.sendRedirect(
        request.getContextPath() + "/BarangController"
    );
    return;
}

String role = (String) session.getAttribute("role");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Edit Barang</title>

        <script src="https://cdn.tailwindcss.com"></script>

        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    </head>
    <body class="bg-zinc-800 min-h-screen">

    <div class="w-full bg-white flex min-h-screen">

        <!-- SIDEBAR -->

        <div class="w-[240px] bg-rose-600 text-white flex flex-col">

            <div class="h-[90px] flex items-center justify-center border-b border-rose-400">
                <h1 class="font-bold text-2xl">
                    Nama Web
                </h1>
            </div>

            <div class="flex-1">

                <a href="<%=request.getContextPath()%>/DashboardController"
                   class="flex items-center gap-3 px-8 py-4 border-b border-rose-400 font-semibold">

                    <i class="fa-solid fa-table-cells-large"></i>
                    Dashboard

                </a>

                <a href="<%=request.getContextPath()%>/BarangController"
                   class="flex items-center gap-3 px-8 py-4 bg-rose-700 border-b border-rose-400 font-semibold">

                    <i class="fa-solid fa-folder"></i>
                    Data Barang

                </a>

            </div>

            <div class="border-t border-rose-400 p-6 font-semibold">
                Pengguna :
                <br>
                <%= session.getAttribute("username") %>
            </div>

        </div>

        <!-- CONTENT -->

        <div class="flex-1 bg-white px-12 py-8">

            <h1 class="text-5xl font-bold mb-4">
                Edit Barang
            </h1>

            <div class="border-b border-gray-300 mb-8"></div>

            <div class="max-w-2xl">

                <form action="<%=request.getContextPath()%>/BarangController"
                      method="post">

                    <input type="hidden"
                           name="action"
                           value="update">

                    <!-- ID BARANG -->

                    <div class="mb-5">

                        <label class="block mb-2 font-semibold">
                            ID Barang
                        </label>

                        <input type="text"
                               name="id_barang"
                               value="<%= barang.getId_barang() %>"
                               readonly
                               class="w-full border bg-gray-100 p-3 rounded">

                    </div>

                    <!-- NAMA BARANG -->

                    <div class="mb-5">

                        <label class="block mb-2 font-semibold">
                            Nama Barang
                        </label>

                        <input type="text"
                               name="nama_barang"
                               value="<%= barang.getNama_barang() %>"
                               required
                               class="w-full border p-3 rounded">

                    </div>

                    <!-- KATEGORI -->

                    <div class="mb-5">

                        <label class="block mb-2 font-semibold">
                            Kategori
                        </label>

                        <select
                            name="id_kategori"
                            class="w-full border p-3 rounded">

                            <option value="K001"
                                <%= barang.getId_kategori().equals("K001") ? "selected" : "" %>>
                                Elektronik
                            </option>

                            <option value="K002"
                                <%= barang.getId_kategori().equals("K002") ? "selected" : "" %>>
                                Furniture
                            </option>

                            <option value="K003"
                                <%= barang.getId_kategori().equals("K003") ? "selected" : "" %>>
                                ATK
                            </option>

                        </select>

                    </div>

                    <!-- STOK -->

                    <div class="mb-5">

                        <label class="block mb-2 font-semibold">
                            Stok
                        </label>

                        <input type="number"
                               name="stok"
                               value="<%= barang.getStok() %>"
                               required
                               class="w-full border p-3 rounded">

                    </div>

                    <!-- SATUAN -->

                    <div class="mb-8">

                        <label class="block mb-2 font-semibold">
                            Satuan
                        </label>

                        <select
                            name="satuan"
                            class="w-full border p-3 rounded">

                            <option value="Unit"
                                <%= barang.getSatuan().equals("Unit") ? "selected" : "" %>>
                                Unit
                            </option>

                            <option value="Pcs"
                                <%= barang.getSatuan().equals("Pcs") ? "selected" : "" %>>
                                Pcs
                            </option>

                        </select>

                    </div>

                    <!-- BUTTON -->

                    <div class="flex gap-3">

                        <button type="submit"
                                class="bg-rose-600 hover:bg-rose-700 text-white px-6 py-3 rounded">

                            Simpan Perubahan

                        </button>

                        <a href="<%=request.getContextPath()%>/BarangController"
                           class="bg-gray-500 hover:bg-gray-600 text-white px-6 py-3 rounded">

                            Kembali

                        </a>

                    </div>

                </form>

            </div>

        </div>

    </div>

    </body>
</html>
