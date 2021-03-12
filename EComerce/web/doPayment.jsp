<%-- 
    Document   : doPayment
    Created on : Feb 16, 2021, 9:49:07 AM
    Author     : Prakhar Gupta
--%>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Payment done</title>
         <link href="https://fonts.googleapis.com/css?family=Nunito+Sans:400,400i,700,900&display=swap" rel="stylesheet">
        <style>
      body {
        text-align: center;
        padding: 40px 0;
        background: #EBF0F5;
      }
        h1 {
          color: #88B04B;
          font-family: "Nunito Sans", "Helvetica Neue", sans-serif;
          font-weight: 900;
          font-size: 40px;
          margin-bottom: 10px;
        }
        p {
          color: #404F5E;
          font-family: "Nunito Sans", "Helvetica Neue", sans-serif;
          font-size:20px;
          margin: 0;
        }
      i {
        color: #9ABC66;
        font-size: 100px;
        line-height: 200px;
        margin-left:-15px;
      }
      .card {
        background: white;
        padding: 60px;
        border-radius: 4px;
        box-shadow: 0 2px 3px #C8D0D8;
        display: inline-block;
        margin: 0 auto;
      }
    </style>
    </head>
    <body>
        
        
        <%
        String name=request.getParameter("name");
        String cardnum=request.getParameter("cnum");
        int macc=Integer.parseInt(request.getParameter("macc"));
        int amount=Integer.parseInt(request.getParameter("amount"));
        String cvv=request.getParameter("cvv");
        String message="Kuch ni hua";
        
        if(cardnum == null)
            response.sendRedirect("index.html");
        try{
                Class.forName("com.mysql.jdbc.Driver");
			System.out.println("Driver OK");
			Connection conn=DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/bank",
				"root",
				"1234");
				
		
		String cbal=null;
                String str="select Balance from customer where cardnum='"+cardnum+"' and cvv='"+cvv+"' ";
                
                PreparedStatement stmt=conn.prepareStatement(str);
                //stmt.setInt(1,acc);
                ResultSet rs=stmt.executeQuery();  
                rs.next();
                cbal=rs.getString(1);
                System.out.print("<h3>Customer Balance"+cbal+"</h3>");
                System.out.print("<h3>Final Customer Balance"+(Integer.parseInt(cbal)-amount)+"</h3>");
                if(Integer.parseInt(""+cbal) < amount){
                    message="Insufficient Account Balance";
                }
                else{
                    int mbal=0;
                    String str1="select Balance from customer where acc_no="+macc;
                    
                    
                    PreparedStatement stmt1=conn.prepareStatement(str1);
                    //stmt.setInt(1,macc);
                    ResultSet rs1=stmt1.executeQuery();  
                    rs1.next();
                    mbal=Integer.parseInt(rs1.getString(1));
                    System.out.print("<h3>Merchant Balance"+mbal+"</h3>");
                    mbal+=amount;
                    String str2="update customer set Balance='"+mbal+"' where acc_no="+macc;
                    PreparedStatement stmt2=conn.prepareStatement(str2);
                    System.out.print("<h3>Final Merchant Balance"+mbal+"</h3>");
                    stmt2.execute();  
                    String str3="update customer set Balance='"+(Integer.parseInt(cbal)-amount)+"' where cardnum="+cardnum;
                    PreparedStatement stmt3=conn.prepareStatement(str3);
                    
                    stmt3.execute(); 
                    message="Paid Succesfully";
                }
                
            }    
            catch(SQLException s){
                    System.out.println(s);
                    //response.sendRedirect("index.html");
                    //out.println("alert(message);");
                } 
                //out.print("<h1>"+message+"</h1>");
                
                
        %>
        
         <div class="card">
      <div style="border-radius:200px; height:200px; width:200px; background: #F8FAF5; margin:0 auto;">
        <!--i class="checkmark">✓</i-->
        <img src="img/checkmark.gif" height="200px" width="200px" loop="1">
      </div>
        <h1>Success</h1> 
        <p>We received your payment;<br/> we'll be in touch shortly!</p>
      </div>
        
    </body>
</html>
