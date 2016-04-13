
package com.filmstore.contoller;

import com.filmstore.model.User;
import com.filmstore.service.Service;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "RegisterController", urlPatterns = {"/RegisterController"})
public class RegisterController extends HttpServlet {

  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         Service service = new Service();
        // Timestamp now = new Timestamp(new Date().getTime());
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
               User user=new User();
            
            //Updating into the database
            user.setFirstname(request.getParameter("firstName"));
            user.setLastname(request.getParameter("lastName"));
            user.setEmail(request.getParameter("email"));
            user.setUsername(request.getParameter("userName"));
            user.setPhonenum(request.getParameter("phone"));
            user.setPassword(request.getParameter("password"));
            user.setStreetname(request.getParameter("streetName"));
            user.setPostno(request.getParameter("postCode"));
            user.setCity(request.getParameter("city"));
            user.setCountry(request.getParameter("country"));
            user.setRole("user");
            
            
            System.out.println(user.getEmail());
            String message=service.register(user);
            System.out.println(message+" akd");
            if(message.equals("user allready exists")){
                service.registerSendEmail(user.getEmail(),"You have already registered");
            }else if(message.equals("Successfully Registered")){
                service.registerSendEmail(user.getEmail(),"You have Successfully Registered");
            }else
            {
                message="Something went wrong";
            }
            RequestDispatcher rd =request.getRequestDispatcher("views/register.jsp?message="+message); 
          request.setAttribute("searchResult", null);
         rd.forward(request, response);
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
