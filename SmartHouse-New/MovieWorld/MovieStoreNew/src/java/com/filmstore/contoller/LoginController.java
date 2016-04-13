/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.filmstore.contoller;

import com.filmstore.model.User;
import com.filmstore.service.Service;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import javax.servlet.*;  
import javax.servlet.http.*;


@WebServlet(name = "LoginController", urlPatterns = {"/LoginController"})
public class LoginController extends HttpServlet {

          
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         Service service = new Service();
         User user=new User();
         User userdb=new User();
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
               user.setEmail( request.getParameter("email"));
              user.setPassword( request.getParameter("password"));
              
	      userdb = service.authenticateUser(user);
	
	 if(userdb != null){
				
		
               
               HttpSession session=request.getSession();  
               session.setAttribute("user",userdb);
               if(userdb.getRole().equals("user")){
               response.sendRedirect("user/home.jsp");
               }else{
                   response.sendRedirect("admin/home.jsp");
               }
	 }
	 else{
		RequestDispatcher rd =request.getRequestDispatcher("views/login.jsp?message="+"wrong password or username"); 
          request.setAttribute("searchResult", null);
         rd.forward(request, response);
            
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
