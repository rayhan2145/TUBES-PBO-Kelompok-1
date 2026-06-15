    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <%@page import="java.util.ArrayList"%>
    <%@page import="models.Transaksi"%>

    <%
    ArrayList<Transaksi> dataTransaksi =
            (ArrayList<Transaksi>) request.getAttribute("dataTransaksi");

    if(dataTransaksi == null){
        response.sendRedirect(
            request.getContextPath() + "/TransaksiController"
        );
        return;
    }
    String role = (String) session.getAttribute("role");
    %>

    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8">
        <title>Data Transaksi</title>

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
           class="flex items-center gap-3 px-8 py-4 border-b border-rose-400 font-semibold">

            <i class="fa-solid fa-folder"></i>
            Data Barang

        </a>

        <a href="<%=request.getContextPath()%>/TransaksiController"
           class="flex items-center gap-3 px-8 py-4 bg-rose-700 border-b border-rose-400 font-semibold">

            <i class="fa-solid fa-right-left"></i>
            Transaksi

        </a>

        <% if(role != null && role.equals("admin")) { %>

        <a href="#"
           class="flex items-center gap-3 px-8 py-4 border-b border-rose-400 font-semibold">

            <i class="fa-solid fa-file-lines"></i>
            Laporan

        </a>

        <% } %>

    </div>

    <div class="border-t border-rose-400 p-6 font-semibold">
        Pengguna :
        <br>
        <%= session.getAttribute("username") %>
    </div>

</div>
    <div class="flex-1 bg-white px-12 py-8">
       <div class="mb-6">

    <h1 class="text-5xl font-bold mb-4">
        Data Transaksi
    </h1>
    
    <div class="border-b border-gray-300 mb-6"></div>

    <div class="flex justify-between items-center">

        <input
            type="text"
            placeholder="Cari Transaksi"
            class="border border-gray-300 rounded-lg px-4 py-2 w-80">

        <% if(role != null && role.equals("admin")) { %>

        <button
            class="bg-rose-600 hover:bg-rose-700 text-white px-5 py-2 rounded-lg font-semibold">

            + Tambah Transaksi

        </button>

        <% } %>

    </div>

</div>

        <div class="bg-white rounded-xl shadow overflow-hidden">

            <table class="w-full">

                <thead class="bg-gray-200">

                    <tr>
                        <th class="p-4 text-left">ID Transaksi</th>
                        <th class="p-4 text-left">ID Barang</th>
                        <th class="p-4 text-left">Supplier</th>
                        <th class="p-4 text-left">Jumlah</th>
                        <th class="p-4 text-left">Tanggal</th>
                        <th class="p-4 text-left">Jenis</th>
                    </tr>

                </thead>

                <tbody>

                <% for(Transaksi transaksi : dataTransaksi){ %>

                    <tr class="border-b">

                        <td class="p-4">
                            <%= transaksi.getId_transaksi() %>
                        </td>

                        <td class="p-4">
                            <%= transaksi.getId_barang() %>
                        </td>

                        <td class="p-4">
                            <%= transaksi.getSupplier() %>
                        </td>

                        <td class="p-4">
                            <%= transaksi.getJumlah() %>
                        </td>

                        <td class="p-4">
                            <%= transaksi.getTanggal() %>
                        </td>

                        <td class="p-4">

                            <% if("masuk".equalsIgnoreCase(transaksi.getJenis_transaksi())) { %>

                                <span class="bg-green-100 text-green-700 px-3 py-1 rounded-full">
                                    Masuk
                                </span>

                            <% } else { %>

                                <span class="bg-red-100 text-red-700 px-3 py-1 rounded-full">
                                    Keluar
                                </span>

                            <% } %>

                        </td>

                    </tr>

                <% } %>

                </tbody>

            </table>

        </div>
    </div>
    </div>

    </body>
    </html>