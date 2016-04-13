
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Film Store</title>
        <style type="text/css">
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



h2{font-family: Calibri; font-size: 22pt; font-style: normal; font-weight: bold; 
text-align: center; }
table{font-family: Calibri; font-size: 11pt; font-style: normal;width: 35%;
background-color: #f0f4f4; border-collapse: collapse; font-weight: bold;border-radius:10px;}
table.inner{border: 0px}

input{
    
    padding:5px;
    border-radius:7px;
}
tr,td{
    padding:20px;
}
#btn{
    
    background-color: #3333ff;
    padding:6px;
    border-radius:7px;
    color:white;
    font-weight: bold; 
     font-style: normal;
     font-family: Calibri; 
}
#mybtn{
     font-weight: bold; 
   
    padding:7px;border-radius:7px; background-color: #3333ff;border:none;color:white;
}
a{
    text-decoration:none;
}
</style>

    </head>
    <body>
        <ul class="PrimaryNav with-indicator">
   
   
   
    <li class="Nav-item-right"><a href="register.jsp">SignUp</a></li>
  </ul>
    <br>
    <br>
    <br>
    <h2>Welcome to Movie Store</h2>
    
     <% 
            String rMessage=request.getParameter("message");
            String actn;
            String color="";
            if (rMessage==null){
            rMessage="";
                    actn="../LoginController";
                       }else{
                           actn="";
                           color="red";
                         }
                
 
            %>
    <h2 style="color:<%=color%>"><%out.println(rMessage); %></h2>
         <div id="mrg">
        <table align="center" cellpadding = "10">
           
            <form action="<%=actn%>" method="post" name="loginForm">
            <tr>
                <td>Email</td><td><input type="email" name="email" required><td>
                
            </tr>
            <tr>
                <td>Password</td><td><input type="password" name="password" required><td>
                
            </tr>
            
            <tr>
                <td align="center" colspan="2"> <button  id="mybtn" type="submit">&nbsp;&nbsp;&nbsp;&nbsp;SignIn&nbsp;&nbsp;&nbsp;</button>
                      <a id="btn" href="register.jsp">&nbsp;&nbsp;&nbsp;&nbsp;SignUp&nbsp;&nbsp;&nbsp;&nbsp;</a>
                <td>
                
            </tr>
            </form>
              
        </table>
        
          </div>
    </body>
</html>
