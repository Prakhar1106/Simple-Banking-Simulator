<%-- 
    Document   : debitcard
    Created on : Jan 2, 2021, 4:46:37 PM
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
        String pin=request.getParameter("pin");
        String type=request.getParameter("cards");
        String num=null,cvv=null, name=null;
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
                if(acc==rs.getInt("acc_no")&& pin.equals(rs.getString("pin"))){
                    String card=generateCardNumber();
                    name=rs.getString("cname");
                    num=card.substring(0,12);
                    cvv=card.substring(13);
                    String st1="UPDATE customer SET debitcardtype = '"+type+"', cardnum = '"+num+"', cvv = '"+cvv+"' WHERE acc_no= ? ;";
                    try{
                        PreparedStatement st=conn.prepareStatement(st1);
                        st.setInt(1,acc);
                        st.execute();
                    }
                    catch(SQLException sq){System.out.println("error in feeding");}
                }
                else{
                out.println("<script type=\"text/javascript\">"
                        + "alert(\"Invalid Credentials\");"
                        + "</script>");
                response.sendRedirect("applyDebit.html"); 
                }
                
              
                }
                catch(SQLException s){
                    System.out.println(s);
                    response.sendRedirect("index.html"); 
                }
        %>
        <%! 
        public String generateCardNumber(){
        String s=""; 
        long cn = (long) Math.floor(Math.random() * 9_000_000_000_00L) + 1_000_000_000_00L; 
        int cvv= (int) Math.floor(Math.random()*900)+100;
	s=s+cn+" "+cvv;
            return s;
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
         <h4>Card Generated Sucessfully </h4>      
    
   <div class="row">
    <div class="col s3 offset-s4" id="printableArea">
      <div class="card blue-grey darken-1">
        <div class="card-content white-text">
          <span class="card-title"><% out.print(type);%> Card</span>
          <hr><p style="font-size:30px"><% out.print(num.substring(0,4)+"   "+num.substring(4,8)+"   "+num.substring(8));%></p>
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
