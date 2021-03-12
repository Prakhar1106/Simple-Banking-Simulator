<%-- 
    Document   : myAccount
    Created on : Dec 28, 2020, 7:55:48 PM
    Author     : Prakhar Gupta
--%>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <link rel="stylesheet" href="style.css">
        <title>My Account</title>
    </head>
    <body>
        <header>Ram Bharose Bank</header>
        <nav>
    <div class="nav-wrapper">
        
        <%  
            
            int acc=Integer.parseInt(request.getParameter("name"));
           String pin=request.getParameter("pin");
           String mob=null;
           String dob=null;
           String name=null;
           String fname=null;
           String type=null;
           String addr=null; 
           String pincode=null;
           String gen=null;
           String bal=null;
                        
            
            
		try{
                Class.forName("com.mysql.jdbc.Driver");
			System.out.println("Driver OK");
			Connection conn=DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/bank",
				"root",
				"1234");
				
		
		
                String str="select * from customer where acc_no=?";
                PreparedStatement stmt=conn.prepareStatement(str);
                stmt.setInt(1,acc);
                ResultSet rs=stmt.executeQuery();  
                rs.next();
                if(acc==rs.getInt("acc_no")&& pin.equals(rs.getString("PIN"))){
                name=rs.getString("cname");
                out.print("Welcome <b>"+name + "</b>");
                fname=rs.getString("Father Name");
                dob=rs.getString("dob");
                addr=rs.getString("Address");
                type=rs.getString("debitcardtype");
                gen=rs.getString("gender");
                mob=rs.getString("Mobile");
                pincode=rs.getString("Pincode");
                bal=rs.getString("Balance");
                System.out.println(type);
                }
                else{
                out.println("<script type=\"text/javascript\">" 
                        + "window.alert(\"Invalid Credentials\");" 
                        + "</script>");
                
               
                response.sendRedirect("index.html"); 
                }
                
              
                }
                catch(SQLException s){
                    System.out.println(s); response.sendRedirect("index.html"); 
                }
                    
        %>
        
        <ul id="nav-mobile" class="right hide-on-med-and-down">
        <li>Current Balance: <% out.println("<b>"+bal+"</b>");%></li>
        <%
            out.print("<li><a href=\"payment.jsp?name="+name+"&macc=20201&amount=100\" >Payment</a></li>");
            if(type!=null){
            out.print("<li><a href=\"viewCard.jsp?acc="+acc+"\" >View Debit Card</a></li>");
            }
            else
            out.print("<li><a href=\"applyDebit.html\">Apply for Debit Card</a></li>");
        %>
        
        <li><a href="index.html">Logout</a></li>
      </ul>
    </div>
  </nav>
        
        <table border="1" width="40" cellpadding="5">
            <thead>
                <tr>
                    <th>Your Account Details</th>
                    
                </tr>
            </thead>
            <tbody>
               <tr>
                    <td>Account Number</td>
                    <td><% out.println("<b>"+acc+"</b>");%></td>
                </tr>
                <tr>
                    <td>Name</td>
                    <td><% out.println("<b>"+name+"</b>");%></td>
                </tr>
                <tr>
                    <td>Father/Husband Name</td>
                    <td><% out.println("<b>"+fname+"</b>");%></td>
                </tr>
                <tr>
                    <td>Date of Birth</td>
                    <td><% out.println("<b>"+dob+"</b>");%></td>
                </tr>
                <tr>
                    <td>Gender</td>
                    <td><% out.println("<b>"+gen+"</b>");%></td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td><% out.println("<b>"+addr+"</b>");%></td>
                </tr>
                <tr>
                    <td>Pincode</td>
                    <td><% out.println("<b>"+pincode+"</b>");%></td>
                </tr>
                <tr>
                    <td>Mobile</td>
                    <td><% out.println("<b>"+mob+"</b>");%></td>
                </tr>
                <tr>
                    <td>Balance</td>
                    <td><% out.println("<b>"+bal+"</b>");%></td>
                </tr>
               
            </tbody>
        </table>
        
        <br><br>
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
</html>
