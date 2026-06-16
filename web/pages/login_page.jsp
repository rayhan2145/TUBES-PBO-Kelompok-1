<%-- 
    Document   : login_page
    Created on : 21 May 2026, 20.16.45
    Author     : Almi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("idUser") != null
            && session.getAttribute("username") != null
            && session.getAttribute("role") != null) {

        response.sendRedirect(
                request.getContextPath() + "/pages/dashboard_page.jsp"
        );
        return;
    }
%>
<!DOCTYPE html>
<html lang="id">
    <head>
        <meta charset="UTF-8">
        <title>Login</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    </head>

    <body class="min-h-screen flex items-center justify-center bg-gradient-to-b from-rose-600 to-rose-300">

        <div class="w-[700px] h-[460px] bg-gray-100 rounded-lg shadow-md flex items-center justify-center">

            <form action="<%= request.getContextPath()%>/userController" method="post" class="w-[260px] text-center">
                <h1 class="text-xl font-semibold text-black mb-7">
                    Inventaris Manajemen Gudang
                </h1>

                <h2 class="text-sm font-bold text-black">
                    Selamat Datang
                </h2>

                <p class="text-xs text-gray-500 mb-4">
                    Silakan Masukkan Email dan Password anda
                </p>

                <input type="hidden" name="aksi" value="login">

                <div class="relative mb-4">
                    <span class="absolute left-4 top-1/2 -translate-y-1/2 text-gray-400">
                        <i class="fa-regular fa-user"></i>
                    </span>
                    <input 
                        type="text" 
                        name="username"
                        placeholder="Masukkan Username"
                        required
                        class="w-full h-9 pl-11 pr-4 rounded-xl border border-gray-500 bg-white text-xs outline-none focus:border-rose-500"
                        >
                </div>

                <div class="relative mb-1">
                    <span class="absolute left-4 top-1/2 -translate-y-1/2 text-gray-400">
                        <i class="fa-solid fa-lock"></i>
                    </span>
                    <input 
                        type="password" 
                        name="password"
                        placeholder="Masukkan Password"
                        required
                        class="w-full h-9 pl-11 pr-4 rounded-xl border border-gray-500 bg-white text-xs outline-none focus:border-rose-500"
                        >
                </div>

                <div class="text-right mb-5">
                    <a href="<%= request.getContextPath()%>/pages/reset_password_1_page.jsp" class="text-xs text-gray-500 hover:text-rose-600">
                        Lupa Password?
                    </a>
                </div>

                <button 
                    type="submit"
                    class="w-[230px] h-10 bg-rose-600 hover:bg-rose-700 text-white font-bold rounded-xl transition  duration-300 focus:outline-none focus:ring-4 focus:ring-rose-600"
                    >
                    Login
                </button>

                <div class="flex items-center gap-4 my-4">
                    <div class="flex-1 h-px bg-gray-400"></div>
                    <span class="text-xs text-gray-500">Atau</span>
                    <div class="flex-1 h-px bg-gray-400"></div>
                </div>

                <p class="text-xs text-gray-500">
                    Belum punya akun?
                    <a href="<%= request.getContextPath()%>/pages/register_page.jsp" class="text-rose-600 font-bold hover:underline">
                        Registrasi
                    </a>
                </p>
            </form>

        </div>

    </body>
</html>