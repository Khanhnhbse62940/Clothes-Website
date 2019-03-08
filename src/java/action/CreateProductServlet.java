/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import dao.CategoryDAO;
import dao.ProductDAO;
import dto.ProductDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Hello
 */
@WebServlet(name = "Create Product Servlet", urlPatterns = {"/Create Product Servlet"})
public class CreateProductServlet extends HttpServlet {

    final private String displayServlet = "DisplayServlet";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        PrintWriter out = response.getWriter();
        try {
            String url = displayServlet;
            String productID = request.getParameter("txtProductID");
            String productName = request.getParameter("txtProductName");
            String productPrice = request.getParameter("txtProductPrice");
            String productImage = request.getParameter("txtProductImage");
            String productDetails = request.getParameter("txtProductDetails");
            String[] productCategory = request.getParameterValues("cboCategory");

            try {
                CategoryDAO categoryDAO = new CategoryDAO();
                String categoryName = categoryDAO.getCategoryIDByName(productCategory[0]);
                
                ProductDAO productDAO = new ProductDAO();
                ProductDTO productDTO = new ProductDTO(productID, productName, Double.parseDouble(productPrice), productImage, productDetails, categoryName);
                boolean result = productDAO.createProduct(productDTO);

            } catch (SQLException | NamingException e) {
                 Logger.getAnonymousLogger().log(Level.CONFIG, "msg", e);
            }

            RequestDispatcher rd= request.getRequestDispatcher(url);
            rd.forward(request, response);
        } finally {
            out.close();
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