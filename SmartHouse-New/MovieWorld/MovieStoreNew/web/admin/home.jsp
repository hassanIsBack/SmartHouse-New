<%-- 
  
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Film Store</title>
<style>


.Nav-item {
  background: black;
  display: block;
  float: left;
  margin: 0;
  padding: 0;
  width: 15%;
  text-align: center;
}
body{
margin:0px;
}

.Nav-item a {
  color: white;
  display: block;
  padding-top: 20px;
  padding-bottom: 20px;
  text-decoration: none;
}
.Nav-item a:hover {
  color: grey;
}



.PrimaryNav {
  list-style: none;
  background: black;
  display: block;
  float: left;
  margin: 0;
  padding: 0px;
  width: 100%;
}


.Nav-item-right {
  background: black;
  display: block;
  float: right;
  margin: 0;
  padding: 0;
  width: 10%;
  text-align: center;
  
}
.Nav-item-right a {
  color: white;
  display: block;
  padding-top: 20px;
  padding-bottom: 20px;
  text-decoration: none;
  
}
.Nav-item-right a:hover {
  color: grey;
}




</style>
</head>
<body>
    <% if( session.getAttribute("user")==null){
       response.sendRedirect("../LastestMovieController");
}else{
  // User IS logged in.
%>

<!--menu item-->

<ul class="PrimaryNav with-indicator">
    <li class="Nav-item"><a href="#">Home</a></li>
    <li class="Nav-item"><a href="addMovie.jsp">Add Movie</a></li>
    <li class="Nav-item"><a href="updateMovie.jsp">Update Movie</a></li>
    <li class="Nav-item"><a href="deleteMovie.jsp">Delete Movie</a></li>
     <li class="Nav-item"><a href="searchMovie.jsp">Search Movie</a></li>
     <li class="Nav-item"><a href="../RetreiveFeedBackMovieListController">Rating</a></li>
    <li class="Nav-item-right"><a href="../logout.jsp">Logout</a></li>
  </ul>
<%}%>
  </body>
</html>
