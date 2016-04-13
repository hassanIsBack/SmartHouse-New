/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.filmstore.contoller;

import com.filmstore.model.User;
import com.filmstore.service.Service;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "PurchaseMovieController", urlPatterns = {"/PurchaseMovieController"})
public class PurchaseMovieController extends HttpServlet {
    
    Service service = new Service();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
           response.setContentType("text/html;charset=UTF-8");
           PrintWriter out = response.getWriter();
           HttpSession session=request.getSession();  
           User user=(User)session.getAttribute("user"); 
           String orderNumber="Mov_Store";
        try {
            String msg=null;
            
           int id = Integer.parseInt(request.getParameter("id"));
           int price = Integer.parseInt(request.getParameter("price"));
           long buyerAccNo = Integer.parseInt(request.getParameter("buyerAccountNumber"));
           System.out.println("Puchase Movie "+id+" for "+price+" from account "+buyerAccNo);
           try {
               msg =service.purchaseMovie(id, price, buyerAccNo,user);
           }catch(Exception ex) {
              msg=ex.getMessage();
          }
          
          if(msg.equals("success")){
            
                
        
              
             int purchaseid= service.getOrderNumber(id,user);
                           System.out.println(purchaseid+"purchaseid ");

             if(purchaseid!=0)
            {
                 orderNumber=orderNumber+purchaseid;
                 
                 
                   
                
                 msg="Movie Successfully Purchased."+ "\n"+" Your Order Number :"+orderNumber;
             }
              service.sendEmail(user.getEmail(),orderNumber);
          }else {
             //msg="something went wrong";
          }
           if(user.getRole().equals("user")){
                response.sendRedirect("user/purchaseResult.jsp?message="+msg);
           }else{
               response.sendRedirect("admin/purchaseResult.jsp?message="+msg);
           }
             
         
         
        } finally {            
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
