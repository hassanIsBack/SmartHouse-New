<html>
<head>
<title>Registration Form</title>
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
table{font-family: Calibri; font-size: 11pt; font-style: normal;width: 50%;
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
</style>
<script>
  // Checking whether the password provided matches or not
                
                function matchPassword()
                {
                    var password=document.getElementById("password").value;
                    var confirmPassword=document.getElementById("confirmPassword").value;
                    if(password!=confirmPassword)
                        {
                            alert("Password Does'nt Match");
                            document.getElementById("confirmPassword").value="";
                        }
                    
                }
			
    </script>
</head>
 
<body>
     <% if( session.getAttribute("user")==null){
       response.sendRedirect("../LastestMovieController");
}else{
  // User IS logged in.
%>
     <% 
            String rMessage=request.getParameter("message");
            String actn,logout,home;
            if (rMessage==null){
            rMessage="";
                    actn="../AddMovieController";
                    logout="../logout.jsp";
                    home="home.jsp";
                       }else{
                           actn="";
                           logout="logout.jsp";
                           home="admin/home.jsp";
                                                     }
       %>
  <ul class="PrimaryNav ">
   
   <li class="Nav-item"><a href="<%=home%>">Home</a></li>
    <li class="Nav-item-right"><a href="<%=logout%>">Logout</a></li>
   
  </ul>
    <br>
    <br>
    <br>
    <h2>Welcome to Movie Store</h2>
 <h2>
           
            <%
                out.println(rMessage); 
 
            %>
          </h2>
          <form action="<%=actn%>" method="post">
 
<table align="center" cellpadding = "20">
<tr>
<td>Title</td>
<td><input type="text" name="title"  id="title" required   />

</td>
</tr>

 
<tr>
<td>Duration</td>
<td><input type="text" name="duration" maxlength="30" id="duration" required />

</td>
</tr>
 
<tr>
<td>Release Date</td>
<td><input type="date" name="realaseDate" id="realaseDate" required/></td>
</tr>


<tr>
<td>Price</td>
<td><input type="number" name="price" min="1" id="price" required />

</td>
</tr>
<tr>
<td>Number Of Movies</td>
<td><input type="number" name="numberOfMovies" min="0"  required />

</td>
</tr>



<tr>
<td>Description</td>
<td><textarea  name="description" rows="5" cols="23" required ></textarea>

</td>
</tr>
<tr>
<td colspan="2" align="center">
    <input type="submit" id="mybtn" value="Submit">&nbsp;&nbsp;
<input type="reset" id="mybtn" value=" Reset  ">
</td>
</tr>
</table>
 
</form>
 <%}%>
</body>
</html>