
package com.e_com.servlets;

import com.e_com.dao.UserDao;
import com.e_com.entities.User;
import com.e_com.sfactory.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class login extends HttpServlet {


 protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            // Validate input
            if (email == null || email.isEmpty() || password == null || password.isEmpty()) {
                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("message", "Invalid email or password.");
                response.sendRedirect("login.jsp");
                return;
            }

            // Authenticate user
            UserDao userDao = new UserDao(FactoryProvider.getFactory());
            User user = userDao.getUserByEmailAndPassword(email, password);

            if (user == null) {
                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("message", "Invalid email or password.");
                response.sendRedirect("login.jsp");
                return;
            }

            // Successful login
            HttpSession httpSession = request.getSession();
            httpSession.setAttribute("current_user", user);

            // Redirect based on user type
            if (user.getUsertype().equals("admin")) {
                response.sendRedirect("admin.jsp");
            } else if (user.getUsertype().equals("normal")) {
                response.sendRedirect("normal.jsp");
            } else {
                out.println("Not identified user type !!");
            }
        } catch (Exception e) {
            e.printStackTrace();
            HttpSession httpSession = request.getSession();
            httpSession.setAttribute("message", "Error: Login failed. Please try again.");
            response.sendRedirect("login.jsp");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
