<%-- 
    Document   : barang_page
    Created on : 15 Jun 2026, 05.32.04
    Author     : A
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.util.ArrayList"%>
<%@page import="models.Barang"%>

<%
    ArrayList<Barang> dataBarang
            = (ArrayList<Barang>) request.getAttribute("dataBarang");

    if (dataBarang == null) {
        response.sendRedirect(
                request.getContextPath() + "/BarangController"
        );
        return;
    }

    String role = (String) session.getAttribute("role");
%>

<!DOCTYPE html>
<html lang="id">
    <head>
        <meta charset="UTF-8">
        <title>Data Barang</title>
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

                    <a href="<%=request.getContextPath()%>/TransaksiController"
                       class="flex items-center gap-3 px-8 py-4 border-b border-rose-400 font-semibold">

                        <i class="fa-solid fa-right-left"></i>
                        Transaksi

                    </a>

                    <% if (role != null && role.equals("supervisor")) { %>

                    <a href="#"
                       class="flex items-center gap-3 px-8 py-4 border-b border-rose-400 font-semibold">

                        <i class="fa-solid fa-file-lines"></i>
                        Laporan

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

            <!-- CONTENT -->

            <div class="flex-1 bg-white px-12 py-8">

                <!-- HEADER -->

                <div class="mb-6">

                    <h1 class="text-5xl font-bold mb-4">
                        Data Barang
                    </h1>

                    <div class="border-b border-gray-300"></div>

                </div>

                <!-- FILTER -->

                <div class="flex justify-between items-center mb-6">

                    <div class="flex items-center gap-4">

                        <input
                            id="searchBarang"
                            type="text"
                            placeholder="Cari Nama Barang"
                            class="border border-gray-300 rounded-lg px-4 py-2 w-80">

                        <select
                            id="filterKategori"
                            class="border border-gray-300 rounded-lg px-4 py-2 w-52">

                            <option value="">Semua Kategori</option>
                            <option value="K001">Elektronik</option>
                            <option value="K002">Furniture</option>
                            <option value="K003">ATK</option>

                        </select>

                        <select
                            id="filterStatus"
                            class="border border-gray-300 rounded-lg px-4 py-2 w-52">

                            <option value="">Semua Status</option>
                            <option value="Tersedia">Tersedia</option>
                            <option value="Habis">Habis</option>

                        </select>
                    </div>

                    <% if (role != null && role.equals("admin")) { %>
                    <button
                        onclick="document.getElementById('modalTambah').classList.remove('hidden')"
                        class="bg-rose-600 text-white px-5 py-2 rounded-lg">
                        + Tambah Barang
                    </button>
                    <% } %>

                </div>

                <!-- TABLE -->

                <div class="bg-white rounded-xl shadow overflow-hidden">

                    <table class="w-full text-sm">

                        <thead class="bg-gray-100 text-gray-700">

                            <tr>

                                <th class="p-4 text-left">ID Barang</th>
                                <th class="p-4 text-left">Nama Barang</th>
                                <th class="p-4 text-left">Kategori</th>
                                <th class="p-4 text-left">Stok</th>
                                <th class="p-4 text-left">Satuan</th>
                                <th class="p-4 text-left">Status</th>

                                <% if (role != null && role.equals("admin")) { %>
                                <th class="p-4 text-center">Aksi</th>
                                    <% } %>

                            </tr>

                        </thead>

                        <tbody>

                            <% for (Barang barang : dataBarang) {%>

                            <tr class="data-barang border-b hover:bg-gray-50">

                                <td class="p-4">
                                    <%= barang.getId_barang()%>
                                </td>

                                <td class="p-4">
                                    <%= barang.getNama_barang()%>
                                </td>

                                <td class="kategori p-4">
                                    <%= barang.getId_kategori()%>
                                </td>

                                <td class="p-4">
                                    <%= barang.getStok()%>
                                </td>

                                <td class="p-4">
                                    <%= barang.getSatuan()%>
                                </td>

                                <td class="status p-4">

                                    <% if (barang.getStok() > 0) { %>

                                    <span class="bg-green-100 text-green-700 px-3 py-1 rounded-full text-sm">
                                        Tersedia
                                    </span>

                                    <% } else { %>

                                    <span class="bg-red-100 text-red-700 px-3 py-1 rounded-full text-sm">
                                        Habis
                                    </span>

                                    <% } %>

                                </td>

                                <% if (role != null && role.equals("admin")) {%>
                                <td class="p-4 text-center">

                                    <div class="flex justify-center gap-2">

                                        <a href="<%=request.getContextPath()%>/BarangController?aksi=hapus&id_barang=<%=barang.getId_barang()%>"
                                           onclick="return confirm('Hapus data ini?')"
                                           class="bg-red-500 hover:bg-red-600 text-white px-3 py-2 rounded">

                                            <i class="fa-solid fa-trash"></i>

                                        </a>

                                        <a href="<%=request.getContextPath()%>/BarangController?aksi=edit&id_barang=<%=barang.getId_barang()%>"
                                           class="bg-amber-500 hover:bg-amber-600 text-white px-3 py-2 rounded">

                                            <i class="fa-solid fa-pen"></i>

                                        </a>

                                    </div>

                                </td>
                                <% } %>

                            </tr>

                            <% }%>

                        </tbody>

                    </table>

                </div>

            </div>

        </div>

        <!-- MODAL TAMBAH BARANG -->

        <div id="modalTambah"
             class="hidden fixed inset-0 bg-black/50 flex items-center justify-center">

            <div class="bg-white p-8 rounded-xl w-[500px] shadow-xl">

                <h2 class="text-2xl font-bold mb-6">
                    Tambah Barang
                </h2>

                <form action="BarangController" method="post">

                    <input type="hidden"
                           name="action"
                           value="tambah">



                    <input type="text"
                           name="nama_barang"
                           placeholder="Nama Barang"
                           class="border w-full p-3 mb-3 rounded">

                    <input type="number"
                           name="stok"
                           placeholder="Stok"
                           class="border w-full p-3 mb-3 rounded">

                    <select
                        name="id_kategori"
                        class="border w-full p-3 mb-3 rounded">

                        <option value="">Pilih Kategori</option>

                        <option value="K001">
                            Elektronik
                        </option>

                        <option value="K002">
                            Furniture
                        </option>

                        <option value="K003">
                            ATK
                        </option>

                    </select>

                    <select
                        name="satuan"
                        class="border w-full p-3 mb-5 rounded">

                        <option value="">Pilih Satuan</option>

                        <option value="Unit">
                            Unit
                        </option>

                        <option value="Pcs">
                            Pcs
                        </option>

                    </select>

                    <div class="flex justify-end gap-3">

                        <button type="button"
                                onclick="document.getElementById('modalTambah').classList.add('hidden')"
                                class="border px-4 py-2 rounded">

                            Batal

                        </button>

                        <button type="submit"
                                class="bg-rose-600 hover:bg-rose-700 text-white px-4 py-2 rounded">

                            Simpan

                        </button>

                    </div>

                </form>

            </div>

        </div>

        <script>

            const searchBarang =
                    document.getElementById("searchBarang");

            const filterKategori =
                    document.getElementById("filterKategori");

            const filterStatus =
                    document.getElementById("filterStatus");

            function filterData() {

                const keyword =
                        searchBarang.value.toLowerCase();

                const kategori =
                        filterKategori.value;

                const status =
                        filterStatus.value;

                const rows =
                        document.querySelectorAll(".data-barang");

                rows.forEach(row => {

                    const namaBarang =
                            row.children[1].innerText.toLowerCase();

                    const kategoriBarang =
                            row.querySelector(".kategori")
                            .innerText
                            .trim();

                    const statusBarang =
                            row.querySelector(".status")
                            .innerText
                            .trim();

                    const cocokNama =
                            namaBarang.includes(keyword);

                    const cocokKategori =
                            kategori === "" ||
                            kategoriBarang === kategori;

                    const cocokStatus =
                            status === "" ||
                            statusBarang === status;

                    row.style.display =
                            (cocokNama &&
                                    cocokKategori &&
                                    cocokStatus)
                            ? ""
                            : "none";

                });
            }

            searchBarang.addEventListener(
                    "keyup",
                    filterData
                    );

            filterKategori.addEventListener(
                    "change",
                    filterData
                    );

            filterStatus.addEventListener(
                    "change",
                    filterData
                    );

        </script>

    </body>
</html>
