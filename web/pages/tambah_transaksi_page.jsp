<%-- 
    Document   : tambah_transaksi_page
    Created on : 15 Jun 2026, 17.26.16
    Author     : zidane mardico1178
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.Barang"%>

<%
ArrayList<Barang> dataBarang =
        (ArrayList<Barang>) request.getAttribute("dataBarang");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Tambah Transaksi</title>

    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
</head>

<body class="bg-gray-100">

<div class="max-w-2xl mx-auto mt-10 bg-white p-8 rounded-xl shadow">

    <h1 class="text-3xl font-bold mb-6">
        Tambah Transaksi
    </h1>

    <form action="<%=request.getContextPath()%>/TransaksiController"
          method="post">

        <input type="hidden"
               name="action"
               value="tambah">

        <!-- Barang -->

        <div class="mb-4">

            <label class="block font-semibold mb-2">
                Nama Barang
            </label>

            <select
                name="id_barang"
                class="border w-full p-3 rounded"
                required>

                <option value="">
                    Pilih Barang
                </option>

                <% for(Barang barang : dataBarang){ %>

                <option value="<%= barang.getId_barang() %>">
                    <%= barang.getNama_barang() %>
                </option>

                <% } %>

            </select>

        </div>

        <!-- Jenis -->

        <div class="mb-4">

            <label class="block font-semibold mb-2">
                Jenis Transaksi
            </label>

            <select
                name="jenis_transaksi"
                class="border w-full p-3 rounded"
                required>

                <option value="masuk">
                    Masuk
                </option>

                <option value="keluar">
                    Keluar
                </option>

            </select>

        </div>

        <!-- Jumlah -->

        <div class="mb-4">

            <label class="block font-semibold mb-2">
                Jumlah
            </label>

            <input
                type="number"
                name="jumlah"
                min="1"
                class="border w-full p-3 rounded"
                required>

        </div>

        <!-- Supplier -->

        <div class="mb-4">

            <label class="block font-semibold mb-2">
                Supplier
            </label>

            <input
                type="text"
                name="supplier"
                class="border w-full p-3 rounded"
                required>

        </div>

        <!-- Tanggal -->

        <div class="mb-6">

            <label class="block font-semibold mb-2">
                Tanggal
            </label>

            <input
                type="date"
                name="tanggal"
                class="border w-full p-3 rounded"
                required>

        </div>

        <div class="flex justify-end gap-3">

            <a href="<%=request.getContextPath()%>/TransaksiController"
               class="border px-5 py-2 rounded">

                Batal

            </a>

            <button
                type="submit"
                class="bg-rose-600 hover:bg-rose-700 text-white px-5 py-2 rounded">

                Simpan

            </button>

        </div>

    </form>

</div>

</body>
</html>