<%-- 
    Document   : reset_password_2_page
    Created on : 16 Jun 2026, 07.10.28
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Reset Password</title>

        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    </head>

    <body class="min-h-screen flex items-center justify-center bg-gradient-to-b from-[#E50046] to-[#FF6B8A]">

        <div class="w-[850px] h-[620px] bg-[#ECECEC] rounded-xl shadow-md flex flex-col items-center">

            <!-- Judul -->
            <h1 class="mt-20 text-[22px] font-bold text-gray-800">
                Inventaris Manajemen Gudang
            </h1>

            <!-- Sub Judul -->
            <p class="mt-2 text-gray-500 text-sm">
                Silahkan Masukkan Password anda
            </p>

            <!-- Form -->
            <form action="<%=request.getContextPath()%>/userController"
                  method="post"
                  class="mt-10 flex flex-col items-center">

                <input type="hidden"
                       name="aksi"
                       value="resetPassword">

                <!-- Password Baru -->
                <div class="w-full mb-4">
                    <label class="block text-sm text-gray-600 mb-1">
                        Password baru
                    </label>

                    <div class="relative">
                        <span class="absolute left-3 top-1/2 -translate-y-1/2 text-gray-400">
                            <i class="fa-solid fa-lock"></i>
                        </span>

                        <input type="password"
                               name="password"
                               placeholder="Masukkan Password"
                               required
                               class="w-[260px] h-[42px] pl-10 border border-gray-400 rounded-xl bg-white text-sm focus:outline-none focus:ring-2 focus:ring-rose-500">
                    </div>
                </div>

                <!-- Konfirmasi Password -->
                <div class="w-full">
                    <label class="block text-sm text-gray-600 mb-1">
                        Konfirmasi Password
                    </label>

                    <div class="relative">
                        <span class="absolute left-3 top-1/2 -translate-y-1/2 text-gray-400">
                            <i class="fa-solid fa-lock"></i>
                        </span>

                        <input type="password"
                               name="konfirmasi"
                               placeholder="Konfirmasi Password"
                               required
                               class="w-[260px] h-[42px] pl-10 border border-gray-400 rounded-xl bg-white text-sm focus:outline-none focus:ring-2 focus:ring-rose-500">
                    </div>
                </div>

                <!-- Error -->
                <% if ("password".equals(request.getParameter("error"))) { %>
                <p class="mt-3 text-red-500 text-sm">
                    Password dan Konfirmasi Password tidak sama!
                </p>
                <% }%>

                <!-- Tombol Submit -->
                <button type="submit"
                        class="mt-8 w-[180px] h-[45px] bg-[#E50046] hover:bg-[#C9003D] text-white text-[18px] font-bold rounded-xl transition duration-300 focust:outline-none focus:ring-2 focus:ring-rose-500">
                    Submit
                </button>

            </form>

        </div>

    </body>
</html>