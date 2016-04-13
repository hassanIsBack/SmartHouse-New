<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.filmstore.model.Movie" %>
<html>
<head>
<title>Registration Form</title>
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
<script>
    function showResult(index ){
       //$("#mybtn").removeClass("showHide");
       var movie = document.getElementById("mydiv").innerHTML;
       
        var json = JSON.parse( movie );
	
        if(tbl) {
            tbl.parentNode.removeChild(tbl);
            
        }
       else{
        
        document.getElementById("movieName").innerHTML=json[index].title;
        
        var body=document.getElementById("akd");
        var tbl     = document.createElement("table");
        var tblBody = document.createElement("tbody");
        var rating;
  
 
    // creates a table row1
    
 
    
      var row = document.createElement("tr");
      var cell = document.createElement("td");
      var cellText = document.createTextNode("Title");
      cell.appendChild(cellText);
      row.appendChild(cell);
       var cell = document.createElement("td");
      var cellText = document.createTextNode(json[index].title);
      cell.appendChild(cellText);
      row.appendChild(cell);
     tblBody.appendChild(row);
 
    //r0w2
    var row = document.createElement("tr");
      var cell = document.createElement("td");
      var cellText = document.createTextNode("Releasing Date");
      cell.appendChild(cellText);
      row.appendChild(cell);
       var cell = document.createElement("td");
      var cellText = document.createTextNode(json[index].releasedate);
      cell.appendChild(cellText);
      row.appendChild(cell);
     tblBody.appendChild(row);
  
 
   
    //row3
    var row = document.createElement("tr");
      var cell = document.createElement("td");
      var cellText = document.createTextNode("Price");
      cell.appendChild(cellText);
      row.appendChild(cell);
       var cell = document.createElement("td");
      var cellText = document.createTextNode("$ "+json[index].price);
      cell.appendChild(cellText);
      row.appendChild(cell);
     tblBody.appendChild(row);
     
     
    //row4
    var row = document.createElement("tr");
      var cell = document.createElement("td");
      var cellText = document.createTextNode("Duration");
      cell.appendChild(cellText);
      row.appendChild(cell);
       var cell = document.createElement("td");
      var cellText = document.createTextNode(json[index].duration);
      cell.appendChild(cellText);
      row.appendChild(cell);
     tblBody.appendChild(row);
     
     
     //row4
    var row = document.createElement("tr");
      var cell = document.createElement("td");
      var cellText = document.createTextNode("Number Of Movies");
      cell.appendChild(cellText);
      row.appendChild(cell);
       var cell = document.createElement("td");
      var cellText = document.createTextNode(json[index].numberOfMovies);
      cell.appendChild(cellText);
      row.appendChild(cell);
     tblBody.appendChild(row);
     
      //r0w61
    var row = document.createElement("tr");
      var cell = document.createElement("td");
      var cellText = document.createTextNode("Rating");
      cell.appendChild(cellText);
      row.appendChild(cell);
       var cell = document.createElement("td");
       if(json[index].feedback==0)
           {
               rating="Not provided by any viewer ";
           }
           else
               {
                 rating=  json[index].feedback;
               }
      var cellText = document.createTextNode(rating);
      cell.appendChild(cellText);
      row.appendChild(cell);
     tblBody.appendChild(row);
     
     //row5
     var row = document.createElement("tr");
      var cell = document.createElement("td");
      var cellText = document.createTextNode("Description");
      cell.appendChild(cellText);
      row.appendChild(cell);
       var cell = document.createElement("td");
      var cellText = document.createTextNode(json[index].description);
      cell.appendChild(cellText);
      row.appendChild(cell);
     tblBody.appendChild(row);
     
     
   
     
  
     
     
     
     var f = document.createElement("form");
     f.setAttribute('method',"post");
    f.setAttribute('action',"admin/purchase.jsp");

     var i = document.createElement("input"); //input element, text
     i.setAttribute('type',"hidden");
     i.setAttribute('name',"id");
     i.setAttribute('value',json[index].id);
     
     var j= document.createElement("input"); //input element, text
     j.setAttribute('type',"hidden");
     j.setAttribute('name',"price");
     j.setAttribute('value',json[index].price);
    
var s = document.createElement("input"); //input element, Submit button
s.setAttribute('type',"submit");
s.setAttribute('value',"Purchase");
s.setAttribute('id',"saveme");
f.appendChild(i);
f.appendChild(j);
 f.appendChild(s);
     document.getElementsByTagName('body')[0].appendChild(f);



 var row = document.createElement("tr");
      var cell = document.createElement("td");
     
      row.appendChild(cell);
       
     tblBody.appendChild(row);


     
 
  tbl.appendChild(tblBody);
  
  body.appendChild(tbl);
 
  tbl.setAttribute("width","35%");
   tbl.setAttribute("align","center");
    tbl.setAttribute("cellpadding","15");
       }
       var tables = document.getElementsByTagName("TABLE");
       for (var i=tables.length-2; i>=1;i-=1)
       if (tables[i]) tables[i].parentNode.removeChild(tables[i]);
        var forms = document.getElementsByTagName("FORM");
      
       for (var i=0;i<=forms.length;i++){
       if (i!=index) 
           forms[i].parentNode.removeChild(forms[i]);
       
       }
       
   
    }
    
    
    
    </script>
</head>
 
<body>
        <% if( session.getAttribute("user")==null){
       response.sendRedirect("LastestMovieController");
}else{
  // User IS logged in.
%>       
  <ul class="PrimaryNav ">
   
   <li class="Nav-item"><a href="admin/home.jsp">Home</a></li>
    <li class="Nav-item-right"><a href="logout.jsp">Logout</a></li>
   
  </ul>
    <br>
    <br>
    <br>
    <h2>Welcome to Movie Store</h2>
 
           <% List<Movie> movie= (List<Movie>)  request.getAttribute("movie");
              if(movie.size()==0)
                          {
                   %>
                   <h2>Sorry No Movie Found</h2>
  <%  }else{
%>
            <table align="center" cellpadding = "15" >
                   
                   <tbody>
          
                       <% 
               for(int i=0;i<movie.size();i++)
               {%>
                   
                       <tr>
                           <td>Title</td>
                           <td><% out.println(movie.get(i).getTitle()); %></td>
                          <%Gson gson = new Gson();

	
                            String json = gson.toJson(movie);%>
                           
                         <td> <div id="mydiv" style="display:none"><%=json%></div></td>
                        
                            <td><button id="mybtn" onclick="showResult(<%=i%>)">Show</button></td>
                            
                       </tr>
                         
               
          <%     }  }%>                           
  
</tbody>
            </table>

            
       
            <h3> <div id="movieName"></div></h3>
     
        <div id="akd">
           
                        
                   
            </div>
      
   
              
       <%}%>

</body>
</html>