<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.Transaksi"%>
<%@page import="models.Barang"%>

<%
    ArrayList<Transaksi> dataTransaksi
            = (ArrayList<Transaksi>) request.getAttribute("dataTransaksi");
    ArrayList<Barang> dataBarang
            = (ArrayList<Barang>) request.getAttribute("dataBarang");

    if (dataTransaksi == null) {
        response.sendRedirect(
                request.getContextPath() + "/TransaksiController"
        );
        return;
    }
    String role = (String) session.getAttribute("role");
    int totalData = (Integer) request.getAttribute("totalData");
    int currentPage = 1;

    if (request.getAttribute("currentPage") != null) {
        currentPage = (Integer) request.getAttribute("currentPage");
    }
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
                        Inventaris
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

                    <% if (role != null && role.equals("supervisor")) { %>

                    <a href="#"
                       class="flex items-center gap-3 px-8 py-4 border-b border-rose-400 font-semibold">

                        <i class="fa-solid fa-file-lines"></i>
                        Laporan Transaksi

                    </a>

                    <% }%>

                </div>

                <div class="border-t border-rose-400 p-6">

                    <div class="flex items-center justify-between">

                        <div class="font-semibold">
                            Pengguna :
                            <br>
                            <%= session.getAttribute("username")%>
                        </div>

                        <form action="<%=request.getContextPath()%>/userController"
                              method="post"
                              class="inline">

                            <input type="hidden" name="aksi" value="logout">

                            <button type="submit"
                                    class="text-white text-2xl hover:text-gray-200 transition duration-200">
                                <i class="fa-solid fa-right-from-bracket"></i>
                            </button>

                        </form>

                    </div>

                </div>

            </div>
            <div class="flex-1 bg-white px-12 py-8">
                <div class="mb-6">

                    <h1 class="text-5xl font-bold mb-4">
                        Data Transaksi
                    </h1>

                    <div class="border-b border-gray-300 mb-6"></div>

                    <div class="flex justify-between items-center">

                        <div class="flex items-center gap-4">

                            <input
                                id="searchTransaksi"
                                type="text"
                                placeholder="Cari Transaksi"
                                class="border border-gray-300 rounded-lg px-4 py-2 w-80">

                            <select
                                id="filterJenis"
                                class="border border-gray-300 rounded-lg px-4 py-2 w-52">

                                <option value="">
                                    Semua Jenis
                                </option>

                                <option value="Masuk">
                                    Masuk
                                </option>

                                <option value="Keluar">
                                    Keluar
                                </option>

                            </select>

                            <input
                                id="filterTanggal"
                                type="date"
                                class="border border-gray-300 rounded-lg px-4 py-2">

                        </div>

                        <% if (role != null && role.equals("admin")) { %>

                        <button
                            onclick="document.getElementById('modalTambahTransaksi').classList.remove('hidden')"
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
                                <th class="p-4 text-left">Nama Barang</th>
                                <th class="p-4 text-left">Supplier</th>
                                <th class="p-4 text-left">Jumlah</th>
                                <th class="p-4 text-left">Tanggal</th>
                                <th class="p-4 text-left">Jenis</th>
                            </tr>

                        </thead>

                        <tbody>

                            <% for (Transaksi transaksi : dataTransaksi) {%>

                            <tr class="data-transaksi border-b">

                                <td class="p-4">
                                    <%= transaksi.getId_transaksi()%>
                                </td>

                                <td class="p-4">
                                    <%= transaksi.getId_barang()%>
                                </td>

                                <td class="nama-barang p-4">

                                    <%
                                        String namaBarang = "-";

                                        for (Barang barang : dataBarang) {

                                            if (barang.getId_barang().equals(
                                                    transaksi.getId_barang())) {

                                                namaBarang
                                                        = barang.getNama_barang();

                                                break;
                                            }
                                        }
                                    %>

                                    <%= namaBarang%>

                                </td>

                                <td class="p-4">
                                    <%= transaksi.getSupplier()%>
                                </td>

                                <td class="p-4">
                                    <%= transaksi.getJumlah()%>
                                </td>

                                <td class="tanggal p-4">
                                    <%= transaksi.getTanggal()%>
                                </td>

                                <td class="jenis p-4">

                                    <% if ("masuk".equalsIgnoreCase(transaksi.getJenis_transaksi())) { %>

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

                            <% }%>

                        </tbody>

                    </table>

                </div>
                <div class="flex justify-between items-center mt-4">

                    <span class="text-gray-500">
                        Menampilkan <%= dataTransaksi.size()%> data dari <%= totalData%> data
                    </span>

                    <div class="flex gap-2">

                        <% if (currentPage > 1) {%>

                        <a href="<%=request.getContextPath()%>/TransaksiController?page=<%= currentPage - 1%>"class="border px-3 py-1 rounded">
                            &lt;
                        </a>

                        <% }%>

                        <span class="bg-rose-600 text-white px-3 py-1 rounded">
                            <%= currentPage%>
                        </span>

                        <a href="<%=request.getContextPath()%>/TransaksiController?page=<%= currentPage + 1%>"class="border px-3 py-1 rounded">
                            &gt;
                        </a>

                    </div>

                </div>
            </div>
        </div>
        <div id="modalTambahTransaksi"
             class="hidden fixed inset-0 bg-black/50 flex items-center justify-center">

            <div class="bg-white p-8 rounded-xl w-[550px] shadow-xl">

                <h2 class="text-2xl font-bold mb-6">
                    Tambah Transaksi
                </h2>

                <form action="TransaksiController" method="post">

                    <input type="hidden"
                           name="action"
                           value="tambah">

                    <select
                        name="id_barang"
                        class="border w-full p-3 mb-3 rounded"
                        required>

                        <option value="">
                            Pilih Barang
                        </option>

                        <% for (Barang barang : dataBarang) {%>

                        <option value="<%= barang.getId_barang()%>">
                            <%= barang.getNama_barang()%>
                        </option>

                        <% }%>

                    </select>

                    <select
                        name="jenis_transaksi"
                        class="border w-full p-3 mb-3 rounded"
                        required>

                        <option value="masuk">Masuk</option>
                        <option value="keluar">Keluar</option>

                    </select>

                    <input type="number"
                           name="jumlah"
                           placeholder="Jumlah"
                           class="border w-full p-3 mb-3 rounded"
                           required>

                    <input type="text"
                           name="supplier"
                           placeholder="Supplier"
                           class="border w-full p-3 mb-3 rounded"
                           required>

                    <input type="date"
                           name="tanggal"
                           class="border w-full p-3 mb-5 rounded"
                           required>

                    <div class="flex justify-end gap-3">

                        <button type="button"
                                onclick="document.getElementById('modalTambahTransaksi').classList.add('hidden')"
                                class="border px-4 py-2 rounded">

                            Batal

                        </button>

                        <button type="submit"
                                class="bg-rose-600 text-white px-4 py-2 rounded">

                            Simpan

                        </button>

                    </div>

                </form>

            </div>

        </div>

        <script>

            const searchTransaksi =
                    document.getElementById("searchTransaksi");

            const filterJenis =
                    document.getElementById("filterJenis");

            const filterTanggal =
                    document.getElementById("filterTanggal");

            function filterTransaksi() {

                const keyword =
                        searchTransaksi.value.toLowerCase();

                const jenis =
                        filterJenis.value;

                const tanggal =
                        filterTanggal.value;

                const rows =
                        document.querySelectorAll(".data-transaksi");

                rows.forEach(row => {

                    const idTransaksi =
                            row.children[0].innerText.toLowerCase();

                    const idBarang =
                            row.children[1].innerText.toLowerCase();

                    const namaBarang =
                            row.querySelector(".nama-barang")
                            .innerText
                            .toLowerCase();

                    const supplier =
                            row.children[3].innerText.toLowerCase();

                    const jenisTransaksi =
                            row.querySelector(".jenis")
                            .innerText
                            .trim();

                    const tanggalTransaksi =
                            row.querySelector(".tanggal")
                            .innerText
                            .trim();

                    const cocokKeyword =
                            idTransaksi.includes(keyword) ||
                            idBarang.includes(keyword) ||
                            namaBarang.includes(keyword) ||
                            supplier.includes(keyword);

                    const cocokJenis =
                            jenis === "" ||
                            jenisTransaksi === jenis;

                    const cocokTanggal =
                            tanggal === "" ||
                            tanggalTransaksi === tanggal;

                    row.style.display =
                            (cocokKeyword &&
                                    cocokJenis &&
                                    cocokTanggal)
                            ? ""
                            : "none";

                });

            }

            searchTransaksi.addEventListener(
                    "keyup",
                    filterTransaksi
                    );

            filterJenis.addEventListener(
                    "change",
                    filterTransaksi
                    );

            filterTanggal.addEventListener(
                    "change",
                    filterTransaksi
                    );

        </script>       

    </body>
</html>