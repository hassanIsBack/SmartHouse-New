<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.filmstore.model.Movie" %>
<html>
<head>
<title>Movie Store</title>
<style type="text/css">
    #mybtn{
     font-weight: bold; 
   
    padding:7px;border-radius:7px; background-color: #3333ff;border:none;color:white;
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



body{
margin:0px;
}

.Nav-item a {
  color: white;
  display: block;
  padding-top: 20px;
  padding-bottom: 20px;
  text-decoration: none;
   padding-left: 20px;
}
.Nav-item a:hover {
  color: grey;
}
.Nav-item {
  background: black;
  display: block;
  float: left;
  margin: 0;
  padding: 0;
  width: 20%;
  text-align: center;
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
h2,h3{font-family: Calibri; font-size: 22pt; font-style: normal; font-weight: bold; 
text-align: center; }
table{font-family: Calibri; font-size: 11pt; font-style: normal;width: 35%;
background-color: #f0f4f4; border-collapse: collapse; font-weight: bold;border-radius:10px;}
table.inner{border: 0px}
h2{
    text-decoration:none;
}
input{
    
    padding:5px;
    border-radius:7px;
}
textarea{
    
    padding:5px;
    border-radius:7px;
}
#realaseDate{
    width:180px;
}
td{
    padding-left:40px;
}
</style>

</head>
 
<body>
   <% if( session.getAttribute("user")==null){
       response.sendRedirect("index.jsp");
}else{
  // User IS logged in.
%> 

  <ul class="PrimaryNav ">
   
   <li class="Nav-item"><a href="home.jsp">Home</a></li>
    <li class="Nav-item-right"><a href="../logout.jsp">Logout</a></li>
   
  </ul>
    <br>
    <br>
    <br>
    <h2>Welcome to Movie Store</h2>
 
           
               <table align="center" cellpadding = "15" >
                    <form action="../PurchaseMovieController" method="get">
                   <tbody>
                      
                       <tr>
                           <td>Feedback</td>
                           
                      
                           <td>
                               <textarea name="feedback" rows="7" cols="30"></textarea>
                           </td>
                       </tr>
                      
                      
                        
                      
                        <tr>
                           <td colspan="2" align="center">
                              <input type="submit" id="mybtn" value="Submit">&nbsp;&nbsp;
                            
                           </td>
                       </tr>
                   </tbody>
                    </form>
               </table>
 
              <%}%>   

</body>
</html>