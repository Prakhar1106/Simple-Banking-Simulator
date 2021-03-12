<%-- 
    Document   : AccCreation
    Created on : Dec 26, 2020, 3:34:38 PM
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
        <title>Create Account</title>
    </head>
    <body>
        <header>Ram Bharose Bank</header>
        <nav>
    <div class="nav-wrapper">
        <img src="img/bank.jpg" class="brand-logo" height="60" width="100" />Logo
      <ul id="nav-mobile" class="right hide-on-med-and-down">
        
        <li><a href="index.html">Logout</a></li>
      </ul>
    </div>
  </nav>
         <%
           String name=request.getParameter("name"); 
           String fname=request.getParameter("fname"); 
           String mob=request.getParameter("mob"); 
           String addr=request.getParameter("addr"); 
           String pincode=request.getParameter("pincode");
           String dob=request.getParameter("dob");
           String gen=request.getParameter("gender");
           String deposit=request.getParameter("deposit"); 
           String pass=request.getParameter("pass"); 
           int acc=0;
           if(name!=null && dob!=null){
           //out.println(name + "\n" + fname + "\n" + mob + "\n" + addr + "\n" + dob + "\n" + deposit + "\n" + pass + "\n" + gen);
           Connection con=null;
          try{
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("Driver OK");
			con=DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/bank",
				"root",
				"1234");
				
		}
		catch(ClassNotFoundException | SQLException se){
			se.printStackTrace();
                                              System.out.println("Not Connected");
		}
                Statement st=null;
		try{
                st=con.createStatement();
                String str="insert into customer values(null,'"+name+"','"+fname+"', '"+dob+"', '"+gen+"', '"+addr+"', '"+pincode+"', '"+mob+"', '"+deposit+"', '"+pass+"', null, null, null, null, null)";
		st.executeUpdate(str);
                out.println("<h3>Account Sucessfully Created!!</h3>");
                }
                catch(Exception e){
                    out.println("<h3>Account Creation Failed!!</h3>");
                }
                String sql = "SELECT acc_no FROM customer";
                ResultSet rs = st.executeQuery(sql);
                while(rs.next()){
                acc  = rs.getInt("acc_no");
                }
           }
           else
                response.sendRedirect("index.html");
        %>
        
        <table border="1" width="40" cellpadding="5">
            <thead>
                <tr>
                    <th>Your Account Number</th>
                    <th><% out.println("<b>"+acc+"</b>");%></th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Name</td>
                    <td><% out.println("<b>"+name+"</b>");%></td>
                </tr>
                <tr>
                    <td>Father Name</td>
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
                    <td>Deposit</td>
                    <td><% out.println("<b>"+deposit+"</b>");%></td>
                </tr>
                <tr>
                    <td><h5 style="color:red;">*Note your Account Number carefully</h5></td>
                </tr>
            </tbody>
        </table>

        
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
