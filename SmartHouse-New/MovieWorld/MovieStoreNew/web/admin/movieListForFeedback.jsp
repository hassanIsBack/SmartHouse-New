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

.rating {
    float:left;
}

/* :not(:checked) is a filter, so that browsers that don’t support :checked don’t 
   follow these rules. Every browser that supports :checked also supports :not(), so
   it doesn’t make the test unnecessarily selective */
.rating:not(:checked) > input {
    position:absolute;
    top:-9999px;
    clip:rect(0,0,0,0);
}

.rating:not(:checked) > label {
    float:right;
    width:1em;
    padding:0 .1em;
    overflow:hidden;
    white-space:nowrap;
    cursor:pointer;
    font-size:200%;
    line-height:1.2;
    color:#ddd;
    text-shadow:1px 1px #bbb, 2px 2px #666, .1em .1em .2em rgba(0,0,0,.5);
}

.rating:not(:checked) > label:before {
    content: '★ ';
}

.rating > input:checked ~ label {
    color: #f70;
    text-shadow:1px 1px #c60, 2px 2px #940, .1em .1em .2em rgba(0,0,0,.5);
}

.rating:not(:checked) > label:hover,
.rating:not(:checked) > label:hover ~ label {
    color: gold;
    text-shadow:1px 1px goldenrod, 2px 2px #B57340, .1em .1em .2em rgba(0,0,0,.5);
}

.rating > input:checked + label:hover,
.rating > input:checked + label:hover ~ label,
.rating > input:checked ~ label:hover,
.rating > input:checked ~ label:hover ~ label,
.rating > label:hover ~ input:checked ~ label {
    color: #ea0;
    text-shadow:1px 1px goldenrod, 2px 2px #B57340, .1em .1em .2em rgba(0,0,0,.5);
}

.rating > label:active {
    position:relative;
    top:2px;
    left:2px;
}

</style>

</head>
 
<body>
   <% if( session.getAttribute("user")==null){
       response.sendRedirect("index.jsp");
}else{
  // User IS logged in.
%> 
<% 
          String title=request.getParameter("title");
          
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
                    <form action="../MovieFeedbackController" method="post">
                   <tbody>
                      
                       <tr>
                           <td>
                             <fieldset class="rating">
  <form action="">
    <input type="radio" id="star5" name="rating" value="5" /><label for="star5" title="Rocks!">5 stars</label>
    <input type="radio" id="star4" name="rating" value="4" /><label for="star4" title="Pretty good">4 stars</label>
    <input type="radio" id="star3" name="rating" value="3" /><label for="star3" title="Meh">3 stars</label>
    <input type="radio" id="star2" name="rating" value="2" /><label for="star2" title="Kinda bad">2 stars</label>
    <input type="radio" id="star1" name="rating" value="1" /><label for="star1" title="Sucks big time">1 star</label>
                               </td>

    <td >
        <input type="hidden" name="title" value="<%=title%>">
                              <input type="submit" id="mybtn" value="Submit">&nbsp;&nbsp;
                            
                           </td>
    </form>
</fieldset>
                               
                           
                       
                          
                       </tr>
                      <tr>
                      
                          
                          </tr>
                      
                        
                      
                   </tbody>
                    </form>
               </table>
 
              <%}%>   

</body>
</html>