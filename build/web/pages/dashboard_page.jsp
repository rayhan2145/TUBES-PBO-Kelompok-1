<%-- 
    Document   : dashboard_page
    Created on : 14 Jun 2026, 01.58.59
    Author     : zidane mardico1178
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="models.Dashboard"%>

<%
Dashboard dashboard = (Dashboard) request.getAttribute("dashboard");

if (dashboard == null) {
    response.sendRedirect(request.getContextPath() + "/DashboardController");
    return;
}

String role = (String) session.getAttribute("role");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dashboard Inventaris</title>

    <script src="https://cdn.tailwindcss.com"></script>

    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

</head>

<body class="bg-zinc-800 min-h-screen">

<div class="w-full bg-white flex min-h-screen">

    <!-- SIDEBAR -->

    <div class="w-[240px] bg-rose-600 text-white flex flex-col">

        <div class="h-[90px] flex items-center justify-center border-b border-rose-400">
            <h1 class="font-bold text-2xl">Nama Web</h1>
        </div>

        <div class="flex-1">

            <a href="<%=request.getContextPath()%>/DashboardController"
               class="block px-8 py-4 border-b border-rose-400 font-semibold">
                Dashboard
            </a>

            <a href="#"
               class="block px-8 py-4 border-b border-rose-400 font-semibold">
                Data Barang
            </a>

            <a href="#"
               class="block px-8 py-4 border-b border-rose-400 font-semibold">
                Transaksi
            </a>

            <% if(role != null && role.equals("admin")) { %>

            <a href="#"
               class="block px-8 py-4 border-b border-rose-400 font-semibold">
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

    <!-- CONTENT -->

  <div class="flex-1 bg-white px-12 pb-12 pt-4">

        <div class="mb-4">

    <h1 class="text-5xl font-bold mb-4">
        Dashboard
    </h1>

    <div class="border-b border-gray-300"></div>

</div>
        <!-- CARD -->

        <div class="grid grid-cols-4 gap-8 mt-6 mb-10">

            <div class="bg-rose-600 text-white rounded-xl p-5 text-center">
                <h2 class="font-bold text-xl">
                    Data Barang
                </h2>

                <p class="text-5xl font-bold mt-4">
                    <%= dashboard.getTotalBarang() %>
                </p>
            </div>

            <div class="bg-rose-600 text-white rounded-xl p-5 text-center">
                <h2 class="font-bold text-xl">
                    Barang Masuk
                </h2>

                <p class="text-5xl font-bold mt-4">
                    <%= dashboard.getBarangMasuk() %>
                </p>
            </div>

            <div class="bg-red-500 text-white rounded-xl p-5 text-center">
                <h2 class="font-bold text-xl">
                    Barang Keluar
                </h2>

                <p class="text-5xl font-bold mt-4">
                    <%= dashboard.getBarangKeluar() %>
                </p>
            </div>

            <div class="bg-rose-600 text-white rounded-xl p-5 text-center">
                <h2 class="font-bold text-xl">
                    Total Stock
                </h2>

                <p class="text-5xl font-bold mt-4">
                    <%= dashboard.getTotalStok() %>
                </p>
            </div>

        </div>

        <!-- GRAFIK -->

        <div class="bg-white rounded-2xl p-8 shadow">

            <h2 class="text-2xl font-bold mb-8">
                Grafik Barang Masuk & Barang Keluar
            </h2>

            <canvas id="barangChart"></canvas>

        </div>

    </div>

</div>

<script>

const ctx = document.getElementById('barangChart');

new Chart(ctx, {
    type: 'bar',
    data: {
        labels: [
            'Jan','Feb','Mar','Apr','Mei','Jun',
            'Jul','Agu','Sep','Okt','Nov','Des'
        ],
        datasets: [
        {
            label: 'Barang Masuk',
            data: [25,80,40,25,15,20,70,50,65,30,40,55],
            backgroundColor: '#ff3b3b'
        },
        {
            label: 'Barang Keluar',
            data: [20,70,10,15,10,40,10,15,60,25,35,45],
            backgroundColor: '#2563eb'
        }]
    },
    options: {
        responsive: true
    }
});

</script>

</body>
</html>