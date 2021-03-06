/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Hello
 */
public class ProcessServlet extends HttpServlet {

    final private String loginPage = "login.jsp";
    final private String displayServlet = "DisplayServlet";
    final private String logoutServlet = "LogoutServlet";
    final private String loginServlet = "LoginServlet";
    final private String searchServlet = "SearchServlet";
    final private String viewServlet = "ViewServlet";

    final private String createProductServlet = "Create Product Servlet";
    final private String buyServlet = "BuyServlet";
    final private String viewCartServlet = "viewCart.jsp";
    final private String deleteCartServlet = "DeleteCart";
    final private String updateCartServlet = "UpdateCart";
    final private String paymentCartServlet = "PayCart";
    
    final private String deleteProductServlet = "DeleteProduct";
    final private String updateProductServlet = "UpdateProduct";
    final private String registrationServlet = "RegistrationAccountServlet";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {

            String button = request.getParameter("btAction");
            String url = loginPage;

            if (button == null) {

            } else if (button.equals("Login")) {
                url = loginServlet;
            } else if (button.equals("Home")) {
                url = displayServlet;
            } else if (button.equals("Search")) {
                url = searchServlet;
            } else if (button.equals("View")) {
                url = viewServlet;
            } else if (button.equals("Create Product")) {
                url = createProductServlet;
            } else if (button.equals("Buy")) {
                url = buyServlet;
            } else if (button.equals("View Your Cart")) {
                url = viewCartServlet;
            } else if (button.equals("Logout")) {
                url = logoutServlet;
            } else if (button.equals("DeleteCart")) {
                url = deleteCartServlet;
            } else if (button.equals("UpdateCart")) {
                url = updateCartServlet;
            } else if (button.equals("Pay")) {
                url = paymentCartServlet;
            } else if (button.equals("DeleteProduct")) {
                url = deleteProductServlet;
            } else if (button.equals("UpdateProduct")) {
                url = updateProductServlet;
            } else if (button.equals("Register")) {
                url = registrationServlet;
            }

            RequestDispatcher rd = request.getRequestDispatcher(url);
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
