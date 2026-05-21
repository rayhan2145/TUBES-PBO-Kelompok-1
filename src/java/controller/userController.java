package controller;

import java.io.IOException;
import java.util.UUID;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import models.User;

@WebServlet(name = "userController", urlPatterns = {"/userController"})
public class userController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String aksi = request.getParameter("aksi");

        if (aksi == null) {
            response.sendRedirect("index.jsp");
            return;
        }

        switch (aksi) {
            case "registrasi":
                registrasi(request, response);
                break;

            case "login":
                login(request, response);
                break;

            case "edit":
                editUser(request, response);
                break;

            case "logout":
                logout(request, response);
                break;

            default:
                response.sendRedirect("index.jsp");
                break;
        }
    }

    private void registrasi(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        String idUser = UUID.randomUUID().toString();
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        User user = new User(idUser, username, password);
        user.registrasi();

        response.sendRedirect("login.jsp");
    }

    private void login(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        User userModel = new User();
        User user = userModel.login(username, password);

        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("idUser", user.getIdUser());
            session.setAttribute("username", user.getUsername());

            response.sendRedirect("dashboard.jsp");
        } else {
            response.sendRedirect("login.jsp?error=1");
        }
    }

    private void editUser(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        String idUser = request.getParameter("idUser");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        User user = new User(idUser, username, password);
        user.editUser();

        response.sendRedirect("profile.jsp");
    }

    private void logout(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        HttpSession session = request.getSession();
        session.invalidate();

        response.sendRedirect("login.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String aksi = request.getParameter("aksi");

        if ("logout".equals(aksi)) {
            logout(request, response);
        } else {
            response.sendRedirect("index.jsp");
        }
    }
}