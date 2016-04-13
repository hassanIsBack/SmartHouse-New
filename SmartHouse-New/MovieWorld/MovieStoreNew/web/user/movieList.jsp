<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.filmstore.model.Movie" %>
<html>
<head>
<title>Movie Store</title>
<style type="text/css">
    #mybtn{
     font-weight: bold; 
   text-decoration:none;
    padding:7px;border-radius:7px; background-color: #3333ff;border:none;color:white;
}
#saveme{
     font-weight: bold; 
   text-decoration:none;
    padding:7px;border-radius:7px; background-color: #3333ff;border:none;color:white;
    margin-left:180px;
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
background-color: #f0f4f4; border-collapse: collapse; font-weight: bold;
border-radius: 10px     10px      0           0;
}
table.inner{border: 0px}
h3{
    text-decoration:none;
    color:#8c8cd9;
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
form{width: 35%;
    margin: 0 auto;
background-color: #f0f4f4;
border-radius: 0px     0px      10px           10px;

}
#movieName{
    text-transform: uppercase;
}


</style>
</style>

</head>
 
<body>
        <% if( session.getAttribute("user")==null){
       response.sendRedirect("index.jsp");
}else{
  // User IS logged in.
%>       
  <ul class="PrimaryNav ">
   
   <li class="Nav-item"><a href="user/home.jsp">Home</a></li>
    <li class="Nav-item-right"><a href="logout.jsp">Logout</a></li>
   
  </ul>
    <br>
    <br>
    <br>
    <h2>Welcome to Movie Store</h2>
 
           <% List<String> movieList= (List<String>)  request.getAttribute("movieList");
               if(movieList.size()==0)
                          {
                   %>
                   <h2>You have provided feedback of all movies you have purchased.</h2>
  <%  }else{
%>
            <table align="center" cellpadding = "15" >
                   
                   <tbody>
          
                       <% 
               for(int i=0;i<movieList.size();i++)
               {%>
                   
                       <tr>
                           <form action="user/movieListForFeedback.jsp" method="post">
                           <td>Title</td>
                           <td><% out.println(movieList.get(i)); %>
                               <input type="hidden" name="title" value="<%=movieList.get(i)%>"></td>
                        
	
                           
                        
                            <td><input type="submit" id="mybtn" value="Show"/></td>
                            </form>
                       </tr>
                         
               
          <%     }  }%>                           
  
</tbody>
            </table>

            
       
      
   
              
       <%}%>

</body>
</html>