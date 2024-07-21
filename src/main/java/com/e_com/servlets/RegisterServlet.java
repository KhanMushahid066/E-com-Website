/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.e_com.servlets;

import com.e_com.entities.User;
import com.e_com.sfactory.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.ConstraintViolationException;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author kmush
 */
public class RegisterServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            try {
                String userName = request.getParameter("user_name");
                String userEmail = request.getParameter("user_email");
                String userPass = request.getParameter("user_pass");
                String userTel = request.getParameter("user_tel");
                String userAddress = request.getParameter("user_address");

                // validation
                if (userName.isEmpty()) {
                    out.println("Name is blank.");
                    return;
                }
                
                // Creating user object to store data
                User user = new User(userName, userEmail, userPass, userTel, "default.jpg", userAddress, "normal");
                Session hibernateSession = FactoryProvider.getFactory().openSession();
                Transaction tx = hibernateSession.beginTransaction();
                
                try {
                    int userId = (int) hibernateSession.save(user);
                    tx.commit();
                    
                    HttpSession httpSession = request.getSession();
                    httpSession.setAttribute("message", "Registration Successful !! User id is  " + userId);
                    response.sendRedirect("register.jsp");
                    
                } catch (ConstraintViolationException ex) {
                    tx.rollback(); // Rollback transaction on constraint violation
                    HttpSession httpSession = request.getSession();
                    httpSession.setAttribute("message", "Email address already in use. Please choose another.");
                    response.sendRedirect("register.jsp");
                } finally {
                    hibernateSession.close();
                }
                
            } catch (Exception e) {
                e.printStackTrace();
                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("message", "Error: Registration failed. Please try again.");
                response.sendRedirect("register.jsp");
            }
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
