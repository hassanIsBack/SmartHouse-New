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
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "MovieFeedbackController", urlPatterns = {"/MovieFeedbackController"})
public class MovieFeedbackController extends HttpServlet {

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
       Service service = new Service();
       String msg;
       boolean result;
        try {
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");
            String email = user.getEmail();
            String title = request.getParameter("title");
            float rating = Float.parseFloat(request.getParameter("rating"));
            System.out.println("Feedback for movie "+title+" by "+email+" rated "+rating);
            result=service.sendMovieFeedback(email, title, rating);
            System.out.println("kusss"+result);
            if(result==true)
            {
               msg="You have Submit Feedback"; 
            }
            else{
                msg="Something went wrong"; 
            }
            RequestDispatcher rd =request.getRequestDispatcher("user/movieFeedbackResult.jsp?message="+msg); 
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
