<%-- 
    Document   : reset_password_1_page
    Created on : 16 Jun 2026, 07.09.59
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
    <body class="min-h-screen flex items-center justify-center bg-gradient-to-b from-rose-600 to-rose-300">

        <div class="w-[800px] h-[600px] bg-gray-100 rounded-xl shadow-md flex flex-col items-center">

            <h1 class="mt-20 text-4xl font-bold text-gray-800">
                Inventaris Manajemen Gudang
            </h1>

            <p class="mt-16 text-gray-500 text-lg">
                Silahkan masukkan Username anda yang sudah terdaftar
            </p>

            <form action="<%=request.getContextPath()%>/userController"
                  method="post"
                  class="mt-8 flex flex-col items-center">

                <input type="hidden"
                       name="aksi"
                       value="cekUsername">

                <div class="relative">
                    <span class="absolute left-4 top-1/2 -translate-y-1/2 text-gray-400">
                        <i class="fa-regular fa-user"></i>
                    </span>

                    <input type="text"
                           name="username"
                           placeholder="Masukkan Username"
                           required
                           class="w-80 h-12 pl-12 rounded-xl border border-gray-500 bg-white text-xs outline-none focus:border-rose-500">
                </div>

                <button type="submit"
                        class="mt-8 w-64 h-12  bg-rose-600 hover:bg-rose-700 text-white font-bold text-xl rounded-xl transition  duration-300 focus:outline-none focus:ring-4 focus:ring-rose-600">
                    Submit
                </button>

                <div class="flex items-center w-80 my-5">
                    <hr class="flex-grow border-gray-400">
                    <span class="px-4 text-sm text-gray-700">Atau</span>
                    <hr class="flex-grow border-gray-400">
                </div>

                <p class="text-sm text-gray-600">
                    Sudah punya akun?
                    <a href="<%= request.getContextPath()%>/pages/login_page.jsp"
                       class="text-rose-600 font-semibold hover:underline">
                        Login
                    </a>
                </p>

                <% if (request.getParameter("error") != null) { %>
                <p class="mt-4 text-red-500 font-medium">
                    Username tidak ditemukan!
                </p>
                <% }%>

            </form>

        </div>

    </body>
</html>