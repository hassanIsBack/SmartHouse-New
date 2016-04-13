<%@page import="java.util.ArrayList"%>
<%@page import="com.filmstore.model.Movie"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Film Store</title>
    <style>
        table{font-family: Calibri; font-size: 11pt; font-style: normal;width: 60%;
background-color: #f0f4f4; border-collapse: collapse; font-weight: bold;
border-radius: 10px;
}
table.inner{border: 0px}
td{
    padding-left:40px;
}
th{
    padding-left:40px;
}
h3,h2{font-family: Calibri; font-size: 22pt; font-style: normal; font-weight: bold; 
text-align: center;  }
        .Nav-item {
  background: black;
  display: block;
  float: left;
  margin: 0;
  padding: 0;
  width: 20%;
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
  width: 20%;
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
   
<ul class="PrimaryNav with-indicator">
    <li class="Nav-item"><a href="#">Home</a></li>
   <li class="Nav-item"><a href="views/searchMovie.jsp">Search Movie</a></li>
    <li class=" Nav-item-right"><a href="views/login.jsp">SignIn</a></li>
    <li class="Nav-item-right"><a href="views/register.jsp">SignUp</a></li>
  </ul>
    <br>
    <br>
    <br>
    <br>
    <h2>Welcome to Movie Store</h2>
   <% List<Movie> movie= (List<Movie>)  request.getAttribute("movie");
     
      
               String  msg;
            if (movie.size()==0){%>
                                          
                      <h2>No Movie Found</h2>
                   
                  
                       <%
            
            msg="not good";
            
                       }else{
                          msg="good"+movie.get(0).getTitle();%>
                                                     
                       <table align="center" cellpadding = "15" >
                   
                   <tbody>
                     <tr>
                      <td> Title </td>  
                       <td> Duration </td>  
                        <td> Price </td>  
                         <td> Rating </td>  
                         <td> Description </td>  
                         
                         </tr>
                       <% 
               for(int i=0;i<movie.size();i++)
               {%>
                   
                       <tr>
                           
                           <td><% out.println(movie.get(i).getTitle()); %></td>
                            <td><% out.println(movie.get(i).getDuration()); %></td>
                             <td><% out.println(movie.get(i).getPrice()); %></td>
                              <td><% out.println(movie.get(i).getFeedback()); %></td>
                              <td><% out.println(movie.get(i).getDescription()); %></td>
                        
                            
                            
                       </tr>
                         
               
          <%     }  %>                           
  
</tbody>
            </table>
                       
                       
                       
                       <%}
            %>
            
    
  </body>
</html>