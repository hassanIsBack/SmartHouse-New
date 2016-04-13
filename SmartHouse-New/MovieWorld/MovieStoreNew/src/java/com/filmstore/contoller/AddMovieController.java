/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.filmstore.contoller;

import com.filmstore.model.Movie;
import com.filmstore.service.Service;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Timestamp;
import java.util.Date;

@WebServlet(name = "AddMovieController", urlPatterns = {"/AddMovieController"})
public class AddMovieController extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        Service service =new Service();
        PrintWriter out = response.getWriter();
       try {
               Movie movie=new Movie();
           
           movie.setTitle(request.getParameter("title"));
           movie.setDuration(request.getParameter("duration"));
           
           movie.setPrice(Integer.parseInt(request.getParameter("price")));
           movie.setDescription(request.getParameter("description"));
           movie.setReleasedate(request.getParameter("realaseDate"));
            movie.setNumberOfMovies(Integer.parseInt(request.getParameter("numberOfMovies")));
            movie.setFeedback(0.0);
             Timestamp now = new Timestamp(new Date().getTime());
             movie.setTimestamp(now);
            System.out.println(movie.getTitle());
            String message=service.addOrUpdateMovie(movie, "addMovie");
            System.out.println(message+" akd");
            RequestDispatcher rd =request.getRequestDispatcher("admin/addMovie.jsp?message="+message); 
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