/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.e_com.servlets;

import com.e_com.dao.CategoryDao;
import com.e_com.dao.ProductDao;
import com.e_com.entities.Category;
import com.e_com.entities.Product;
import com.e_com.sfactory.FactoryProvider;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author kmush
 */
@MultipartConfig
public class ProuctOperationServlet extends HttpServlet {

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
//           feecting category data

            String op = request.getParameter("operation");
            if (op.trim().equals("addcategory")) {
//                add category 

                String tittle = request.getParameter("catTitle");
                String description = request.getParameter("catDescription");

                Category category = new Category();
                category.setCategoryTitle(tittle);
                category.setCategoryDescription(description);

                //category database save:
                CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
                int catId = categoryDao.saveCategory(category);

                HttpSession httpsession = request.getSession();
                httpsession.setAttribute("messageGreen", "Category added successfully: " + catId);
                response.sendRedirect("admin.jsp");

            } else if (op.trim().equals("addproduct")) {

                //add product      
                // Retrieve form parameters
                String pName = request.getParameter("pName");
                String pDesc = request.getParameter("pDesc");
                int pPrice = Integer.parseInt(request.getParameter("pPrice"));
                int pDiscount = Integer.parseInt(request.getParameter("pDiscount"));
                int pQuantity = Integer.parseInt(request.getParameter("pQuantity"));
                int catId = Integer.parseInt(request.getParameter("catId"));

                // Handle file upload
                Part part = request.getPart("pPic");
//                    String fileName = Paths.get(Part.getSubmittedFileName()).getFileName().toString();
//                    InputStream fileContent = Part.getInputStream();

                Product p = new Product();
                p.setpName(pName);
                p.setpDesc(pDesc);
                p.setpPrice(pPrice);
                p.setpDiscount(pDiscount);
                p.setpQuantity(pQuantity);
                p.setpPhoto(part.getSubmittedFileName());

                CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                Category categoryById = cdao.getCategoryById(catId);
                p.setCategory(categoryById);

                //category database save:
                ProductDao pDao = new ProductDao(FactoryProvider.getFactory());
                pDao.saveProduct(p);

//                pic upload 
//                find out the path to upload photo 
                String path = request.getRealPath("img") + File.separator + "products" + File.separator + part.getSubmittedFileName();
                 
                
                

                //uploading file code 
                try (FileOutputStream fos = new FileOutputStream(path);
                        InputStream is = part.getInputStream()) {

                    byte[] data = new byte[is.available()];
                    is.read(data);
                    fos.write(data);
                    fos.close();
                } catch (IOException e) {
                    e.printStackTrace();
                    // Handle the exception (e.g., send an error response, log the error, etc.)
                    response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "File upload failed");
                     return;
                }

                HttpSession httpsession = request.getSession();
                httpsession.setAttribute("messageGreen", "Product added successfully: ");
                response.sendRedirect("admin.jsp");
                return;
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
