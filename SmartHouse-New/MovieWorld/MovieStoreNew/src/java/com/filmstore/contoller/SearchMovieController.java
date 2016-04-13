/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.filmstore.contoller;

import com.filmstore.model.Movie;
import com.filmstore.model.User;
import com.filmstore.service.Service;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "SearchMovieController", urlPatterns = {"/SearchMovieController"})
public class SearchMovieController extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       Service service=new Service();
       HttpSession session=request.getSession();
       User user=(User) session.getAttribute("user");
       ArrayList<Movie> movie;
        PrintWriter out = response.getWriter();
        //trying to get the movie from dsatabase
       try {
          String title=request.getParameter("title");
 
          
           movie= service.searchMovie(title);
           if(user!=null)
           {
              if(user.getRole().equals("admin"))
              {
                   
               RequestDispatcher rd =request.getRequestDispatcher("admin/searchMovieResult.jsp"); 
         request.setAttribute("movie", movie);
         rd.forward(request, response);
              }else{
                   
               RequestDispatcher rd =request.getRequestDispatcher("user/searchMovieResult.jsp"); 
         request.setAttribute("movie", movie);
         rd.forward(request, response);
              }
               
              
           }else{
               
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
