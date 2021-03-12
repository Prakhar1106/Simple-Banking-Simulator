<%-- 
    Document   : viewCard
    Created on : Jan 3, 2021, 6:37:00 PM
    Author     : HP
--%>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
        <link rel="stylesheet" href="style.css">
        <title>Debit_Card</title>
    </head>
    <body>
        
        <%
            int acc=Integer.parseInt(request.getParameter("acc"));
            String name=null, type=null,num=null,cvv=null;
        try{
                Class.forName("com.mysql.jdbc.Driver");
			System.out.println("Driver OK");
			Connection conn=DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/bank",
				"root",
				"1234");
				
		
		
                String str="select cname,debitcardtype,cardnum,cvv from customer where acc_no=?";
                
                PreparedStatement stmt=conn.prepareStatement(str);
                stmt.setInt(1,acc);
                ResultSet rs=stmt.executeQuery();  
                rs.next();
                name=rs.getString(1);
                type=rs.getString(2);
                num=rs.getString(3);
                cvv=rs.getString(4);
            }    
            catch(SQLException s){
                    System.out.println(s);
                    response.sendRedirect("index.html"); 
                }    
        %>
        
        <header>Ram Bharose Bank</header>
             
     <nav>
    <div class="nav-wrapper">
        <img src="img/bank.jpg" class="brand-logo" height="60" width="100" />Logo
      <ul id="nav-mobile" class="right hide-on-med-and-down">
        
        <li><a href="index.html">Logout</a></li>
      </ul>
    </div>
  </nav>
         <h4>Your Debit Card</h4>      
    
   <div class="row">
    <div class="col s3 offset-s4" id="printableArea">
      <div class="card blue-grey darken-1">
        <div class="card-content white-text">
          <span class="card-title"><% out.print(type);%> Card</span>
          <hr><p style="font-size:30px"><% out.print(num.substring(0,4)+" "+num.substring(4,8)+" "+num.substring(8));%></p>
          <br><span style="font-size:20px"><% out.print(name);%></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span style="font-size:20px">CVV: <% out.print(cvv);%></span>
        </div>
        
      </div>
    </div> <input type="button" onclick="printDiv('printableArea')" value="Print" />
   </div>
       
    

    <footer class="page-footer"> 
		<div class="footer-copyright">
		<div class="container">
			Copyright 2020. All right reserved <br>
			Secure Payment Gateway
		<a class="grey-text text-lighten-4 right" href="#!">More Links</a>
		</div>
	  </div>

	</footer>
    </body>
    <script type="text/javascript">
        function printDiv(divName) {
     var printContents = document.getElementById(divName).innerHTML;
     var originalContents = document.body.innerHTML;

     document.body.innerHTML = printContents;

     window.print();

     document.body.innerHTML = originalContents;
}
    </script>
</html>
