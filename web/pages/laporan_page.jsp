<%-- 
    Document   : laporan_page
    Created on : 15 Jun 2026, 23.16.06
    Author     : farra
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
String role = (String) session.getAttribute("role");

if(role == null || !role.equals("supervisor")){
response.sendRedirect(request.getContextPath() + "/DashboardController");
return;
}
%>

<!DOCTYPE html>

<html>
<head>
    <meta charset="UTF-8">
    <title>Laporan Transaksi</title>

```
<script src="https://cdn.tailwindcss.com"></script>

<link rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
```

</head>

<body class="bg-zinc-800 min-h-screen">

<div class="w-full bg-white flex min-h-screen">

```
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
           class="flex items-center gap-3 px-8 py-4 border-b border-rose-400 font-semibold">

            <i class="fa-solid fa-right-left"></i>
            Transaksi

        </a>

        <a href="laporan_page.jsp"
           class="flex items-center gap-3 px-8 py-4 border-b border-rose-400 font-semibold bg-rose-700">

            <i class="fa-solid fa-file-lines"></i>
            Laporan

        </a>

    </div>

    <div class="border-t border-rose-400 p-6">

        <div class="flex items-center justify-between">

            <div class="font-semibold">
                Pengguna :
                <br>
                <%= session.getAttribute("username") %>
            </div>

            <a href="<%=request.getContextPath()%>/LogoutController"
               class="text-white text-2xl hover:text-gray-200">

                <i class="fa-solid fa-right-from-bracket"></i>

            </a>

        </div>

    </div>

</div>

<!-- CONTENT -->

<div class="flex-1 bg-white px-12 pb-12 pt-4">

    <div class="mb-6">

        <h1 class="text-5xl font-bold mb-4">
            Laporan Transaksi
        </h1>

        <div class="border-b border-gray-300"></div>

    </div>

    <!-- CARD -->

    <div class="bg-white rounded-2xl shadow p-8 max-w-4xl">

        <h2 class="text-2xl font-bold mb-8">
            Export Data Transaksi
        </h2>

        <form action="<%=request.getContextPath()%>/laporan"
              method="post">

            <div class="grid grid-cols-2 gap-6 mb-8">

                <div>
                    <label class="block font-semibold mb-2">
                        Tanggal Awal
                    </label>

                    <input
                        type="date"
                        name="tanggalAwal"
                        required
                        class="w-full border border-gray-300 rounded-lg px-4 py-3 focus:outline-none focus:ring-2 focus:ring-rose-500">
                </div>

                <div>
                    <label class="block font-semibold mb-2">
                        Tanggal Akhir
                    </label>

                    <input
                        type="date"
                        name="tanggalAkhir"
                        required
                        class="w-full border border-gray-300 rounded-lg px-4 py-3 focus:outline-none focus:ring-2 focus:ring-rose-500">
                </div>

            </div>

            <button
                type="submit"
                class="bg-rose-600 hover:bg-rose-700 text-white font-semibold px-8 py-3 rounded-lg transition">

                <i class="fa-solid fa-file-excel mr-2"></i>
                Download Excel

            </button>

        </form>

    </div>

</div>
```

</div>

</body>
</html>
