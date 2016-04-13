<%
        request.getSession(false);
        session.invalidate();
        response.sendRedirect("LastestMovieController");
                %>
