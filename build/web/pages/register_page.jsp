<%-- 
    Document   : register
    Created on : 29 May 2026, 16.44.51
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="id">
    <head>
        <meta charset="UTF-8">
        <title>Register</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    </head>

    <body class="min-h-screen flex items-center justify-center bg-gradient-to-b from-rose-600 to-rose-300">

        <div class="w-[750px] h-[550px] bg-gray-100 rounded-lg shadow-lg flex items-center justify-center">

            <form action="<%=request.getContextPath() %>/userController" method="post" class="w-[320px] text-center">

                <h1 class="text-2xl font-semibold text-black mb-10">
                    Inventaris Manajemen Gudang
                </h1>

                <p class="text-gray-600 text-sm mb-5">
                    Silakan Masukkan Email dan Password anda
                </p>
                
                <input type="hidden" name="aksi" value="regist">

                <div class="relative mb-3">
                    <span class="absolute left-5 top-1/2 -translate-y-1/2 text-gray-400 text-lg">
                        <i class="fa-regular fa-user"></i>
                    </span>

                    <input
                        type="text"
                        name="username"
                        placeholder="Masukkan Username"
                        required
                        class="w-full h-10 pl-16 pr-4 rounded-2xl border border-gray-500 bg-transparent text-sm outline-none focus:border-rose-500"
                        >
                </div>

                <div class="relative mb-3">
                    <span class="absolute left-5 top-1/2 -translate-y-1/2 text-gray-400 text-lg">
                        <i class="fa-solid fa-lock"></i>
                    </span>

                    <input
                        type="password"
                        name="password"
                        placeholder="Masukkan Password"
                        required
                        class="w-full h-10 pl-16 pr-4 rounded-2xl border border-gray-500 bg-transparent text-sm outline-none focus:border-rose-500"
                        >
                </div>

                <div class="relative mb-8">
                    <span class="absolute left-5 top-1/2 -translate-y-1/2 text-gray-400 text-lg">
                        <i class="fa-solid fa-lock"></i>
                    </span>

                    <input
                        type="password"
                        name="confirmPassword"
                        placeholder="Konfirmasi Password"
                        required
                        class="w-full h-10 pl-16 pr-4 rounded-2xl border border-gray-500 bg-transparent text-sm outline-none focus:border-rose-500"
                        >
                </div>

                <button
                    type="submit"
                    class="w-[260px] h-11 bg-rose-600 hover:bg-rose-700 text-white text-xl font-bold rounded-2xl transition duration-300 focus:outline-none focus:ring-4 focus:ring-rose-600"
                    >
                    Daftar
                </button>

                <div class="flex items-center gap-4 my-5">
                    <div class="flex-1 h-px bg-gray-400"></div>
                    <span class="text-sm text-gray-700">Atau</span>
                    <div class="flex-1 h-px bg-gray-400"></div>
                </div>

                <p class="text-sm text-gray-600">
                    Sudah punya akun?
                    <a href="<%= request.getContextPath()%>/pages/login_page.jsp"
                       class="text-rose-600 font-semibold hover:underline">
                        Login
                    </a>
                </p>

            </form>

        </div>

    </body>
</html>
