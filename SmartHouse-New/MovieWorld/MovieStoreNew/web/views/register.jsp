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
</style>
<script>
  //password credential check
                
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
      <% 
            String rMessage=request.getParameter("message");
            String actn,login;
            if (rMessage==null){
            rMessage="";
            login="login.jsp";
                    actn="../RegisterController";
                       }else{
                           actn="";
                           login="views/login.jsp";
                                                     }
            %>
  <ul class="PrimaryNav ">
   
   
    <li class=" Nav-item-right"><a href="<%=login%>">SignIn</a></li>
   
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
<td>First Name</td>
<td><input type="text" name="firstName"  id="firstName" required   pattern="[a-zA-Z]{1,}"  title="Digits are not allowed"/>

</td>
</tr>

 
<tr>
<td>Last Name</td>
<td><input type="text" name="lastName" maxlength="30" id="lastName" required pattern="[a-zA-Z]{1,}" title="Digits are not allowed"/>

</td>
</tr>
 
<tr>
<td>Email</td>
<td><input type="email" name="email"  required/></td>
</tr>

<tr>
<td>User Name</td>
<td><input type="text" name="userName" maxlength="30" id="userName" required />

</td>
</tr>
<tr>
<td>Phone</td>
<td><input type="text" name="phone" min="0" id="phone" required pattern="[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]" title="Minimum 10 digits required"/>

</td>
</tr>
<tr>
<td>Password</td>
<td><input type="password" name="password" min="5" title="Minimum 5 charcters required" id="password" required /></td>
</tr>
<tr>
<td>Confirm Password</td>
<td><input type="password" name="confirmPassword" maxlength="100" id="confirmPassword"  onblur="matchPassword()" required/></td>
</tr>
<tr>
<td>Street</td>
<td><input type="text" name="streetName" maxlength="30" id="streetName" required />

</td>
</tr>
<tr>
<td>Post Code</td>
<td><input type="text" name="postCode" pattern="[0-9][0-9][0-9][0-9][0-9]" id="postCode" required title="Minimum 5 digits required"/>

</td>
</tr>
<tr>
<td>City</td>
<td><input type="text" name="city" maxlength="30" id="city" required />

</td>
</tr>
<tr>
<td>Country</td>
<td><input type="text" name="country" maxlength="30" id="country" required />

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

</body>
</html>